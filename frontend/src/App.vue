<script setup lang="ts">
import { computed, onMounted } from 'vue';
import { useRoute } from 'vue-router';

const props = defineProps({});
const route = useRoute();
const layout = computed(() => route.meta.layout || 'div');
</script>

<template>
  <component :is="layout">
    <RouterView />
  </component>
</template>