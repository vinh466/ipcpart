import { Models } from "@models/index";
import { Request, Response } from "express";
import { where } from "sequelize";

export const allAccess = (req: Request, res: Response) => {
    res.status(200).send("Public Content.");
};

export const getVideoCards = async (req: Request, res: Response) => {
    let pageReq = parseInt(req.query.page as string) || 1;
    let sizeReq = parseInt(req.query.amount as string) || 50;
    const query = {
        productId: req.query.videocardId as string,
        productName: req.query.productName as string,
        productBrand: req.query.productBrand as string,
        chipsetName: req.query.chipsetName as string,
        coreClock: req.query.coreClock as string,
        boostClock: req.query.boostClock as string,
        color: req.query.color as string,
        length: parseInt(req.query.length as string),
        memory: parseInt(req.query.memory as string),
    }

    if (pageReq < 0) pageReq = 0
    if (sizeReq < 0) sizeReq = 0

    let result = await Models.Videocard.getVideoCards({
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