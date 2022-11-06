import type { AxiosInstance } from "axios";
import { createApiClient } from "./api.service";
import interceptorService from "./interceptor.service";

class UserService {
    api: AxiosInstance;

    constructor(baseUrl = "/api/user") {
        this.api = createApiClient(baseUrl);
        interceptorService(this.api);
    }

    async test() {
        const res = (await this.api.get("/profile")).data;
        console.log(res)
    }
}

const userService = new UserService()
export default userService;
