import { isAxiosError } from '@/service/api.service';
import adminAuthService from '@/service/admin/auth.service';
import adminService from '@/service/admin/admin.service';
import tokenService from '@/service/token.service';
import userService from '@/service/user/user.service';
import type { NewAccessToken, UserSignInForm, UserSignUpForm } from '@/types/api/system/auth';
import type { UserItem } from '@/types/api/system/user';
import type { AxiosError } from 'axios';
import { defineStore } from 'pinia';

// const router = useRouter()

export const useAdminAuthStore = defineStore({
    id: 'AdminAuthStore',
    state: () => ({
        // initialize state from local storage to enable user to stay logged in
        user: JSON.parse(localStorage.getItem('admin')!) as UserItem | null,
        accessToken: JSON.parse(localStorage.getItem('admin')!)?.accessToken,
        refreshToken: JSON.parse(localStorage.getItem('admin')!)?.refreshToken,
        tokenExpired: JSON.parse(localStorage.getItem('admin')!)?.tokenExpired,
        signInMessage: '',
        returnUrl: '/admin',
        isProcessing: false
    }),

    actions: {
        async signIn(data: UserSignInForm) {
            let nextRoute = this.returnUrl;
            this.returnUrl = '/admin'
            this.signInMessage = ''
            try {
                this.isProcessing = true;
                const user = await adminAuthService.signin(data);
                this.user = user;
                this.accessToken = user.accessToken;
                this.refreshToken = user.refreshToken;
                console.log(this.user)
                localStorage.setItem('admin', JSON.stringify(user));
                console.log('next route ' + nextRoute)
                this.router.push({ path: nextRoute });
            } catch (error) {
                if (isAxiosError(error)) {
                    const response = (error as AxiosError).response
                    if (response?.status === 404) {
                        console.log(response)
                        this.signInMessage = 'Tài khoản không tồn tại';
                    }
                    if (response?.status === 401) {
                        console.log(response)
                        this.signInMessage = 'Mật khẩu không đúng';
                    }
                    if (response?.status === 500) {
                        console.log(response)
                        this.signInMessage = 'Lỗi máy chủ !!';
                    }
                } else {
                    console.log(error)
                    this.signInMessage = 'Có lỗi xảy ra';
                }
            }
            this.isProcessing = false;
        },

        async signUp(data: UserSignUpForm) {
            console.log(data)
            this.signInMessage = ''
            try {
                this.isProcessing = true;
                await adminAuthService.signup(data);
                this.signIn({ userName: data.username, password: data.password })
                this.isProcessing = false;
            } catch (error) {
                if (isAxiosError(error)) {
                    const response = (error as AxiosError).response
                    if (response?.status === 409) {
                        console.log(response)
                        this.signInMessage = 'Tài khoản đã tồn tại';
                    }
                    if (response?.status === 500) {
                        console.log(response)
                        this.signInMessage = 'Lỗi máy chủ !!';
                    }
                } else this.signInMessage = 'Có lỗi xảy ra';
            }
            this.isProcessing = false;
        },

        logout(redirect = true) {
            this.signInMessage = ''
            this.user = null;
            (this.user) && adminAuthService.logout();
            localStorage.removeItem('admin');
            console.log('remove localstorage')
            if (redirect) this.router.push('/admin/auth');
        },

        async getAccessToken(redirect = true) {
            this.signInMessage = ''
            return new Promise<NewAccessToken>(async (resolve, reject) => {
                try {
                    this.isProcessing = true;
                    console.log('AdminAuthStore refreshToken');
                    const newAccessToken = await adminAuthService.refreshToken();
                    this.isProcessing = false;
                    resolve(newAccessToken)
                } catch (error) {
                    if (isAxiosError(error)) {
                        const response = (error as AxiosError).response
                        if (response?.status && [404, 403, 401, 500].includes(response.status)) {
                            this.logout(false);
                            console.log('redirect: /admin/auth ')
                            if (redirect) this.router.push('/admin/auth');
                        }
                    }
                    console.log(error)
                    reject(null);
                }
                reject(null);
                this.isProcessing = false;
            })
        },
        save() {
            this.user && tokenService.setAdmin(this.user)
        },
        async fetch() {
            console.log('admin fetch');
            const fetchUser = await adminService.fetchAdmin() || null
            if (fetchUser) {
                this.user = fetchUser;
                this.user.refreshToken = this.refreshToken;
                this.user.accessToken = this.accessToken;
                this.save();
            }

        }
    }
});