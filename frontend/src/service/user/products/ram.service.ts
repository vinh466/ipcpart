import type { CpuPageResult } from "@/types/api/products/cpu";
import type { RamPageResult, RamQuery } from "@/types/api/products/ram";
import type { AxiosInstance } from "axios";
import { createApiClient } from "../../api.service";
import interceptorService from "../interceptor.service";

class RamService {
    api: AxiosInstance;

    constructor(baseUrl = "/api/product/ram") {
        this.api = createApiClient(baseUrl);
        interceptorService(this.api);
    }

    async getProduct({
        pageSize = 20,
        page = 1,
        query = <RamQuery>{}, }): Promise<RamPageResult | null> {
        return new Promise(async (resolve, reject) => {
            try {
                const res = (await this.api.get<RamPageResult>("/", {
                    params: {
                        page: page,
                        pageSize: pageSize,
                        productId: query.productId,
                        productName: query.productName,
                        productBrand: query.productBrand,
                        capacity: query.capacity,
                        speed: query.speed,
                        standard: query.standard,
                        module: query.module,
                        color: query.color,
                        latency: query.latency,
                        cas: query.cas,
                        pricePerGb: query.pricePerGb,
                    }

                })).data;
                console.log(res)
                resolve(res);
            } catch (error) {
                reject(null);
            }
        })
    }

    async getOptions({
        query = <{
            brand?: string;
            standard?: string;
        }>{} } = {}) {
        try {
            const res = (await this.api.get<{
                options: {
                    brand: Array<string>;
                    standard: Array<string>;
                }
            }>("/getOptions", {
                params: {
                    brand: query.brand,
                    standard: query.standard,
                }
            })).data;
            // console.log(res)
            if (res.options)
                return res
            else
                return false
        } catch (error) {
            return false
        }
    }
}

const ramService = new RamService();
export default ramService;
