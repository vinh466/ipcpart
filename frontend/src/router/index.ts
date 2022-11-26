import { createRouter, createWebHistory, type RouteRecordRaw } from 'vue-router'
import Intro from '@/views/intro.vue'
import main from '@/views/layouts/main.vue'
import auth from '@/views/layouts/auth.vue'
import { authGuard, redirectGuard } from './guards';


const routes: Array<RouteRecordRaw> = [
  {
    path: '/',
    name: 'home',
    meta: {
      layout: main
    },
    component: () => import('@/views/home/home.vue')
  },
  {
    path: '/home',
    name: 'intro',

    meta: {
      layout: main
    },
    component: Intro
  },
  {
    path: '/cart',
    name: 'cart',
    meta: {
      layout: main
    },
    component: () => import('@/views/cart/cart.vue')
  },
  {
    path: '/auth/:action',
    name: 'auth',
    meta: {
      layout: main
    },
    component: () => import('@/views/auth/auth.vue')
  },
  {
    path: '/product/:productType',
    name: 'productSreach',
    meta: {
      layout: main
    },
    component: () => import('@/views/products/product.vue')
  },
  {
    path: '/product/:productType/:productId',
    name: 'productOverview',
    meta: {
      layout: main
    },
    component: () => import('@/views/products/productDetail.vue')
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

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes
})

router.beforeEach(authGuard);
router.beforeEach(redirectGuard);

export default router
