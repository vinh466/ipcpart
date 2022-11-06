import { Sequelize } from "sequelize";
import { config } from "configs/sequelize.config";
import { v4 as uuidv4 } from 'uuid';

export const Database = new Sequelize(config.db, config.user, config.password, {
    host: config.host,
    dialect: config.dialect,
    port: config.port,
    timezone: config.timezone,
    pool: {
        max: config.pool.max,
        min: config.pool.min,
        acquire: config.pool.acquire,
        idle: config.pool.idle
    }
});

import userModel from "./User.model";
import roleModel from "./Role.model";
import refreshTokenModel from "./RefreshToken.model";
import userRoleTableModel from "./UserRole.model";
import userRoldModel from './UserRole.model';

const UserModel = userModel(Database);
const RoleModel = roleModel(Database);
const UserRoleModel = userRoldModel(Database);
const RefreshTokenModel = refreshTokenModel(Database);
const UserRoleTableModel = userRoleTableModel(Database);

UserModel.Table.belongsToMany(RoleModel.Table, {
    through: "user_roles",
    foreignKey: "username",
    otherKey: "roleName"
});

RoleModel.Table.belongsToMany(UserModel.Table, {
    through: "user_roles",
    foreignKey: "roleName",
    otherKey: "username"
});
RefreshTokenModel.Table.belongsTo(UserModel.Table, {
    foreignKey: 'username', targetKey: 'username'
});
UserModel.Table.hasMany(RefreshTokenModel.Table, {
    foreignKey: 'username', sourceKey: 'username'
});

// Database.sync({ force: true }).then(async () => {
//     try {
//         let role = await RoleModel.Table.create({ roleName: 'user' })
//         await RoleModel.Table.create({ roleName: 'admin' })
//         await RoleModel.Table.create({ roleName: 'moderator' })
//         let userintance
//         let username = uuidv4()
// userintance = await UserModel.Table.create({ username: username, email: 'email', password: 'asdasdasd', }, { ignoreDuplicates: true });
//         await RefreshTokenModel.Table.create({ refreshToken: uuidv4(), username: username, expiryDate: 123213123 }, { ignoreDuplicates: true });
//         // @ts-ignore
// await userintance.addRoles('user');

//         username = uuidv4()
//         userintance = await UserModel.Table.create({ username: username, email: 'email2', password: 'asdasdasd222', }, { ignoreDuplicates: true });
//         await RefreshTokenModel.Table.create({ refreshToken: uuidv4(), username: username, expiryDate: 123213123 }, { ignoreDuplicates: true });
//         // @ts-ignore
//         await userintance.addRoles('user');
//         // @ts-ignore
//         await userintance.addRoles('admin');

//         const user = await UserModel.Table.findAll({ include: [RefreshTokenModel.Table, RoleModel.Table] });
//         console.log(JSON.stringify(user, null, 2));


//         await UserModel.somethings(231);

//     } catch (error) {
//         console.log(error)
//     }
// });

export {
    UserModel,
    RoleModel,
    UserRoleModel,
    RefreshTokenModel,
    UserRoleTableModel,
}