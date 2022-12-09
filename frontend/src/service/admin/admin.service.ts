import type { UserFormData, UserItem } from "@/types/api/system/user";
import type { AxiosInstance } from "axios";
import axios from "axios";
import { createApiClient } from "../api.service";
import interceptorService from "./interceptor.service";

class AdminService {
    api: AxiosInstance;

    constructor(baseUrl = "/api/admin") {
        this.api = createApiClient(baseUrl);
        interceptorService(this.api);
    }

    async fetchAdmin() {
        return new Promise<UserItem | null>(async (resolve, reject) => {
            try {
                const res = await this.api.get<UserItem>("/")
                if (res.status == 200) {
                    resolve(res.data);
                } else {
                    reject(null);
                }
            } catch (error) {
                if (axios.isAxiosError(error)) {
                    console.log(error);
                    reject(null);
                }
                reject(null);
            }
        })
    }
}

const adminService = new AdminService()
export default adminService;
