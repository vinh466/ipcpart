import { PageQueryParam, PageResult } from '../base';

export interface ProductQueryParam extends PageQueryParam {
    ProductSn: string | undefined;
    status: number | undefined;
}

export interface Product {
    productId: String;
    productName: String;
    imgUrl: string;
    price: number;
    productType?: string;
    discount?: double;
    review?: {
        rate?: number;
        total?: number;
    };
}

export interface ProductDetail {
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

export type ProductPageResult = PageResult<Product[]>;

export type ProductSection = [Array<Product>, Array<Product>?]
