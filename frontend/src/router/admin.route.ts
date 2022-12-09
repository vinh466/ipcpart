import main from '@/views/layouts/main.vue'
import auth from '@/views/layouts/auth.vue'
import type { RouteRecordRaw } from 'vue-router'
import dashboard from '@/views/layouts/dashboard.vue'

export const adminRoutes: Array<RouteRecordRaw> = [
    {
        path: '/admin',
        name: '/admin/dashboard',
        meta: {
            sidebar: 'dashboard',
            layout: dashboard,
            admin: true,
        },
        component: () => import('@/views/admin/dashboard.vue')
    },
    {
        path: '/admin/auth',
        name: '/admin/auth',
        meta: {
            layout: auth,
        },
        component: () => import('@/views/admin/auth.vue')
    },
    {
        path: '/admin/staff',
        name: '/admin/staff',
        meta: {
            sidebar: 'staff',
            layout: dashboard,
            admin: true,
        },
        component: () => import('@/views/admin/staff.vue')
    },
    {
        path: '/admin/user',
        name: '/admin/suser',
        meta: {
            sidebar: 'user',
            layout: dashboard,
            admin: true,
        },
        component: () => import('@/views/admin/user.vue')
    },
    {
        path: '/admin/product',
        name: '/admin/sproduct',
        meta: {
            sidebar: 'product',
            layout: dashboard,
            admin: true,
        },
        component: () => import('@/views/admin/product.vue')
    },
    {
        path: '/admin/product/:type',
        name: '/admin/sproduct-type',
        meta: {
            sidebar: 'product',
            layout: dashboard,
            admin: true,
        },
        component: () => import('@/views/admin/product.vue')
    },
    {
        path: '/admin/order/',
        name: '/admin/sorder',
        meta: {
            sidebar: 'order',
            layout: dashboard,
            admin: true,
        },
        component: () => import('@/views/admin/order.vue')
    },
    {
        path: '/admin/order/:type',
        name: '/admin/sorder-type',
        meta: {
            sidebar: 'order',
            layout: dashboard,
            admin: true,
        },
        component: () => import('@/views/admin/order.vue')
    },
    {
        path: '/admin/:catchAll(.*)',
        name: '/admin/snotfound',
        meta: {
            layout: main,
            admin: true,
        },
        component: () => import('@/views/notFound.vue')
    }
]