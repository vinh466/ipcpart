import jwtConfig from "@configs/jwt.config";
import { Models } from "@models/index";
import { Token } from "@type/models/token";
import { NextFunction, Request, Response } from "express";
import jwt, { TokenExpiredError } from 'jsonwebtoken';

const catchError = (err: Error, res: Response) => {
    if (err instanceof TokenExpiredError) {
        return res.status(401).send({ message: "Unauthorized! Access Token was expired!" });
    }
    return res.status(403).send({ message: "Unauthorized!" });
}

export const isUser = (req: Request, res: Response, next: NextFunction) => {
    let bearerToken = req.headers.authorization as string;
    if (!bearerToken) return res.status(401).send({ message: "No token provided!" });

    let token = bearerToken.slice(7);
    jwt.verify(token, jwtConfig.secret, (err, decoded) => {
        if (err) return catchError(err, res);

        req.username = (decoded as unknown as Token).username;
        console.log(decoded);
        next();
    });
};

export const isAdmin = (req: Request, res: Response, next: NextFunction) => {
    let token = req.headers["x-access-token"] as string;
    if (!token) return res.status(401).send({ message: "No token provided!" });

    jwt.verify(token, jwtConfig.secret, async (err, decoded) => {
        if (err) return catchError(err, res);

        // const userRole = await Models.UserRole.Table.findByPk((decoded as Token).username)
        // if (userRole && userRole.roleName === 'admin') req.isAdmin = true;
        else return catchError(new Error(), res);

        req.username = (decoded as unknown as Token).username;
        next();
    });
};