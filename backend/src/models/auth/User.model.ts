import { ProductId, Product } from "@type/models/product";
import { UserUpdateData } from "@type/models/user";
import { convertRegexpQuery, convertSetUpdateQuery, convertWhereQuery, extractData } from "@utils/convert.util";
import { Connection, OkPacket, Pool, ResultSetHeader, RowDataPacket } from "mysql2/promise";
import { CURRENT_TIMESTAMP } from "..";
import { UserRoleModel } from "./UserRole.model";

interface UserModel {
    username: string;
    email: string;
    name?: string;
    lastname?: string;
    password?: string;
    phone: string;
    roles?: Array<string> | string;
    address?: string;
    city?: string;
    updatedAt?: Date;
    createdAt?: Date;
    deletedAt?: Date;
}
interface UserRowData extends UserModel, RowDataPacket {
}

export default class User {
    Database: Pool;
    findByUsernameQuery =
        "SELECT `users`.`username`,`email`,`name`, `lastname`, `address`, `city`, `phone`,JSON_ARRAYAGG(`user_roles`.`roleName`) AS roles," +
        "`users`.`updatedAt`,`users`.`createdAt`,`users`.`deletedAt`" +
        "FROM `users`" +
        "JOIN `user_roles`" +
        "On `users`.`username`  = `user_roles`.`username`" +
        "WHERE `users`.`username` = ?" +
        "GROUP BY `users`.`username`";

    // `name`, `lastname`, `address`, `city`, `phone`,
    constructor(Database: Pool) {
        this.Database = Database
    }
    async getUsers({
        page = 1,
        pageSize = 50,
        where = <{
            "username"?: string[];
            "email"?: string[];
            "name"?: string[];
            "lastname"?: string[];
            "roles"?: string[];
            "address"?: string[];
            "city"?: string[];
            "phone"?: string[];
        }>{}
    } = {}) {
        const selectQuery = "SELECT " +
            "`users`.`username`, " +
            "`email`," +
            "`name`," +
            "`lastname`," +
            "`password`," +
            "`address`," +
            "`city`," +
            "`phone`," +
            "`users`.`updatedAt`," +
            "`users`.`createdAt`," +
            "`users`.`deletedAt`," +
            "JSON_ARRAYAGG(`user_roles`.`roleName`) AS roles "

        const relationQuery =
            "FROM users JOIN `user_roles` On `users`.`username`  = `user_roles`.`username`"

        where = extractData(where)
        const whereQuery = convertWhereQuery([
            { col: 'users.deletedAt', value: 'NULL', operator: 'is', sqlLogical: 'AND' },
            { col: 'user_roles.roleName', value: where.roles, operator: 'REGEXP', sqlLogical: 'AND' },
            [
                { col: 'users.username', value: where.username, operator: 'REGEXP', sqlLogical: 'OR' },
                { col: 'email', value: where.email, operator: 'REGEXP', sqlLogical: 'OR' },
                { col: 'name', value: where.name, operator: 'REGEXP', sqlLogical: 'OR' },
                { col: 'lastname', value: where.lastname, operator: 'REGEXP', sqlLogical: 'OR' },
                { col: 'address', value: where.address, operator: 'REGEXP', sqlLogical: 'OR' },
                { col: 'city', value: where.city, operator: 'REGEXP', sqlLogical: 'OR' },
                { col: 'phone', value: where.phone, operator: 'REGEXP', sqlLogical: 'OR' },
            ],
        ])
        // REGEXP
        try {
            // Get total query record
            const query = selectQuery + relationQuery + whereQuery + ' GROUP BY `users`.`username`;'
            console.log(query)
            let [rawRecords, meta] = await this.Database.query<UserRowData[]>(query);
            // calculate pagination
            const total = rawRecords.length
            let start = (page - 1) * pageSize;
            if (start > total) start = Math.ceil(total / pageSize - 1) * pageSize
            const currPage = start / pageSize + 1;
            rawRecords = rawRecords.slice(start, start + 1 * pageSize)

            rawRecords.forEach(async (element) => {
                const obj = element as UserModel
                obj.roles = await JSON.parse(obj.roles as string);
            });
            return { records: rawRecords, total, currPage }
        } catch (err) {
            console.log(err)
            return false;
        }
    }
    async findByUsername(username: string) {
        try {
            console.log(this.findByUsernameQuery);
            const [result, meta] = await this.Database.query<UserRowData[]>({ sql: this.findByUsernameQuery }, [username])
            if (result[0])
                result[0].roles = JSON.parse(result[0].roles as string);
            return result[0] as UserModel
        } catch (error) {
            console.log(error)
            return null
        }
    }
    async searchPassword(username: string) {
        const searchPassQuery =
            "SELECT `users`.`username`, `email`, `name`, `lastname`, `password`, `address`, `city`, `phone`, `users`.`updatedAt`, `users`.`createdAt`, `users`.`deletedAt`" +
            ",JSON_ARRAYAGG(`user_roles`.`roleName`) AS roles " +
            "FROM users JOIN `user_roles` On `users`.`username`  = `user_roles`.`username` WHERE `users`.`username` = ? GROUP BY `users`.`username`;"
        try {
            const [result, meta] = await this.Database.query<UserRowData[]>({ sql: searchPassQuery }, [username])
            if (result[0])
                result[0].roles = JSON.parse(result[0].roles as string);
            return result[0]
        } catch (error) {
            console.log(error)
            return null
        }
    }
    /**
     * add new user with a roles
     * @param user user need to create
     * @param role list role for user (default 'user')
     * @returns user information or null
     */
    async create(user: UserModel, roles = ['user']) {
        const addUserQuery = "INSERT INTO users (`username`, `password`, `email`, `name`, `lastname`, `address`, `city`, `phone`)  VALUES (?)"
        const addUserRoleQuery = "INSERT INTO user_roles (username, roleName) VALUES (?)"
        try {
            const conn = await this.Database.getConnection();
            try {
                await conn.beginTransaction()
                await conn.query<ResultSetHeader>({ sql: addUserQuery }, [Object.values(user)])
                roles.forEach(async (role) => {
                    await conn.query<ResultSetHeader>({ sql: addUserRoleQuery }, [[user.username, role]])
                })
                conn.commit();
                const [result, meta] = await conn.query<UserRowData[]>(this.findByUsernameQuery, [user.username])
                if (result[0])
                    result[0].roles = JSON.parse(result[0].roles as string);
                return result[0]
            } catch (error) {
                await conn.rollback();
                throw error
            } finally {
                conn.release();
            }
        } catch (error) {
            console.log(error)
            return null
        }
    };
    async updateProfile(username: string, data: UserUpdateData) {
        const query = "UPDATE`users`" +
            "SET" +
            convertSetUpdateQuery(data) +
            ` WHERE\`username\` = '${username}';`
        try {
            console.log(query);
            const [result, meta] = await this.Database.query<ResultSetHeader>({ sql: query })
            return result
        } catch (error) {
            console.log(error)
            return null
        }
    }

    async remove(productId: string) {
        const removeProductQuery = 'UPDATE `users` SET deletedAt = ? WHERE username = ?'
        try {
            const conn = await this.Database.getConnection();
            try {
                await conn.beginTransaction()
                const result = await conn.query<ResultSetHeader>({ sql: removeProductQuery }, [CURRENT_TIMESTAMP, productId,])
                conn.commit();
                console.log(result);
                return result
            } catch (error) {
                await conn.rollback();
                throw error
            } finally {
                conn.release();
            }
        } catch (error) {
            console.log(error)
            return null
        }
    }
}
