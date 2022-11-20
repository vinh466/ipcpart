import { NextFunction, Request, Response, Router } from "express";
import { isAdmin, isUser } from "@middlewares/auth.mdw";
import { getVideoCards } from "@controllers/products/videocard.controller";

const videoCardRoute = Router();

videoCardRoute.use(function (req, res, next) {
    res.header("Access-Control-Allow-Headers", "x-access-token, Origin, Content-Type, Accept");
    next();
});

videoCardRoute.get('/', getVideoCards)

// videoCardRoute.get('/test')

export default videoCardRoute;