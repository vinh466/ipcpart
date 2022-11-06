

import { Role } from '@type/models/role';
import { UserSignUp } from '@type/models/user';
import { Sequelize, Model, DataTypes, CreationOptional, InferAttributes, InferCreationAttributes } from 'sequelize';
import { RefreshTokenModel } from './Database';

// We recommend you declare an interface for the attributes, for stricter typechecking

interface UserTableModel extends Model<InferAttributes<UserTableModel>, InferCreationAttributes<UserTableModel>> {
    // Some fields are optional when calling UserTableModel.create() or UserTableModel.build()
    username: string;
    email: string;
    password?: string;
    updatedAt?: Date;
    createdAt?: Date;
}

export default (Database: Sequelize) => {
    const Table = Database.define<UserTableModel>('Users', {
        // Model attributes are defined here
        username: {
            type: DataTypes.STRING,
            allowNull: false,
            primaryKey: true
        },
        email: {
            type: DataTypes.STRING,
        },
        password: {
            type: DataTypes.STRING,
        },
        updatedAt: {
            type: DataTypes.DATE,
        }
        ,
        createdAt: {
            type: DataTypes.DATE,
            allowNull: false
        }
    });
    async function somethings(params: number) {
        let a = await RefreshTokenModel.Table.findAll()
        console.log(JSON.stringify(a, null, 2))
    }

    async function addUser(user: UserSignUp, role: Role) {

    }

    return {
        Table,
        somethings
    }
}
