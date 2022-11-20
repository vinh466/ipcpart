import { Models } from "@models/index";
import { NextFunction, Request, Response, Router } from "express";
import authRoute from "./auth.route";
import userRoute from "./user.route";
import cpuRoute from "./products/cpu.route";
import mainboardRoute from "./products/mainboard.route";
import monitorRoute from "./products/monitor.route";
import ramRoute from "./products/ram.route";
import storageDriveRoute from "./products/storageDrive.route";
import mouseRoute from "./products/mouse.route";
import videoCardRoute from "./products/videocard.route";

const Route = Router();

Route.get('/', (req: Request, res: Response, next: NextFunction) => {
    res.json({ msg: 'Welcome to server !!!' });
})
Route.use('/user', userRoute);
Route.use('/auth', authRoute);
Route.use('/product/cpu', cpuRoute);
Route.use('/product/mainboard', mainboardRoute);
Route.use('/product/monitor', monitorRoute);
Route.use('/product/ram', ramRoute);
Route.use('/product/storage-drive', storageDriveRoute);
Route.use('/product/mouse', mouseRoute);
Route.use('/product/video-card', videoCardRoute);


export default Route;