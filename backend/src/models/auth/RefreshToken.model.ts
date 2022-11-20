
import { nestedConvert } from "@utils/convert.util";
import { v4 as uuidv4 } from 'uuid';
import { Connection, OkPacket, Pool, ResultSetHeader, RowDataPacket, } from "mysql2/promise";
import jwtConfig from "@configs/jwt.config";

interface RefreshTokenModel {
    refreshToken: string;
    username: string;
    expiryDate: number | Date;
}
interface RefreshTokenRowData extends RefreshTokenModel, RowDataPacket { }
var CURRENT_TIMESTAMP = { toSqlString: function () { return 'CURRENT_TIMESTAMP()'; } };
export default class RefreshToken {
    Database: Pool;

    constructor(Database: Pool) {
        this.Database = Database
    }

    async create(username: string) {
        try {
            let expiredAt = new Date();
            const _refreshToken = uuidv4();
            const query = 'INSERT INTO refreshtokens (refreshToken, username, expiryDate) VALUE (?)'
            expiredAt.setSeconds(expiredAt.getSeconds() + jwtConfig.jwtRefreshExpiration);

            let refreshToken = await this.Database.query(query, [[_refreshToken, username, expiredAt]])
            console.log(_refreshToken)
            return _refreshToken;
        } catch (err) {
            console.log(err)
            return null
        }
    };
    async findByPk(refreshToken: string) {
        const query = "SELECT * from `refreshtokens` WHERE `refreshToken` = ?";
        try {
            const [result, meta] = await this.Database.query<RefreshTokenRowData[]>(query, [refreshToken]);
            return result[0];
        } catch (error) {
            console.log(error);
            return null;
        }
    }
    async remove(refreshToken: string) {
        const query = "Delete from `refreshtokens` WHERE `refreshToken` = ?";
        try {
            const [result, meta] = await this.Database.query<ResultSetHeader>(query, [refreshToken]);
            console.log(result)
            return result;
        } catch (error) {
            console.log(error);
            return null;
        }
    }
    verifyExpiration(token: RefreshTokenModel) {
        return (token.expiryDate as Date).getTime() < new Date().getTime();
    };
}