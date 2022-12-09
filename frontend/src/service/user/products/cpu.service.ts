import type { CpuPageResult, CpuQuery } from "@/types/api/products/cpu";
import type { AxiosInstance } from "axios";
import axios from "axios";
import { createApiClient } from "../../api.service";
import interceptorService from "../interceptor.service";

class CpuService {
    api: AxiosInstance;

    constructor(baseUrl = "/api/product/cpu") {
        this.api = createApiClient(baseUrl);
        interceptorService(this.api);
    }

    async getProduct({
        pageSize = 20,
        page = 1,
        query = <CpuQuery>{}, }): Promise<CpuPageResult | null> {
        return new Promise(async (resolve, reject) => {
            try {
                const res = (await this.api.get<CpuPageResult>("/", {
                    params: {
                        page: page,
                        pageSize: pageSize,
                        cpuId: query.productId,
                        productId: query.productId,
                        brand: query.brand,
                        processor: query.processor,
                        gen: query.gen,
                        socket: query.socket,
                        cpuName: query.cpuName,
                        igpu: query.igpu,
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
            processor?: string;
            gen?: string;
            socket?: string;
        }>{} } = {}) {
        try {
            const res = (await this.api.get<{
                options: {
                    brand: Array<string>;
                    processor: Array<string>;
                    gen: Array<string>;
                    socket: Array<string>;
                }
            }>("/getOptions", {
                params: {
                    brand: query.brand,
                    processor: query.processor,
                    gen: query.gen,
                    socket: query.socket,
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
    async create(payload: {
        "productName": string;
        "productPhoto": string;
        "productBrand": string;
        "price": number;
        "processor": string;
        "gen": string;
        "socket": string;
        "coreCount": number;
        "thread": number;
        "coreClock": string;
        "coreBoost": string;
        "tdp": string;
        "iGpu": string;
    }) {
        console.log(payload);
        // return true

        return new Promise<boolean>(async (resolve, reject) => {
            try {
                const request = {
                    payload
                }
                console.log(request);
                const res = await this.api.post("/", request)

                resolve(true);
            } catch (error) {
                if (axios.isAxiosError(error)) {
                    reject(error);
                }
                reject(false);
            }
        })
    }
}

const cpuService = new CpuService();
export default cpuService;
