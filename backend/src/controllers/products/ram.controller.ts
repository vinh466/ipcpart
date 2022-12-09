import { Models } from "@models/index";
import { convertStringToArray } from "@utils/convert.util";
import { Request, Response } from "express";
import { StatusCodes } from "http-status-codes";
import { where } from "sequelize";

export const allAccess = (req: Request, res: Response) => {
    res.status(200).send("Public Content.");
};

export const getRams = async (req: Request, res: Response) => {
    let pageReq = parseInt(req.query.page as string) || 1;
    let sizeReq = parseInt(req.query.pageSize as string) || 50;
    const query = {
        productId: req.query.productId as string,
        productName: req.query.productName as string,
        productBrand: convertStringToArray(req.query.productBrand as string[]),
        capacity: convertStringToArray(req.query.capacity as string[]),
        speed: convertStringToArray(req.query.speed as string[]),
        standard: convertStringToArray(req.query.standard as string[]),
        module: convertStringToArray(req.query.module as string[]),
        color: convertStringToArray(req.query.color as string[]),
        latency: convertStringToArray(req.query.latency as string[]),
        cas: convertStringToArray(req.query.cas as string[]),
        pricePerGb: convertStringToArray(req.query.pricePerGb as string[]),
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

export const getOptions = async (req: Request, res: Response) => {
    let standardReq = (req.query.standard || '') as string;
    try {

        let result = await Models.RamStandard.getOption({
            query: {
                standard: standardReq,
            }
        })

        if (result) {
            res.status(200).json({ options: result })
        } else {
            res.status(404).json({ msg: 'no option' })

        }
    } catch (error) {
        res.status(StatusCodes.INTERNAL_SERVER_ERROR).json({ msg: 'INTERNAL_SERVER_ERROR' })
    }


}