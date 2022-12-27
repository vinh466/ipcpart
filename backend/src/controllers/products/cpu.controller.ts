import { Models } from "@models/index";
import { convertStringToArray } from "@utils/convert.util";
import { query, Request, Response } from "express";
import { StatusCodes } from "http-status-codes";


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

export const getOptions = async (req: Request, res: Response) => {

    let brandReq = (req.query.brand || '') as string;
    let processorReq = (req.query.processor || '') as string;
    let genReq = (req.query.gen || '') as string;
    let socketReq = (req.query.socket || '') as string;
    try {

        let result = await Models.CpuType.getOption({
            query: {
                brand: brandReq,
                processor: processorReq,
                gen: genReq,
                socket: socketReq,
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

export const insertCpu = async (req: Request, res: Response) => {
    let payloadReq = (req.body.payload);
    try {

        let success = await Models.Cpu.insertOne(payloadReq)

        if (success) {
            res.status(200).json({ msg: 'success' })
        } else {
            res.status(404).json({ msg: 'failed' })

        }
    } catch (error) {
        res.status(StatusCodes.INTERNAL_SERVER_ERROR).json({ msg: 'INTERNAL_SERVER_ERROR' })
    }


}
export const updateCpu = async (req: Request, res: Response) => {
    let payloadReq = (req.body.payload);
    try {

        let success = await Models.Cpu.update(payloadReq)

        if (success) {
            res.status(200).json({ msg: 'success' })
        } else {
            res.status(404).json({ msg: 'failed' })

        }
    } catch (error) {
        res.status(StatusCodes.INTERNAL_SERVER_ERROR).json({ msg: 'INTERNAL_SERVER_ERROR' })
    }


}