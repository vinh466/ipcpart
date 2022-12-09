<script setup lang="ts">
  import { computed, onMounted, watch } from 'vue';
  import { useRoute } from 'vue-router';
  import { useCartStore } from '@/stores/CartStore';
  import { useAuthStore } from './stores/auth/AuthStore';
  import { useAdminAuthStore } from './stores/auth/AdminAuthStore';

  const props = defineProps({});
  const route = useRoute();

  const layout = computed(() => route.meta.layout || 'div');
  const isAdmin = computed(() => route.meta.admin || false);
  watch(isAdmin, () => {
    if (isAdmin.value) {
      console.log('Admin');
      const adminAuthStore = useAdminAuthStore();
      adminAuthStore.getAccessToken();
      adminAuthStore.fetch();
    }
  });
  const authStore = useAuthStore();
  authStore.fetch();
  const cartStore = useCartStore();
  onMounted(() => {
    addEventListener('storage', (event) => {
      cartStore.update();
    });
  });
</script>

<template>
  <component :is="layout">
    <RouterView />
  </component>
</template>
