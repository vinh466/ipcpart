import { Sequelize, Model, DataTypes, CreationOptional, InferAttributes, InferCreationAttributes } from 'sequelize';
import { Database } from './Database';

interface RoleTableModel extends Model<InferAttributes<RoleTableModel>, InferCreationAttributes<RoleTableModel>> {
    // Some fields are optional when calling RoleTableModel.create() or RoleTableModel.build()
    roleName: string;
}

export default (Database: Sequelize) => {
    const Table = Database.define<RoleTableModel>('roles', {
        // Model attributes are defined here
        roleName: {
            type: DataTypes.STRING,
            primaryKey: true
        }
    });

    return {
        Table
    }
}