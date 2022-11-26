import { Models } from "@models/index";
import { convertStringToArray } from "@utils/convert.util";
import { Request, Response } from "express";
import { where } from "sequelize";

export const allAccess = (req: Request, res: Response) => {
    res.status(200).send("Public Content.");
};

export const getMouses = async (req: Request, res: Response) => {
    let pageReq = parseInt(req.query.page as string) || 1;
    let sizeReq = parseInt(req.query.pageSize as string) || 50;
    const query = {
        productId: req.query.productId as string,
        productName: req.query.productName as string,
        productBrand: convertStringToArray(req.query.productBrand as string[]),
        trackingMethod: convertStringToArray(req.query.trackingMethod as string[]),
        connectType: convertStringToArray(req.query.connectType as string[]),
        dpi: convertStringToArray(req.query.dpi as string[]),
        hand: convertStringToArray(req.query.hand as string[]),
        color: convertStringToArray(req.query.color as string[]),
    }

    if (pageReq < 0) pageReq = 0
    if (sizeReq < 0) sizeReq = 0

    let result = await Models.Mouse.getMouses({
        page: pageReq,
        pageSize: sizeReq,
        where: query
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
}

