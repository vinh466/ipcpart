import { Pool, ResultSetHeader, RowDataPacket } from "mysql2/promise";

export interface UserRoleModel {
    username: string;
    roleName: string;
}
interface UserRoleRowData extends UserRoleModel, RowDataPacket { }

export default class UserRole {
    Database: Pool;

    constructor(Database: Pool) {
        this.Database = Database
    }

    createUserRole(username: string) { };

    create(userRole: UserRoleModel): Promise<ResultSetHeader> {
        const query = "INSERT INTO users (username, roleName) VALUES ?"
        return new Promise(async (resolve, reject) => {
            try {
                console.log([[Object.values(userRole)]])
                const [result, meta] = await this.Database.query<ResultSetHeader>({ sql: query }, [[Object.values(userRole)]])
                resolve(result)
            } catch (error) {
                console.log(error)
                reject(error)
            }
        })
    };
}