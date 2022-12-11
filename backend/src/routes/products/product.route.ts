import { NextFunction, Request, Response, Router } from "express";
import { isAdmin, isUser } from "@middlewares/auth.mdw";
import { getRams } from "@controllers/products/ram.controller";
import cpuRoute from "./cpu.route";
import mainboardRoute from "./mainboard.route";
import monitorRoute from "./monitor.route";
import ramRoute from "./ram.route";
import storageDriveRoute from "./storageDrive.route";
import mouseRoute from "./mouse.route";
import videoCardRoute from "./videocard.route";
import { getProducts, removeProducts, searchProducts } from "@controllers/products/product.controller";

const productRoute = Router();

productRoute.use(function (req, res, next) {
    res.header("Access-Control-Allow-Headers", "x-access-token, Origin, Content-Type, Accept");
    next();
});

productRoute.get('/', getProducts)
productRoute.get('/search', searchProducts)
productRoute.get('/admin', getProducts)
productRoute.delete('/admin', isAdmin, removeProducts)
productRoute.use('/cpu', cpuRoute);
productRoute.use('/mainboard', mainboardRoute);
productRoute.use('/monitor', monitorRoute);
productRoute.use('/ram', ramRoute);
productRoute.use('/storage-drive', storageDriveRoute);
productRoute.use('/mouse', mouseRoute);
productRoute.use('/video-card', videoCardRoute);

// productRoute.get('/test')

export default productRoute;