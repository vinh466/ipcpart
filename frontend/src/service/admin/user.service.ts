import type { UserSignUpForm } from "@/types/api/system/auth";
import type { UserFormData, UserPageResult, UserQuery } from "@/types/api/system/user";
import type { AxiosInstance } from "axios";
import axios from "axios";
import { createApiClient } from "../api.service";
import interceptorService from "./interceptor.service";

class AdminUserService {
    api: AxiosInstance;

    constructor(baseUrl = "/api/user/admin") {
        this.api = createApiClient(baseUrl);
        interceptorService(this.api);
    }
    async create(data: UserFormData) {
        return new Promise<boolean>(async (resolve, reject) => {
            try {
                const res = await this.api.post("/", {
                    "user": {
                        "username": data.username,
                        "email": data.email,
                        "name": data.name,
                        "lastname": data.lastname,
                        "password": data.password,
                        "address": data.address,
                        "city": data.city,
                        "phone": data.phone,
                    }
                })
                console.log(res.data)
                if (res.status == 200) resolve(true)
                else {
                    resolve(false)
                }
            } catch (error) {
                if (axios.isAxiosError(error)) {
                    reject(error);
                }
                reject(false);
            }
        })
    }
    async getUsers({
        pageSize = 5,
        page = 1,
        query = <UserQuery>{}, }) {
        return new Promise<UserPageResult>(async (resolve, reject) => {
            try {
                const res = await this.api.get<UserPageResult>("/", {
                    params: {
                        page: page,
                        pageSize: pageSize,
                        username: query.username,
                        email: query.email,
                        name: query.name,
                        lastname: query.lastname,
                        city: query.city,
                        roles: query.roles,
                        address: query.address,
                        phone: query.phone,
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

    async updateUser(data: UserFormData) {
        return new Promise<boolean>(async (resolve, reject) => {
            try {
                const res = await this.api.patch("/", {
                    "user": {
                        username: data.username,
                        email: data.email,
                        name: data.name,
                        lastname: data.lastname,
                        password: data.password,
                        roles: data.roles,
                        address: data.address,
                        city: data.city,
                        phone: data.phone,
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
    remove(username: string) {
        return new Promise<boolean>(async (resolve, reject) => {
            try {
                const res = (await this.api.delete("/", {
                    params: { username }
                }));
                if (res.status == 200) resolve(true)
                else {
                    resolve(false)
                }
            } catch (error) {
                if (axios.isAxiosError(error)) {
                    reject(error);
                }
                reject(false);
            }
        })
    }
}

const adminUserService = new AdminUserService()
export default adminUserService;
