import { useAuthStore } from "@/stores/auth/AuthStore";
import { storeToRefs } from 'pinia';
import { useCartStore } from "@/stores/CartStore";
import type { NavigationGuardNext, RouteLocationNormalized } from "vue-router";
import { useAdminAuthStore } from "@/stores/auth/AdminAuthStore";

export const authGuard = async (to: RouteLocationNormalized, from: RouteLocationNormalized, next: NavigationGuardNext) => {
    const authStore = useAuthStore();
    const adminAuthStore = useAdminAuthStore();
    const privitePages = ['/payment',];

    const adminAuthRequired = to.path.slice(0, 6) === '/admin' && to.path != '/admin/auth';
    const authRequired = privitePages.includes(to.path);

    if (authRequired && !authStore.user) {
        authStore.returnUrl = to.fullPath;
        return next('/auth/signin');
    }
    if (adminAuthRequired && !adminAuthStore.user) {
        adminAuthStore.returnUrl = to.fullPath;
        return next('/admin/auth');
    }
    next();
}

export const redirectGuard = (to: RouteLocationNormalized, from: RouteLocationNormalized, next: NavigationGuardNext) => {
    const cartStore = useCartStore();
    const { cartItems, payAmount, count } = storeToRefs(cartStore);

    if (to.path === '/admin') return next('/admin/order');
    if (to.path === '/auth') return next('/auth/signin');
    if (to.path === '/cart/checkout') {
        if (!cartItems.value.length) {
            next('/cart');
        }
    }
    next();
}