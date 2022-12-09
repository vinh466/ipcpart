import { createRouter, createWebHistory, type RouteRecordRaw } from 'vue-router'
import main from '@/views/layouts/main.vue'
import { authGuard, redirectGuard } from './guards';
import { userRoutes } from './user.route';
import { adminRoutes } from './admin.route';
import auth from '@/views/layouts/auth.vue';

const routes: Array<RouteRecordRaw> = [
  ...userRoutes,
  ...adminRoutes,
  {
    path: '/:catchAll(.*)',
    name: 'notfound',
    meta: {
      layout: auth
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
