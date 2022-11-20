import { Models } from "@models/index";
import { query, Request, Response } from "express";

export const getMainboard = async (req: Request, res: Response) => {
    let pageReq = parseInt(req.query.page as string) || 1;
    let sizeReq = parseInt(req.query.amount as string) || 50;
    const query = {
        productId: req.query.mainboardId as string,
        productName: req.query.productName as string,
        productBrand: req.query.productBrand as string,
        chipset: req.query.chipset as string,
        socket: req.query.socket as string,
        ramStandard: req.query.ramStandard as string,
        form: req.query.form as string,
        color: req.query.color as string,
        ramCap: parseInt(req.query.ramCap as string),
        ramSlot: parseInt(req.query.ramSlot as string),
    };
    if (pageReq < 0) pageReq = 0
    if (sizeReq < 0) sizeReq = 0

    let result = await Models.Mainboard.getMainboards({
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
