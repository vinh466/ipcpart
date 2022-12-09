import { Models } from "@models/index";
import { UserUpdateData } from "@type/models/user";
import { extractData } from "@utils/convert.util";
import { Request, Response } from "express";
import { StatusCodes } from "http-status-codes";

export const allAccess = (req: Request, res: Response) => {
    res.status(200).send("Public Content.");
};

export const getAdmin = async (req: Request, res: Response) => {
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
