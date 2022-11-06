import { RefreshTokenModel, RoleModel, UserModel, UserRoleTableModel } from "@models/Database";
import { Request, Response } from "express";
import { validationResult } from "express-validator";
import bcrypt from 'bcryptjs'
import jwt from 'jsonwebtoken';
import jwtConfig from "@configs/jwt.config";
import { RefreshToken } from "@type/models/token";


const createAccessToken = async (username: string) => {
    const token = await jwt.sign(
        { username: username },
        jwtConfig.secret,
        { expiresIn: jwtConfig.jwtExpiration }
    );
    const tokenExpired = jwtConfig.jwtExpiration * 1000 + new Date().getTime();
    console.log(new Date(tokenExpired))
    return { token, tokenExpired };
}

export const signUp = async (req: Request, res: Response) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        res.status(422).json({ errors: errors.array() });
        return;
    }
    const userData = {
        username: req.body.user.username as string,
        password: bcrypt.hashSync(req.body.user.password),
        email: req.body.user.email
    }
    try {
        const isExist = await UserModel.Table.findByPk(req.body.user.username)

        if (!isExist) {
            const result = await UserModel.Table.create(userData)
            if (result) await UserRoleTableModel.Table.create({ username: userData.username, roleName: 'user' })
            const userRes = {
                "username": result.username,
                "email": result.email,
                "updatedAt": result.updatedAt,
                "createdAt": result.createdAt
            }
            res.status(200).json(userRes);
            return;
        }
        res.status(409).json({ "err": 'Username is exist' });
    } catch (error) {
        res.status(500).send(error);
    }
};

export const signIn = async (req: Request, res: Response) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        res.status(422).json({ errors: errors.array() });
        return;
    }

    const signInData = {
        username: req.body.user.username as string,
        password: req.body.user.password,
    }
    try {
        const user = await UserModel.Table.findByPk(req.body.user.username)

        if (user) {
            const passwordIsValid = bcrypt.compareSync(signInData.password, user.password!);
            if (passwordIsValid) {
                const { token, tokenExpired } = await createAccessToken(signInData.username);
                const refreshToken = await RefreshTokenModel.createRefreshToken(signInData.username)
                return res.status(200).json({
                    username: user.username,
                    email: user.email,
                    createdAt: user.createdAt,
                    updatedAt: user.updatedAt,
                    accessToken: token,
                    tokenExpired: tokenExpired,
                    refreshToken: refreshToken,
                    message: "success!"
                });
            } else {
                return res.status(401).json({
                    message: "Invalid Password!"
                });
            }
        }
        return res.status(404).json({
            message: "User not exist!"
        });
    } catch (error) {
        res.status(500).send(error);
    }
};

export const logout = async (req: Request, res: Response) => {
    const refreshToken = req.headers.refreshtoken as string;
    if (!refreshToken) {
        return res.status(404).json({ msg: "No token provided!" });
    }
    const dbRefreshToken = await RefreshTokenModel.Table.findByPk(refreshToken);
    if (!dbRefreshToken) {
        return res.status(404).json({ msg: "Refresh token not exist" });
    }
    await RefreshTokenModel.Table.destroy({ where: { refreshToken } })
    res.status(200).send({ msg: "Log out successfully" });
};

export const refreshToken = async (req: Request, res: Response) => {

    const refreshToken = req.headers.refreshtoken as string;
    if (!refreshToken) {
        return res.status(404).json({ msg: "No token provided!" });
    }
    const dbRefreshToken = await RefreshTokenModel.Table.findByPk(refreshToken);
    if (!dbRefreshToken) {
        return res.status(404).json({ msg: "Refresh token not exist" });
    }
    if ((dbRefreshToken.expiryDate as Date).getTime() < new Date().getTime()) {
        await RefreshTokenModel.Table.destroy({ where: { refreshToken } })
        return res.status(403).json({ msg: 'Unauthorized' });
    }
    const { token: newAccessToken, tokenExpired } = await createAccessToken(dbRefreshToken.username);
    // return res.status(403).json({ msg: 'Unauthorized' });

    return res.status(200).json({ newAccessToken, tokenExpired });
};