import { Models } from "@models/index";
import { convertStringToArray } from "@utils/convert.util";
import { Request, Response } from "express";
import { StatusCodes } from "http-status-codes";


export const allAccess = (req: Request, res: Response) => {
    res.status(200).send("Public Content.");
};

export const getVideoCards = async (req: Request, res: Response) => {
    let pageReq = parseInt(req.query.page as string) || 1;
    let sizeReq = parseInt(req.query.pageSize as string) || 50;
    const query = {
        productId: req.query.productId as string,
        productName: req.query.productName as string,
        productBrand: convertStringToArray(req.query.productBrand as string[]),
        chipsetName: convertStringToArray(req.query.chipsetName as string[]),
        coreClock: convertStringToArray(req.query.coreClock as string[]),
        boostClock: convertStringToArray(req.query.boostClock as string[]),
        color: convertStringToArray(req.query.color as string[]),
        length: convertStringToArray(req.query.length as string[]),
        memory: convertStringToArray(req.query.memory as string[]),
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
export const getOptions = async (req: Request, res: Response) => {
    let chipsetNameReq = (req.query.chipsetName || '') as string;
    try {

        let result = await Models.GpuChipset.getOption({
            query: {
                chipsetName: chipsetNameReq,
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