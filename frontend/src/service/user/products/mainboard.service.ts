import type { CpuPageResult } from "@/types/api/products/cpu";
import type { MainboardPageResult, MainboardQuery } from "@/types/api/products/mainboard";
import type { AxiosInstance } from "axios";
import { createApiClient } from "../../api.service";
import interceptorService from "../interceptor.service";

class MainboardService {
    api: AxiosInstance;

    constructor(baseUrl = "/api/product/mainboard") {
        this.api = createApiClient(baseUrl);
        interceptorService(this.api);
    }

    async getProduct({
        pageSize = 20,
        page = 1,
        query = <MainboardQuery>{}, }): Promise<MainboardPageResult | null> {
        return new Promise(async (resolve, reject) => {
            try {
                const res = (await this.api.get<MainboardPageResult>("/", {
                    params: {
                        page: page,
                        pageSize: pageSize,
                        productId: query.productId,
                        productName: query.productName,
                        productBrand: query.productBrand,
                        chipset: query.chipset,
                        socket: query.socket,
                        ramStandard: query.ramStandard,
                        form: query.form,
                        color: query.color,
                        ramCap: query.ramCap,
                        ramSlot: query.ramSlot,
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
            chipset?: string;
            ramStandard?: string;
            socket?: string;
        }>{} } = {}) {
        try {
            const res = (await this.api.get<{
                options: {
                    brand: Array<string>;
                    chipset: Array<string>;
                    ramStandard: Array<string>;
                    socket: Array<string>;
                }
            }>("/getOptions", {
                params: {
                    brand: query.brand,
                    chipset: query.chipset,
                    ramStandard: query.ramStandard,
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
}

const mainboardService = new MainboardService();
export default mainboardService;
