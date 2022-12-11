import { PageQueryParam, PageResult } from '../base';

export type OrderStatus =
    'pending' | 'awaiting-payment' | 'awaiting-pickup' | 'awaiting-shipment' | 'compeleted' | 'cancelled' | 'refunded'


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
    orderItems?: OrderItem[];
    createdAt?: Date;
}
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


export type OrderPageResult = PageResult<Order[]>;

export type OrderQuery = {
    username?: string;
    orderId?: string;
    city?: string;
    name?: string;
    lastname?: string;
    status?: string;
    address?: string;
    phone?: string;
    paymentMethod?: string;
}

export type OrderQueryParams = PageQueryParam<OrderQuery>;

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
    orderId: string;
    address?: string;
    city?: string;
    phone?: string;
    status?: string;
    paymentMethod?: string;
    paymentTotal?: string | number;
    orderItems?: OrderItemForm[];
}