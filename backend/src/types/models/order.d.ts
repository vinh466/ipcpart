import { PageQueryParam, PageResult } from '../base';

export const enum OrderStatusCode {
    PENDING = 'pending',
    AWAITING_PAYMENT = 'awaiting-payment',
    AWAITING_PICKUP = 'awaiting-pickup',
    AWAITING_SHIPMENT = 'awaiting-shipment',
    COMPELETED = 'compeleted',
    CANCELLED = 'cancelled',
    REFUNDED = 'refunded',
}

export type OrderStatus =
    'pending' | 'awaiting-payment' | 'awaiting-pickup' | 'awaiting-shipment' | 'compeleted' | 'cancelled' | 'refunded'

interface OrderItem {
    orderId?: string;
    productId: string;
    productName: string;
    productPhoto: string;
    productType: string;
    quantity: number;
    totalPrice: number;
    price: number;
}

export interface Order {
    userId?: string;
    orderId: string;
    username: string;
    email: string;
    name: string;
    lastname: string;
    address: string;
    city: string;
    phone: string;
    paymentMethod: string;
    paymentTotal: number;
    totalAmount?: string;
    status?: OrderStatus;
    totalQuantity?: number;
    createTime?: Date;
    beginTime?: string;
    endTime?: string;
    orderItems?: OrderItem[] | string;
}


export type OrderPageResult = PageResult<Order[]>;

export interface OrderItemForm {
    productId: string;
    price: string | number,
    quantity: string | number
}
export interface OrderForm {
    username: string;
    address: string;
    city: string;
    phone: string;
    paymentMethod: string;
    paymentTotal: string | number;
    orderItems: OrderItemForm[];
}
export interface OrderUpdateForm {
    orderId?: string;
    address?: string;
    city?: string;
    phone?: string;
    status?: string;
    paymentMethod?: string;
    paymentTotal?: string | number;
    orderItems?: OrderItemForm[];
}
