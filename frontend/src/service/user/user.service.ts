import type { UserFormData, UserItem } from "@/types/api/system/user";
import type { AxiosInstance } from "axios";
import axios from "axios";
import { createApiClient } from "../api.service";
import interceptorService from "./interceptor.service";

class UserService {
    api: AxiosInstance;

    constructor(baseUrl = "/api/user") {
        this.api = createApiClient(baseUrl);
        interceptorService(this.api);
    }

    async fetchUser() {
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

    async updateUser(data: UserFormData) {
        return new Promise<boolean>(async (resolve, reject) => {
            try {
                const res = await this.api.patch("/profile", {
                    "user": {
                        "address": data.address,
                        "city": data.city,
                        "phone": data.phone,
                    }
                })
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

const userService = new UserService()
export default userService;
