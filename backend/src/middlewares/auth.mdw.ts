import jwtConfig from "@configs/jwt.config";
import { Models } from "@models/index";
import { Token } from "@type/models/token";
import { NextFunction, Request, Response } from "express";
import { StatusCodes } from "http-status-codes";
import jwt, { TokenExpiredError } from 'jsonwebtoken';

const catchError = (err: Error, res: Response) => {
    if (err instanceof TokenExpiredError) {
        return res.status(401).send({ message: "Unauthorized! Access Token was expired!" });
    }
    return res.status(StatusCodes.FORBIDDEN).send({ message: "Unauthorized!" });
}

export const isUser = (req: Request, res: Response, next: NextFunction) => {
    let bearerToken = req.headers.authorization as string;
    if (!bearerToken) return res.status(401).send({ message: "No token provided!" });

    let token = bearerToken.slice(7);
    jwt.verify(token, jwtConfig.secret, (err, decoded) => {
        if (err) return catchError(err, res);

        req.username = (decoded as unknown as Token).username;
        req.role = (decoded as unknown as Token).role;
        console.log("authorization:");
        console.log(decoded);
        next();
    });
};

export const isAdmin = (req: Request, res: Response, next: NextFunction) => {
    let bearerToken = req.headers.authorization as string;
    if (!bearerToken) return res.status(401).send({ message: "No token provided!" });

    let token = bearerToken.slice(7);
    jwt.verify(token, jwtConfig.secret, (err, decoded) => {
        if (err) return catchError(err, res);

        req.username = (decoded as unknown as Token).username;
        req.role = (decoded as unknown as Token).role;
        console.log(decoded);
        if (req.role === 'admin') {
            console.log("authorization:");
            next();
        } else {
            catchError(new Error('Unauthorized'), res)
        }
    });
};

export const isStaff = (req: Request, res: Response, next: NextFunction) => {
    let bearerToken = req.headers.authorization as string;
    if (!bearerToken) return res.status(401).send({ message: "No token provided!" });

    let token = bearerToken.slice(7);
    jwt.verify(token, jwtConfig.secret, (err, decoded) => {
        if (err) return catchError(err, res);

        req.username = (decoded as unknown as Token).username;
        req.role = (decoded as unknown as Token).role;
        console.log(decoded);
        if (['admin', 'staff'].includes(req.role)) {
            console.log("authorization:");
            next();
        } else {
            catchError(new Error('Unauthorized'), res)
        }
    });
};