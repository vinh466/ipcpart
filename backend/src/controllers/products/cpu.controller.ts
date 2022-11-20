import { Models } from "@models/index";
import { Request, Response } from "express";
import { where } from "sequelize";

export const allAccess = (req: Request, res: Response) => {
    res.status(200).send("Public Content.");
};

export const getCpu = async (req: Request, res: Response) => {
    let pageReq = parseInt(req.query.page as string) || 1;
    let sizeReq = parseInt(req.query.amount as string) || 50;
    const query = {
        productId: req.query.cpuId as string,
        cpuName: req.query.cpuName as string,
        brand: req.query.brand as string,
        processor: req.query.processor as string,
        gen: req.query.gen as string,
        socket: req.query.socket as string,
    }

    if (pageReq < 0) pageReq = 0
    if (sizeReq < 0) sizeReq = 0

    let result = await Models.Cpu.getCpus({
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

export const getNameCpus = async (req: Request, res: Response) => {
    let sreachReq = (req.query.searchName as string);
    if (sreachReq) {
        sreachReq.trim()
        let records = await Models.Cpu.getNameCpus(sreachReq)

        if (records) {
            res.status(200).json({
                meta: {
                    sreachString: sreachReq,
                    totalResult: records.length,
                },
                data: records
            })
        }
    }
    else {
        res.status(404).json({ msg: 'no sreach string' })
    }
}