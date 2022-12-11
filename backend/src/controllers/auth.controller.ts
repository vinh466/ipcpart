import { Models } from "@models/index";
import e, { Request, Response } from "express";
import bcrypt from 'bcryptjs'
import jwt from 'jsonwebtoken';
import jwtConfig from "@configs/jwt.config";
import { StatusCodes } from 'http-status-codes';
import { Token } from "@type/models/token";


export const createAccessToken = async (username: string, role = 'user') => {
    let tokenExpired = jwtConfig.jwtExpiration;

    const token = await jwt.sign(
        { username: username, iat: 0, role },
        jwtConfig.secret,
        { expiresIn: tokenExpired }
    );
    tokenExpired = tokenExpired + Math.floor(Date.now() / 1000)
    return { token, tokenExpired };
}
/**
 * @status 200 OK
 * @status 409 User exist
 * @status 500 Server Cannot create
 */
export const signUp = async (req: Request, res: Response) => {
    const userData = {
        username: req.body.user.username as string,
        password: bcrypt.hashSync(req.body.user.password),
        email: req.body.user.email,
        name: req.body.user.name,
        lastname: req.body.user.lastname,
        address: '',
        city: '',
        phone: '',
    }
    try {
        const isExist = await Models.User.findByUsername(req.body.user.username)
        console.log(isExist)
        if (!isExist) {

            const user = await Models.User.create(userData)
            if (user) {
                res.status(StatusCodes.OK).json(user);
            } else {
                res.status(StatusCodes.INTERNAL_SERVER_ERROR).json({ msg: "Currently cannot add, please try again" });
            }
            return;
        } else res.status(StatusCodes.CONFLICT).json({ err: 'User is exist' });
    } catch (error) {
        res.status(StatusCodes.INTERNAL_SERVER_ERROR).send(error);
    }
};
/**
 * @status 200 OK
 * @status 401 Invalid Password
 * @status 404 Invalid User
 * @status 500 Server Error
 */
export const signIn = async (req: Request, res: Response) => {
    const signInData = {
        username: req.body.user.username as string,
        password: req.body.user.password,
    }
    try {
        const user = await Models.User.searchPassword(req.body.user.username)
        console.log(user)
        if (user) {
            const passwordIsValid = await bcrypt.compareSync(signInData.password, user.password!);
            console.log(passwordIsValid)
            if (passwordIsValid) {
                const { token, tokenExpired } = await createAccessToken(signInData.username);
                const refreshToken = await Models.RefreshToken.create(signInData.username)
                return res.status(StatusCodes.OK).json({
                    username: user.username,
                    email: user.email,
                    name: user.name,
                    lastname: user.lastname,
                    address: user.address,
                    city: user.city,
                    phone: user.phone,
                    createdAt: user.createdAt,
                    updatedAt: user.updatedAt,
                    accessToken: token,
                    tokenExpired: tokenExpired,
                    refreshToken: refreshToken,
                });
            } else {
                return res.status(StatusCodes.UNAUTHORIZED).json({
                    message: "Invalid Password!"
                });
            }
        }
        return res.status(StatusCodes.NOT_FOUND).json({
            message: "User not exist!"
        });
    } catch (error) {
        console.log(error);
        res.status(StatusCodes.INTERNAL_SERVER_ERROR).send(error);
    }
};
/**
 * @status 200 OK
 * @status 401 Invalid Password
 * @status 404 Invalid User
 * @status 500 Server Error
 */
export const adminSignIn = async (req: Request, res: Response) => {
    const signInData = {
        username: req.body.user.username as string,
        password: req.body.user.password,
    }
    try {
        const user = await Models.User.searchPassword(req.body.user.username)
        console.log(user?.roles)
        if (user && (user.roles?.includes('admin') || user.roles?.includes('staff'))) {
            const passwordIsValid = await bcrypt.compareSync(signInData.password, user.password!);
            console.log(passwordIsValid)
            if (passwordIsValid) {
                let role = 'staff'
                if (user.roles.includes('admin')) role = 'admin'
                const { token, tokenExpired } = await createAccessToken(signInData.username, role);
                const refreshToken = await Models.RefreshToken.create(signInData.username, role)
                return res.status(StatusCodes.OK).json({
                    username: user.username,
                    email: user.email,
                    name: user.name,
                    lastname: user.lastname,
                    address: user.address,
                    city: user.city,
                    phone: user.phone,
                    roles: user.roles,
                    createdAt: user.createdAt,
                    updatedAt: user.updatedAt,
                    accessToken: token,
                    tokenExpired: tokenExpired,
                    refreshToken: refreshToken,
                });
            } else {
                return res.status(StatusCodes.UNAUTHORIZED).json({
                    message: "Invalid Password!"
                });
            }
        }
        return res.status(StatusCodes.NOT_FOUND).json({
            message: "User not exist!"
        });
    } catch (error) {
        console.log(error);
        res.status(StatusCodes.INTERNAL_SERVER_ERROR).send(error);
    }
};
/**
 * @status 200 OK
 * @status 404 No token provided || Refresh token not exist
 */
export const logout = async (req: Request, res: Response) => {
    const refreshToken = req.headers.refreshtoken as string;
    if (!refreshToken) {
        return res.status(StatusCodes.NOT_FOUND).json({ msg: "No token provided!" });
    }
    const result = await Models.RefreshToken.remove(refreshToken)
    if (result?.affectedRows != 0) res.status(StatusCodes.OK).json({ msg: "Log out successfully" });
    else res.status(StatusCodes.GONE).json({ msg: "Token not exist!" });
};
/**
 * @status 200 OK
 * @status 404 No token provided || Refresh token not exist
 * @status 409 Unauthorized
 */
export const refreshToken = async (req: Request, res: Response) => {
    const refreshToken = req.headers.refreshtoken as string;
    if (!refreshToken) {
        return res.status(StatusCodes.NOT_FOUND).json({ msg: "No token provided!" });
    }
    const dbRefreshToken = await Models.RefreshToken.findByPk(refreshToken);
    if (!dbRefreshToken) {
        return res.status(StatusCodes.NOT_FOUND).json({ msg: "Refresh token not exist" });
    }
    if ((dbRefreshToken.expiryDate as Date).getTime() < new Date().getTime()) {
        await Models.RefreshToken.remove(refreshToken)
        return res.status(StatusCodes.FORBIDDEN).json({ msg: 'Unauthorized' });
    }
    const { token: newAccessToken, tokenExpired } = await createAccessToken(dbRefreshToken.username, dbRefreshToken.role);
    return res.status(200).json({ newAccessToken, tokenExpired });
};