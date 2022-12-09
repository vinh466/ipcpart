import { NextFunction, Request, Response, Router } from "express";
import { isAdmin, isUser } from "@middlewares/auth.mdw";
import { getRams, getOptions } from "@controllers/products/ram.controller";

const ramRoute = Router();

ramRoute.use(function (req, res, next) {
    res.header("Access-Control-Allow-Headers", "x-access-token, Origin, Content-Type, Accept");
    next();
});

ramRoute.get('/', getRams)
ramRoute.get('/getOptions', getOptions)

// ramRoute.get('/test')

export default ramRoute;