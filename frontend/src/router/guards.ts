import { useAuthStore } from "@/stores/auth/AuthStore";
import type { NavigationGuardNext, RouteLocationNormalized } from "vue-router";

export const authGuard = async (to: RouteLocationNormalized, from: RouteLocationNormalized, next: NavigationGuardNext) => {
    const authStore = useAuthStore();

    const privitePages = ['/payment', '/cart'];

    const authRequired = privitePages.includes(to.path);

    if (authRequired && !authStore.user) {
        authStore.returnUrl = to.fullPath;
        return next('/auth/signin');
    }
    next();
}

export const redirectGuard = (to: RouteLocationNormalized, from: RouteLocationNormalized, next: NavigationGuardNext) => {
    if (to.path === '/auth') return next('/auth/signin');
    next();
}