import main from '@/views/layouts/main.vue'
import auth from '@/views/layouts/auth.vue'
import type { RouteRecordRaw } from 'vue-router'

export const userRoutes: Array<RouteRecordRaw> = [
    {
        path: '/',
        name: 'home',
        meta: {
            layout: main,
        },
        component: () => import('@/views/user/home/home.vue')
    },
    {
        path: '/search',
        name: 'search',

        meta: {
            layout: main
        },
        component: () => import('@/views/user/home/search.vue')
    },
    {
        path: '/cart',
        name: 'cart',
        meta: {
            layout: main
        },
        component: () => import('@/views/user/cart/cart.vue')
    },
    {
        path: '/order',
        name: 'order',
        meta: {
            layout: main
        },
        component: () => import('@/views/user/cart/order.vue')
    },
    {
        path: '/cart/checkout',
        name: 'cart/checkout',
        meta: {
            layout: main
        },
        component: () => import('@/views/user/cart/checkoutDetail.vue')
    },
    {
        path: '/cart/complete',
        name: '/cart/complete',
        meta: {
            layout: main
        },
        component: () => import('@/views/user/cart/complete.vue')
    },
    {
        path: '/auth/:action',
        name: 'auth',
        meta: {
            layout: main
        },
        component: () => import('@/views/user/auth/auth.vue')
    },
    {
        path: '/product/:productType',
        name: 'productSreach',
        meta: {
            layout: main
        },
        component: () => import('@/views/user/products/product.vue')
    },
    {
        path: '/product/:productType/:productId',
        name: 'productOverview',
        meta: {
            layout: main
        },
        component: () => import('@/views/user/products/productDetail.vue')
    },
    {
        path: '/:catchAll(.*)',
        name: 'notfound',
        meta: {
            layout: main
        },
        component: () => import('@/views/notFound.vue')
    }
]
