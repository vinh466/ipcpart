import { PageQueryParam, PageResult } from '../base';

interface MouseModel {
    productId: string;
    productName: string;
    productType: string;
    productPhoto: string;
    productBrand: string;
    price: number;
    trackingMethod: string;
    conectType: string;
    dpi: number;
    hand: string;
    color: string;
    updatedAt?: Date;
    createdAt?: Date;
}

export type MousePageResult = PageResult<MouseModel[]>;

export type MouseSection = [Array<MouseModel>, Array<MouseModel>?]

export type MouseQuery = {
    productId?: string;
    productName?: string;
    productBrand?: string[];
    trackingMethod?: string[];
    connectType?: string[];
    dpi?: string[];
    hand?: string[];
    color?: string[];
}

export type MouseQueryParams = PageQueryParam<MouseQuery>;
