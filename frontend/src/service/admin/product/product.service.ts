import type { ProductPageResult, ProductQuery } from "@/types/api/products/product";
import type { AxiosInstance } from "axios";
import axios from "axios";
import { createApiClient } from "../../api.service";
import interceptorService from "../interceptor.service";

class AdminProductService {
    api: AxiosInstance;

    constructor(baseUrl = "/api/product/admin") {
        this.api = createApiClient(baseUrl);
        interceptorService(this.api);
    }
    async getProducts({ pageSize = 20, page = 1, query = <ProductQuery>{} }) {
        const res = (await this.api.get<ProductPageResult>("/", {
            params: {
                ...query,
                page: page,
                pageSize: pageSize,
            }
        })).data;
        console.log(res)
        return res;
    }
    // async searchProducts({ pageSize = 20, page = 1, query = <ProductQuery>{} }) {
    //     const res = (await this.api.get<ProductPageResult>("/search", {
    //         params: {
    //             ...query,
    //             page: page,
    //             pageSize: pageSize,
    //         }
    //     })).data;
    //     console.log(res)
    //     return res;
    // }
    removeProduct(productId: string) {
        return new Promise<number>(async (resolve, reject) => {
            try {
                const res = (await this.api.delete<ProductPageResult>("/", {
                    params: { productId }
                }));
                if (res.status == 200) resolve(200)
                else if (res.status == 403) {
                    resolve(403)
                }
            } catch (error) {
                if (axios.isAxiosError(error)) {
                    reject(error);
                }
                reject(500);
            }
        })
    }

}

const adminProductService = new AdminProductService();
export default adminProductService;
