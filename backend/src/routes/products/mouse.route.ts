import { NextFunction, Request, Response, Router } from "express";
import { isAdmin, isUser } from "@middlewares/auth.mdw";
import { getMouses } from "@controllers/products/mouse.controller";

const mouseRoute = Router();

mouseRoute.use(function (req, res, next) {
    res.header("Access-Control-Allow-Headers", "x-access-token, Origin, Content-Type, Accept");
    next();
});

mouseRoute.get('/', getMouses)

// mouseRoute.get('/test')

export default mouseRoute;