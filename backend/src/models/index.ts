import mysql, { escape, Pool } from "mysql2/promise";
import * as dotenv from "dotenv";
import config from '@configs/mysql.config'
import RefreshToken from "@models/auth/RefreshToken.model";
import Role from "@models/auth/Role.model";
import UserRole from "@models/auth/UserRole.model";
import User from "@models/auth/User.model";
import Cpu from "@models/products/Cpu.model";
import CpuType from "@models/products/CpuType.model";
import Mainboard from "@models/products/Mainboard.model";
import MainboardChipset from "@models/products/MainbroadChipset.model";
import Monitor from "@models/products/Monitor.model";
import Mouse from "@models/products/Mouse.model";
import Ram from "@models/products/Ram.model";
import RamStandard from "@models/products/RamStandard.model";
import StorageDrive from "@models/products/StorageDrive.model";
import GpuChipset from "@models/products/GpuChipset.model";
import Videocard from "@models/products/VideoCard.model";
import Product from "@models/products/Product.model";
import Producer from "@models/products/Producer.model";
import Order from "@models/order/Order.model";
dotenv.config();

const Database: mysql.Pool = mysql.createPool({
    host: config.host,
    port: config.port,
    user: config.user,
    password: config.password,
    database: config.database,
    waitForConnections: config.waitForConnections,
    connectionLimit: config.connectionLimit,
    queueLimit: config.queueLimit,
})

const connectionAuthenticate = () => {
    return new Promise<boolean>(async (resolve, reject) => {
        const con = await Database.getConnection();
        try {

            con.release();
            resolve(true);

        } catch (error) {
            reject(error)
        }
    })
}
const Models = {
    Database,
    RefreshToken: new RefreshToken(Database),
    Role: new Role(Database),
    UserRole: new UserRole(Database),
    User: new User(Database),
    Cpu: new Cpu(Database),
    CpuType: new CpuType(Database),
    Mainboard: new Mainboard(Database),
    MainboardChipset: new MainboardChipset(Database),
    Monitor: new Monitor(Database),
    Mouse: new Mouse(Database),
    Ram: new Ram(Database),
    RamStandard: new RamStandard(Database),
    StorageDrive: new StorageDrive(Database),
    Videocard: new Videocard(Database),
    GpuChipset: new GpuChipset(Database),
    Product: new Product(Database),
    Producer: new Producer(Database),
    Order: new Order(Database),
};
const CURRENT_TIMESTAMP = { toSqlString: function () { return 'CURRENT_TIMESTAMP()'; } };
export { Models, Database, connectionAuthenticate, CURRENT_TIMESTAMP }

