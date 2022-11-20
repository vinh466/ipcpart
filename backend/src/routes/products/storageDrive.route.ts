import { NextFunction, Request, Response, Router } from "express";
import { isAdmin, isUser } from "@middlewares/auth.mdw";
import { getStorageDrives } from "@controllers/products/storageDrive.controller";

const storageDriveRoute = Router();

storageDriveRoute.use(function (req, res, next) {
    res.header("Access-Control-Allow-Headers", "x-access-token, Origin, Content-Type, Accept");
    next();
});

storageDriveRoute.get('/', getStorageDrives)

// storageDriveRoute.get('/test')

export default storageDriveRoute;