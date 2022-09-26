import { PageQueryParam, PageResult } from '../base';

export interface OrderQueryParam extends PageQueryParam {
    orderSn: string | undefined;
    status: number | undefined;
}

export interface Order {
    id: string;
    orderSn: string;
    totalAmount: string;
    payAmount: string;
    payType: number;
    status: number;
    totalQuantity: number;
    createTime: string;
    memberId: string;
    sourceType: number;
    orderItems: OrderItem[];
}
export interface OrderItem {
    id: string;
    orderId: string;
    skuId: string;
    skuName: string;
    picUrl: string;
    price: string;
    count: number;
    totalAmount: number;
}

export type OrderPageResult = PageResult<Order[]>;

export interface OrderDetail {
    id: number | undefined;
    title: string;
    picUrl: string;
    beginTime: string;
    endTime: string;
    status: number;
    sort: number;
    url: string;
    remark: string;
}