import { NextFunction, Request, Response, Router } from "express";
import { isAdmin, isUser } from "@middlewares/auth.mdw";
import { getMonitors } from "@controllers/products/monitor.controller";

const monitorRoute = Router();

monitorRoute.use(function (req, res, next) {
    res.header("Access-Control-Allow-Headers", "x-access-token, Origin, Content-Type, Accept");
    next();
});

monitorRoute.get('/', getMonitors)

// monitorRoute.get('/test')

export default monitorRoute;