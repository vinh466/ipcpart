import { ProductId, Product } from "@type/models/product";
import { Connection, OkPacket, Pool, ResultSetHeader, RowDataPacket } from "mysql2/promise";
import { UserRoleModel } from "./UserRole.model";

interface UserModel {
    username: string;
    email: string;
    password?: string;
    updatedAt?: Date;
    createdAt?: Date;
    deletedAt?: Date;
}
interface UserRowData extends UserModel, RowDataPacket {
    roles: UserRoleModel[] | string
}

export default class User {
    Database: Pool;
    findByUsernameQuery =
        "SELECT `users`.`username`,`email`,JSON_ARRAYAGG(`user_roles`.`roleName`) AS roles," +
        "`users`.`updatedAt`,`users`.`createdAt`,`users`.`deletedAt`" +
        "FROM `users`" +
        "JOIN `user_roles`" +
        "On `users`.`username`  = `user_roles`.`username`" +
        "WHERE `users`.`username` = ?" +
        "GROUP BY `users`.`username`";

    constructor(Database: Pool) {
        this.Database = Database
    }

    async findByUsername(username: string) {
        try {
            console.log(this.findByUsernameQuery);
            const [result, meta] = await this.Database.query<UserRowData[]>({ sql: this.findByUsernameQuery }, [username])
            if (result[0])
                result[0].roles = JSON.parse(result[0].roles as string);
            return result[0]
        } catch (error) {
            console.log(error)
            return null
        }
    }
    async searchPassword(username: string) {
        const searchPassQuery = "SELECT username, password, email, createdAt, updatedAt FROM users WHERE `users`.`username` = ?;"
        try {
            const [result, meta] = await this.Database.query<UserRowData[]>({ sql: searchPassQuery }, [username])
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
        const addUserQuery = "INSERT INTO users (username, password, email) VALUES (?)"
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
}
