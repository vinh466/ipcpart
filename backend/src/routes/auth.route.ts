import { NextFunction, Request, Response, Router } from "express";
import { body, validationResult } from 'express-validator';

import { refreshToken, signIn, logout, signUp, adminSignIn } from "@controllers/auth.controller";
import { validateForm, validateLoginForm, validateRegisterForm, } from "@middlewares/requestValidator.mdw";
import { isUser } from "@middlewares/auth.mdw";
import { Models } from "@models/index";

const authRoute = Router();

authRoute.use(function (req, res, next) {
    res.header("Access-Control-Allow-Headers", "x-access-token, refreshtoken, Origin, Content-Type, Accept");
    res.header("Access-Control-Allow-Methods", "GET, POST");

    next();
});

authRoute.get('/', async (req: Request, res: Response, next: NextFunction) => {
    let rs = await Models.User.findByUsername('vinh466')
    res.send(rs);
})


authRoute.post('/signup', validateRegisterForm, validateForm, signUp)

authRoute.post('/admin/signin', validateLoginForm, validateForm, adminSignIn)

authRoute.post('/signin', validateLoginForm, validateForm, signIn)

authRoute.post('/logout', logout)

authRoute.post('/refreshToken', refreshToken)

authRoute.post('/test', async (req, res) => {
    console.log(req.query.username);
    const isExist = await Models.User.findByUsername(req.query.username as string)
    res.status(200).json(isExist);
})

export default authRoute;