import { Models } from "@models/index";
import { NextFunction, Request, Response, Router } from "express";
import authRoute from "./auth.route";
import userRoute from "./user.route";
import productRoute from "./products/product.route";
import { convertRegexpQuery, convertStringToArray } from "@utils/convert.util";
import { RowDataPacket } from "mysql2";
import orderRoute from "./order.route";
import adminRoute from "./admin.route";
import staffRoute from "./staff.route";

const Route = Router();

Route.get('/', (req: Request, res: Response, next: NextFunction) => {
    res.json({ msg: 'Welcome to server !!!' });
})
Route.use('/user', userRoute);
Route.use('/admin', adminRoute);
Route.use('/staff', staffRoute);
Route.use('/auth', authRoute);
Route.use('/product', productRoute);
Route.use('/order', orderRoute);


export default Route;