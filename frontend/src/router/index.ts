import { createRouter, createWebHistory, type RouteRecordRaw } from 'vue-router'
import Intro from '@/views/intro.vue'
import main from '@/views/layouts/main.vue'
import auth from '@/views/layouts/auth.vue'
import { authGuard, redirectGuard } from './guards';


const routes: Array<RouteRecordRaw> = [
  {
    path: '/',
    name: 'intro',
    meta: {
      layout: main
    },
    component: Intro
  },
  {
    path: '/home',
    name: 'home',

    meta: {
      layout: main
    },
    component: () => import('@/views/home/index.vue')
  },
  {
    path: '/cart',
    name: 'cart',
    meta: {
      layout: main
    },
    component: () => import('@/views/cart/index.vue')
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
