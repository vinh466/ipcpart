import type { OrderForm, OrderPageResult, OrderQuery, OrderQueryParams, OrderStatus, OrderUpdateForm } from "@/types/api/products/order";
import type { UserFormData } from "@/types/api/system/user";
import type { AxiosInstance } from "axios";
import axios from "axios";
import { createApiClient } from "../api.service";
import interceptorService from "./interceptor.service";

class OrderAdminService {
    api: AxiosInstance;

    constructor(baseUrl = "/api/order/admin") {
        this.api = createApiClient(baseUrl);
        interceptorService(this.api);
    }
    async update(data: OrderUpdateForm) {
        return new Promise<boolean>(async (resolve, reject) => {
            try {
                const request = {
                    'order': { ...data }
                }
                console.log(request);
                const res = await this.api.patch("/", request)
                resolve(true);
            } catch (error) {
                console.log(error);
                if (axios.isAxiosError(error)) {
                    reject(error);
                }
                reject(false);
            }
        })
    }

    async getOrders({
        pageSize = 5,
        page = 1,
        query = <OrderQuery>{}, }) {
        return new Promise<OrderPageResult>(async (resolve, reject) => {
            try {
                const res = await this.api.get<OrderPageResult>("/", {
                    params: {
                        page: page,
                        pageSize: pageSize,
                        username: query.username,
                        orderId: query.orderId,
                        city: query.city,
                        name: query.name,
                        lastname: query.lastname,
                        status: query.status,
                        address: query.address,
                        phone: query.phone,
                        paymentMethod: query.paymentMethod,
                    }
                })

                resolve(res.data);
            } catch (error) {
                if (axios.isAxiosError(error)) {
                    reject(error);
                }
                reject(false);
            }
        })
    }
}

const orderAdminService = new OrderAdminService()
export default orderAdminService;
