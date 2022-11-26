import type { ProductPageResult } from "@/types/api/products/product";
import type { AxiosInstance } from "axios";
import { createApiClient } from "../api.service";
import interceptorService from "../interceptor.service";

class ProductService {
    api: AxiosInstance;

    constructor(baseUrl = "/api/product") {
        this.api = createApiClient(baseUrl);
        interceptorService(this.api);
    }
    async getProducts(productType: string, pageSize = 20, page = 1) {
        const res = (await this.api.get<ProductPageResult>("/", {
            params: {
                type: productType,
                page: page,
                pageSize: pageSize,
            }
        })).data;
        console.log(res)
        return res;
    }
    async test(productType: string) {
        const res = (await this.api.get("/", {
            params: {
                type: productType,
            }
        })).data;
        console.log(res)
    }
}

const productService = new ProductService();
export default productService;
