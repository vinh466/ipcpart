import { PageQueryParam, PageResult } from '../base';
import type {
    CpuQuery,
    MainboardQuery,
    MonitorQuery,
    MouseQuery,
    RamQuery,
    StorageDriveQuery,
    VideoCardQuery,
} from './';
import type {
    CpuModel,
    MainboardModel,
    MonitorModel,
    MouseModel,
    RamModel,
    StorageDriveModel,
    VideoCardModel,
} from './';

export interface Product {
    productId: string;
    productName: string;
    productBrand: string;
    productPhoto: string;
    productType: string;
    discount?: double;
    price: number;
    inStock: number;
    updatedAt?: string | null;
    createdAt?: string | null;
    deletedAt?: string | null;
    review?: {
        rate?: number;
        total?: number;
    };
}

export type ProductPageResult = PageResult<Product[]>;

export type ProductSection = [Array<Product>, Array<Product>?]

export type ProductQuery = {
    productId?: string | string[],
    productType?: string,
    productName?: string,
    productBrand?: string,
}
export type ProductParams = PageQueryParam<ProductQuery>;

export type ProductDetail = CpuModel | MainboardModel | VideoCardModel | StorageDriveModel | RamModel | MouseModel | MonitorModel | null

export type ProductFilterQuery = CpuQuery | MainboardQuery | VideoCardQuery | StorageDriveQuery | RamQuery | MouseQuery | MonitorQuery | null

export type ProductFilterParams = PageQueryParam<ProductFilterQuery>;