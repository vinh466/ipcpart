import type { OrderForm } from "@/types/api/products/order";
import type { UserFormData } from "@/types/api/system/user";
import type { AxiosInstance } from "axios";
import axios from "axios";
import { createApiClient } from "../api.service";
import interceptorService from "./interceptor.service";

class OrderService {
    api: AxiosInstance;

    constructor(baseUrl = "/api/order") {
        this.api = createApiClient(baseUrl);
        interceptorService(this.api);
    }

    async addOrder(data: OrderForm) {
        return new Promise<boolean>(async (resolve, reject) => {
            try {
                const request = {
                    'order': { ...data }
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

    async getAllOrder(data: OrderForm) {
        return new Promise<boolean>(async (resolve, reject) => {
            try {
                const res = await this.api.get("/",)

                resolve(true);
            } catch (error) {
                if (axios.isAxiosError(error)) {
                    reject(error);
                }
                reject(false);
            }
        })
    }

    async test() {
        const res = (await this.api.get("/profile")).data;
        console.log(res)
    }
}

const orderService = new OrderService()
export default orderService;
