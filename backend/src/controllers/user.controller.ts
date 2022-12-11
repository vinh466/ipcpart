import { Models } from "@models/index";
import { UserUpdateData } from "@type/models/user";
import { convertStringToArray, extractData } from "@utils/convert.util";
import { Request, Response } from "express";
import bcrypt from 'bcryptjs'
import { StatusCodes } from "http-status-codes";

export const allAccess = (req: Request, res: Response) => {
    res.status(200).send("Public Content.");
};
export const updateUser = (req: Request, res: Response) => {
    const userReq = req.body.user as UserUpdateData | undefined
    const username = userReq?.username
    // console.log(userReq);
    if (username) {
        const updateData: UserUpdateData = {
            username: userReq.username,
            email: userReq.email,
            name: userReq.name,
            lastname: userReq.lastname,
            password: userReq.password,
            roles: userReq.roles,
            address: userReq.address,
            city: userReq.city,
            phone: userReq.phone,
        }
        console.log(updateData);
        Models.User.updateProfile(username, updateData)
    } else {
        res.status(StatusCodes.NOT_FOUND).json({ msg: 'No data provided!' })
        return;
    }
    res.status(200).json(userReq);
}
export const createUser = async (req: Request, res: Response) => {
    const userData = {
        username: req.body.user?.username as string,
        password: bcrypt.hashSync(req.body.user?.password),
        email: req.body.user?.email,
        name: req.body.user?.name,
        lastname: req.body.user?.lastname,
        address: req.body.user?.address as string,
        city: req.body.user?.city as string,
        phone: req.body.user?.phone as string,
    }
    try {
        const isExist = await Models.User.findByUsername(userData.username)
        console.log(isExist)
        if (!isExist) {

            const user = await Models.User.create(userData, ['user'])
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
}
export const getAllUsers = async (req: Request, res: Response) => {
    let pageReq = parseInt(req.query.page as string) || 1;
    let sizeReq = parseInt(req.query.pageSize as string) || 50;
    req.query = extractData<typeof req.query>(req.query)
    const query = {
        username: convertStringToArray(req.query.username as string | string[]),
        email: convertStringToArray(req.query.email as string | string[]),
        name: convertStringToArray(req.query.name as string | string[]),
        lastname: convertStringToArray(req.query.lastname as string | string[]),
        // roles: convertStringToArray(req.query.roles as string | string[]),
        roles: ['user'],
        address: convertStringToArray(req.query.address as string | string[]),
        city: convertStringToArray(req.query.city as string | string[]),
        phone: convertStringToArray(req.query.phone as string | string[]),
    }
    console.log(query);
    if (pageReq < 0) pageReq = 0
    if (sizeReq < 0) sizeReq = 0
    let result = await Models.User.getUsers({
        page: pageReq,
        pageSize: sizeReq,
        where: extractData<typeof query>(query)
    });
    if (result) {
        const { records, total, currPage } = result

        res.status(200).json({
            meta: {
                totalPage: Math.ceil(total / sizeReq) || 0,
                totalItems: total,
                currentPage: currPage,
                pageSize: sizeReq,
            },
            data: records
        })
    } else {
        res.status(500).json({ msg: 'no record' })
    }
};
export const updateUserAddress = (req: Request, res: Response) => {
    const userReq = req.body.user;
    if (userReq && req.username) {
        const updateData = extractData<UserUpdateData>({
            email: userReq.email,
            name: userReq.name,
            lastname: userReq.lastname,
            address: userReq.address,
            city: userReq.city,
            phone: userReq.phone,
        });
        console.log(updateData);
        Models.User.updateProfile(req.username, updateData)
    } else {
        res.status(StatusCodes.NOT_FOUND).json({ msg: 'No data provided!' })

    }

    res.status(200).json(userReq);
};

export const getOne = async (req: Request, res: Response) => {
    try {
        if (req.username) {
            const user = await Models.User.findByUsername(req.username)
            if (user) {
                res.status(200).json(user);
                return;
            }
        }
        res.status(StatusCodes.NOT_FOUND).json({ msg: 'NOT_FOUND' });
    } catch (error) {
        res.status(StatusCodes.INTERNAL_SERVER_ERROR).json({ msg: 'INTERNAL_SERVER_ERROR' });
    }
};

export async function deleteUser(req: Request, res: Response) {
    let username = (req.query.username as string) || '';
    if (username) {
        const result = await Models.User.remove(username)
        if (result?.[0].affectedRows != 0) res.status(200).json({ msg: 'user delete success' })
        else res.status(StatusCodes.INTERNAL_SERVER_ERROR).json({ msg: "can't delete" })
    } else {
        res.status(500).json({ msg: 'INTERNAL_SERVER_ERROR' })
    }

}

