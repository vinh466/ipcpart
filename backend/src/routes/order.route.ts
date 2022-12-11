import { getAllOrders, getOrders, insertOne, updateOrder } from "@controllers/order.controller";
import { updateUserAddress } from "@controllers/user.controller";
import { isAdmin, isStaff, isUser } from "@middlewares/auth.mdw";
import { NextFunction, Request, Response, Router } from "express";

const orderRoute = Router();

orderRoute.use(function (req, res, next) {
    res.header("Access-Control-Allow-Headers", "x-access-token, Origin, Content-Type, Accept");
    next();
});

orderRoute.get('/', isUser, getOrders)
orderRoute.post('/', isUser, insertOne)
orderRoute.get('/admin/', isStaff, getAllOrders)
orderRoute.patch('/admin/', isStaff, updateOrder)

export default orderRoute;