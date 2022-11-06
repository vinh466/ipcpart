import { Sequelize, Model, DataTypes, CreationOptional, InferAttributes, InferCreationAttributes } from 'sequelize';

interface UserRoleTableModel extends Model<InferAttributes<UserRoleTableModel>, InferCreationAttributes<UserRoleTableModel>> {
    // Some fields are optional when calling UserRoleTableModel.create() or UserRoleTableModel.build()
    username: string;
    roleName: string;
}

export default (Database: Sequelize) => {
    const Table = Database.define<UserRoleTableModel>('user_roles', {
        // Model attributes are defined here
        username: {
            type: DataTypes.STRING,
            primaryKey: true
        },
        roleName: {
            type: DataTypes.STRING,
            primaryKey: true
        }
    });

    return {
        Table
    }
}