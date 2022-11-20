import { Models } from "@models/index";
import { Request, Response } from "express";
import { where } from "sequelize";

export const allAccess = (req: Request, res: Response) => {
    res.status(200).send("Public Content.");
};

export const getMonitors = async (req: Request, res: Response) => {
    let pageReq = parseInt(req.query.page as string) || 1;
    let sizeReq = parseInt(req.query.amount as string) || 50;
    const query = {
        productId: req.query.monitorId as string,
        productName: req.query.productName as string,
        productBrand: req.query.productBrand as string,
        screenSize: req.query.screenSize as string,
        resolution: req.query.resolution as string,
        refreshRate: req.query.refreshRate as string,
        responseTime: req.query.responseTime as string,
        panelType: req.query.panelType as string,
        ratio: req.query.ratio as string,
    }

    if (pageReq < 0) pageReq = 0
    if (sizeReq < 0) sizeReq = 0

    let result = await Models.Monitor.getMonitors({
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