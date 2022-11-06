import { NextFunction, Request, Response, Router } from "express";
import authRoute from "./auth.route";
import userRoute from "./user.route";

const Route = Router();

Route.get('/', (req: Request, res: Response, next: NextFunction) => {
    res.json('Welcome to server !!!')
})
Route.use('/user', userRoute)
Route.use('/auth', authRoute)

export default Route;