import { Models } from "@models/index";
import { OrderForm, OrderUpdateForm } from "@type/models/order";
import { convertStringToArray, extractData } from "@utils/convert.util";
import { Request, Response } from "express";
import { StatusCodes } from "http-status-codes";

export const getOrders = async (req: Request, res: Response) => {
    let pageReq = parseInt(req.query.page as string) || 1;
    let sizeReq = parseInt(req.query.pageSize as string) || 50;
    req.query = extractData<typeof req.query>(req.query)
    const query = {
        user: req.username,
        username: req.query.username as string,
        orderId: req.query.orderId as string,
        city: convertStringToArray(req.query.city as string | string[]),
        status: convertStringToArray(req.query.status as string | string[]),
        address: convertStringToArray(req.query.address as string | string[]),
        phone: convertStringToArray(req.query.phone as string | string[]),
        paymentMethod: convertStringToArray(req.query.paymentMethod as string | string[]),
    }

    if (pageReq < 0) pageReq = 0
    if (sizeReq < 0) sizeReq = 0
    let result = await Models.Order.getOrders({
        page: pageReq,
        pageSize: sizeReq,
        where: extractData<typeof query>(query)
    });

    console.log(req.username);
    if (result && req.username) {
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
};

export const getAllOrders = async (req: Request, res: Response) => {
    let pageReq = parseInt(req.query.page as string) || 1;
    let sizeReq = parseInt(req.query.pageSize as string) || 50;
    req.query = extractData<typeof req.query>(req.query)
    const query = {
        username: req.query.username as string,
        orderId: req.query.orderId as string,
        city: convertStringToArray(req.query.city as string | string[]),
        name: convertStringToArray(req.query.name as string | string[]),
        lastname: convertStringToArray(req.query.lastname as string | string[]),
        status: convertStringToArray(req.query.status as string | string[]),
        address: convertStringToArray(req.query.address as string | string[]),
        phone: convertStringToArray(req.query.phone as string | string[]),
        paymentMethod: convertStringToArray(req.query.paymentMethod as string | string[]),
    }

    if (pageReq < 0) pageReq = 0
    if (sizeReq < 0) sizeReq = 0
    let result = await Models.Order.getOrders({
        page: pageReq,
        pageSize: sizeReq,
        where: extractData<typeof query>(query)
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
};

export const insertOne = async (req: Request, res: Response) => {
    const orderReq = req.body.order as OrderForm | undefined
    // console.log(orderReq);
    if (orderReq) {
        const orderData: OrderForm = {
            username: orderReq.username,
            address: orderReq.address,
            city: orderReq.city,
            phone: orderReq.phone,
            paymentMethod: orderReq.paymentMethod,
            paymentTotal: orderReq.paymentTotal,
            orderItems: orderReq.orderItems,
        }
        let validateReq = true;
        Object.keys(orderData).forEach((key) => {
            if (typeof orderData[key as keyof typeof orderData] === 'undefined') validateReq = false;
            return;
        })
        if (validateReq) {
            const result = await Models.Order.insertOne(orderData)
            if (result?.affectedRows != 0) {
                res.status(200).json(result);
            }
            else res.status(StatusCodes.INTERNAL_SERVER_ERROR).json({ msg: 'INTERNAL_SERVER_ERROR' });
        } else {
            res.status(StatusCodes.UNPROCESSABLE_ENTITY).json({ msg: 'UNPROCESSABLE_ENTITY' });
        }
    } else {
        res.status(StatusCodes.NOT_FOUND).json({ msg: 'No order provided!' })
    }
};

export const updateOrder = async (req: Request, res: Response) => {
    const orderReq = req.body.order as OrderUpdateForm | undefined
    const orderId = orderReq?.orderId
    // console.log(orderReq);
    if (orderId) {
        const updateData: OrderUpdateForm = {
            address: orderReq.address,
            city: orderReq.city,
            phone: orderReq.phone,
            status: orderReq.status,
            paymentMethod: orderReq.paymentMethod,
            paymentTotal: orderReq.paymentTotal,
        }
        console.log(updateData);
        Models.Order.update(orderId, updateData)
    } else {
        res.status(StatusCodes.NOT_FOUND).json({ msg: 'No data provided!' })
    }
    res.status(200).json(orderReq);
};