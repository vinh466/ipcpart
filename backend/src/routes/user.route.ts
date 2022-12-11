import { updateUserAddress, getOne, getAllUsers, deleteUser, createUser, updateUser } from "@controllers/user.controller";
import { isAdmin, isUser } from "@middlewares/auth.mdw";
import { NextFunction, Request, Response, Router } from "express";

const userRoute = Router();

userRoute.use(function (req, res, next) {
    res.header("Access-Control-Allow-Headers", "x-access-token, Origin, Content-Type, Accept");
    next();
});

userRoute.get('/', isUser, getOne)
userRoute.get('/admin', isAdmin, getAllUsers)
userRoute.post('/admin', isAdmin, createUser)
userRoute.patch('/admin', isAdmin, updateUser)
userRoute.delete('/admin', isAdmin, deleteUser)
userRoute.patch('/profile', isUser, updateUserAddress)
userRoute.get('/setting', isUser, (req: Request, res: Response, next: NextFunction) => {
    res.send('Welcome!! User ' + req.username || 'none');
})
userRoute.get('/adminSetting', isAdmin, (req: Request, res: Response, next: NextFunction) => {
    res.send('Welcome!! User Setting ' + req.username + (req.isAdmin ? 'is Admin' : ' '));
})

export default userRoute;