import { Op } from "sequelize";
import { Dialect } from "sequelize/types/sequelize";

export const config = {
    host: "localhost",
    port: 3360,
    user: "root",
    password: "",
    db: "testdb2",
    timezone: '+07:00',
    dialect: <Dialect>"mysql",
    pool: {
        max: 5,
        min: 0,
        acquire: 30000,
        idle: 10000
    }
};
