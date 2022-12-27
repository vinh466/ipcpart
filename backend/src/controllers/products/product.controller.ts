import { Models } from "@models/index";
import { convertStringToArray } from "@utils/convert.util";
import { Request, Response } from "express";
import { StatusCodes } from "http-status-codes";

export const allAccess = (req: Request, res: Response) => {
    res.status(200).send("Public Content.");
};

export const getProducts = async (req: Request, res: Response) => {
    let pageReq = parseInt(req.query.page as string) || 1;
    let sizeReq = parseInt(req.query.pageSize as string) || 50;
    const query = {

        productId: convertStringToArray(req.query.productId as string | string[]),
        productType: req.query.productType as string,
        productName: req.query.productName as string,
        productBrand: req.query.productBrand as string,
    }

    if (pageReq < 0) pageReq = 0
    if (sizeReq < 0) sizeReq = 0

    let result = await Models.Product.getProducts({
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
export const searchProducts = async (req: Request, res: Response) => {
    let pageReq = parseInt(req.query.page as string) || 1;
    let sizeReq = parseInt(req.query.pageSize as string) || 50;
    const query = {

        productId: convertStringToArray(req.query.productId as string | string[]),
        productType: req.query.productType as string,
        productName: req.query.productName as string,
        productBrand: req.query.productBrand as string,
    }

    if (pageReq < 0) pageReq = 0
    if (sizeReq < 0) sizeReq = 0

    let result = await Models.Product.searchProducts({
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

export const removeProducts = async (req: Request, res: Response) => {
    let productId = (req.query.productId as string) || '';
    if (productId) {
        const result = await Models.Product.removeProduct(productId)
        if (result?.[0].affectedRows != 0) res.status(200).json({ msg: 'product delete success' })
        else res.status(StatusCodes.INTERNAL_SERVER_ERROR).json({ msg: "can't delete" })
    } else {
        res.status(500).json({ msg: 'INTERNAL_SERVER_ERROR' })
    }
} 