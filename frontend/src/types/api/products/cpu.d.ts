import { PageQueryParam, PageResult } from '../base';

export interface CpuModel {
    productId: string;
    productName: string;
    cpuTypeId: number;
    productPhoto: string;
    productBrand: string;
    processor: string;
    gen: string;
    codename: string;
    coreCount: number;
    coreClock: string;
    coreBoost: string;
    thread: number;
    socket: string;
    tdp: string;
    iGpu: string;
    price: number;
    inStock: number;
    updatedAt?: Date;
    createdAt?: Date;
    deletedAt?: Date;
}

export type CpuPageResult = PageResult<CpuModel[]> | null;

export type CpuSection = [Array<CpuModel>, Array<CpuModel>?]

export type CpuQuery = {
    productId?: string,
    cpuName?: string,
    brand?: string[],
    processor?: string[],
    gen?: string[],
    socket?: string[],
    igpu?: string[],
}

export type CpuQueryParams = PageQueryParam<CpuQuery>;
