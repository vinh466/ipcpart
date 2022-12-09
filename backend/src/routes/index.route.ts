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
Route.use('/test', async (req, res) => {
    const sqlQuery = req.query.sql as string
    console.log(sqlQuery);
    const [result, meta] = await Models.Database.query<RowDataPacket[]>(sqlQuery);
    var arr = []
    console.log(result[0]);
    for (const item of result) {
        const [key, value] = Object.entries(item)[0]
        arr.push(value)
    }
    res.status(200).json(arr)
});


export default Route;