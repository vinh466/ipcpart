import { Models } from "@models/index";
import { convertStringToArray } from "@utils/convert.util";
import { Request, Response } from "express";
import { where } from "sequelize";

export const allAccess = (req: Request, res: Response) => {
    res.status(200).send("Public Content.");
};

export const getCpu = async (req: Request, res: Response) => {
    let pageReq = parseInt(req.query.page as string) || 1;
    let sizeReq = parseInt(req.query.pageSize as string) || 50;
    const query = {
        productId: req.query.productId as string,
        cpuName: (req.query.cpuName as string),
        brand: convertStringToArray(req.query.brand as string | string[]),
        processor: convertStringToArray(req.query.processor as string | string[]),
        gen: convertStringToArray(req.query.gen as string | string[]),
        socket: convertStringToArray(req.query.socket as string | string[]),
        igpu: convertStringToArray(req.query.igpu as string | string[]),
    }
    console.log(query.brand);
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