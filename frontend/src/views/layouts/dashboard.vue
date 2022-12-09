<template>
  <div class="admin">
    <SideBar class="sidebar" />
    <div class="content">
      <slot />
    </div>
  </div>
</template>
<script setup lang="ts">
  import { useRoute } from 'vue-router';
  import SideBar from './component/SideBar.vue';
  const route = useRoute();
  document.body.dataset.theme = '';
</script>
<style lang="scss">
  .admin {
    .sidebar {
      width: 250px;
    }
    .content {
      position: relative;
      margin-left: 250px;
      padding: 10px;
    }
  }
</style>
