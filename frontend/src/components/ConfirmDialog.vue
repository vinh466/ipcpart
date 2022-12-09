<template>
  <div class="confirm-dialog" v-if="true" @click="(e) => e.stopPropagation()">
    <h1 class="title">{{ title }}</h1>
    <p class="msg">{{ msg }}</p>
    <div class="btn-control">
      <button @click="handleCancel">Hủy</button>
      <button @click="handleConfirm">Xác nhận</button>
    </div>
  </div>
</template>
<script setup lang="ts">
  import { defineProps } from 'vue';
  const props = defineProps<{
    title: string;
    msg: string;
  }>();
  const emit = defineEmits(['onConfirm', 'onCancel']);
  function handleCancel(e: Event) {
    e.stopPropagation();
    emit('onCancel');
  }
  function handleConfirm(e: Event) {
    e.stopPropagation();
    emit('onConfirm');
  }
</script>
<style lang="scss">
  .confirm-dialog {
    background-color: #fff;
    padding: 10px 20px;
    border-radius: 5px;
    .title {
      color: var(--text-light-1);
      font-weight: 600;
      font-size: 1.1rem;
    }
    .msg {
      color: var(--text-light-2);
      margin-bottom: 20px;
    }
    .btn-control {
      text-align: end;
      button {
        margin-left: 10px;
        padding: 4px 8px;
      }
    }
  }
</style>
