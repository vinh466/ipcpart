import { NextFunction, Request, Response, Router } from "express";
import { isAdmin, isUser } from "@middlewares/auth.mdw";
import { getMainboard } from "@controllers/products/mainboard.controller";

const mainboardRoute = Router();

mainboardRoute.use(function (req, res, next) {
    res.header("Access-Control-Allow-Headers", "x-access-token, Origin, Content-Type, Accept");
    next();
});

mainboardRoute.get('/', getMainboard);

// mainboardRoute.get('/test')

export default mainboardRoute;