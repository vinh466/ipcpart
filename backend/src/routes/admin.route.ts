import { getAdmin } from "@controllers/admin.controler";
import { updateUserAddress, getOne } from "@controllers/user.controller";
import { isAdmin, isUser } from "@middlewares/auth.mdw";
import { NextFunction, Request, Response, Router } from "express";

const adminRoute = Router();

adminRoute.use(function (req, res, next) {
    res.header("Access-Control-Allow-Headers", "x-access-token, Origin, Content-Type, Accept");
    next();
});

adminRoute.get('/', isAdmin, getAdmin)
adminRoute.get('/profile', isUser, (req: Request, res: Response, next: NextFunction) => {
    res.send('Welcome to Admin Profile');
})

export default adminRoute;