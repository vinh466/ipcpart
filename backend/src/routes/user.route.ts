import { isAdmin, isUser } from "@middlewares/auth.mdw";
import { NextFunction, Request, Response, Router } from "express";

const userRoute = Router();

userRoute.use(function (req, res, next) {
    res.header("Access-Control-Allow-Headers", "x-access-token, Origin, Content-Type, Accept");
    next();
});

userRoute.get('/', (req: Request, res: Response, next: NextFunction) => {
    res.send('Welcome to User Route');
})
userRoute.get('/profile', isUser, (req: Request, res: Response, next: NextFunction) => {
    res.send('Welcome to User Profile');
})
userRoute.get('/setting', isUser, (req: Request, res: Response, next: NextFunction) => {
    res.send('Welcome!! User ' + req.username || 'none');
})
userRoute.get('/adminSetting', isAdmin, (req: Request, res: Response, next: NextFunction) => {
    res.send('Welcome!! User Setting ' + req.username + (req.isAdmin ? 'is Admin' : ' '));
})

export default userRoute;