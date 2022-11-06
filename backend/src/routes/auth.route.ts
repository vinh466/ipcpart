import { NextFunction, Request, Response, Router } from "express";
import { body, validationResult } from 'express-validator';

import { refreshToken, signIn, logout, signUp } from "@controllers/auth.controller";
import { validateLogin, validateRegisterUser } from "@middlewares/requestValidator.mdw";
import { isUser } from "@middlewares/auth.mdw";

const authRoute = Router();

authRoute.use(function (req, res, next) {
    res.header("Access-Control-Allow-Headers", "x-access-token, refreshtoken, Origin, Content-Type, Accept");
    res.header("Access-Control-Allow-Methods", "GET, POST");

    next();
});

authRoute.get('/', isUser, (req: Request, res: Response, next: NextFunction) => {
    res.send('Welcome to Auth Route');
})


authRoute.post('/signup', validateRegisterUser, signUp)

authRoute.post('/signin', validateLogin, signIn)

authRoute.post('/logout', logout)

authRoute.post('/refreshToken', refreshToken)

export default authRoute;