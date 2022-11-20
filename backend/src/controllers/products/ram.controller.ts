import { Models } from "@models/index";
import { Request, Response } from "express";
import { where } from "sequelize";

export const allAccess = (req: Request, res: Response) => {
    res.status(200).send("Public Content.");
};

export const getRams = async (req: Request, res: Response) => {
    let pageReq = parseInt(req.query.page as string) || 1;
    let sizeReq = parseInt(req.query.amount as string) || 50;
    const query = {
        productId: req.query.ramId as string,
        productName: req.query.productName as string,
        productBrand: req.query.productBrand as string,
        capacity: parseInt(req.query.capacity as string),
        speed: req.query.speed as string,
        standard: req.query.standard as string,
        module: req.query.module as string,
        color: req.query.color as string,
        latency: parseInt(req.query.latency as string),
        cas: parseInt(req.query.cas as string),
        pricePerGb: parseInt(req.query.pricePerGb as string),
    }

    if (pageReq < 0) pageReq = 0
    if (sizeReq < 0) sizeReq = 0

    let result = await Models.Ram.getRams({
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