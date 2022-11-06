import { User } from '@type/models/user';
import { Sequelize, Model, DataTypes, InferAttributes, InferCreationAttributes, } from 'sequelize';
import config from '@configs/jwt.config'
import { v4 as uuidv4 } from 'uuid';
import { RefreshToken } from '@type/models/token';
import jwtConfig from '@configs/jwt.config';
import jwt from 'jsonwebtoken';

// We recommend you declare an interface for the attributes, for stricter typechecking

interface RefreshTokenTableModel extends Model<InferAttributes<RefreshTokenTableModel>, InferCreationAttributes<RefreshTokenTableModel>> {
    // Some fields are optional when calling RefreshTokenTableModel.create() or RefreshTokenTableModel.build()
    refreshToken: string;
    username: string;
    expiryDate: number | Date;
}

export default (Database: Sequelize) => {
    const Table = Database.define<RefreshTokenTableModel>('refreshtokens', {
        refreshToken: {
            type: DataTypes.STRING,
            allowNull: false,
            primaryKey: true
        },
        username: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        expiryDate: {
            type: DataTypes.DATE,
        },
    });

    const createRefreshToken = async function (username: string): Promise<string> {
        let expiredAt = new Date();

        const _refreshToken = uuidv4();

        expiredAt.setSeconds(expiredAt.getSeconds() + config.jwtRefreshExpiration);
        let refreshToken = await Table.create({
            refreshToken: _refreshToken,
            username: username,
            expiryDate: expiredAt.getTime(),
        });
        console.log(refreshToken.refreshToken)
        return _refreshToken;
    };

    const verifyExpiration = (token: RefreshToken) => {
        return token.expiryDate.getTime() < new Date().getTime();
    };

    return {
        Table,
        createRefreshToken,
        verifyExpiration,
    }
}