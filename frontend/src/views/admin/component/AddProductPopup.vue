<template>
  <div class="product-popup-view" @click="(e) => e.stopPropagation()">
    <div class="heading">
      <h1>Thêm Sản phẩm</h1>
      <div class="control-btn">
        <button class="escape-btn" @click="emit('escape')">
          <font-awesome-icon icon="fa-solid fa-xmark" />
        </button>
      </div>
    </div>
    <hr />
    <div class="product-content">
      <ul class="navbar product-type">
        <li
          class="product-type-item"
          :class="{ active: productType == 'cpu' }"
          @click="(e) => (productType = 'cpu')"
        >
          <span to="/admin/product/cpu">CPU</span>
        </li>
        <li
          class="product-type-item"
          :class="{ active: productType == 'mainboard' }"
          @click="(e) => (productType = 'mainboard')"
        >
          <span to="/admin/product/mainboard">Mainboard</span>
        </li>
        <li
          class="product-type-item"
          :class="{ active: productType == 'monitor' }"
          @click="(e) => (productType = 'monitor')"
        >
          <span to="/admin/product/monitor">Màn hình</span>
        </li>
        <li
          class="product-type-item"
          :class="{ active: productType == 'mouse' }"
          @click="(e) => (productType = 'mouse')"
        >
          <span to="/admin/product/mouse">Chuột</span>
        </li>
        <li
          class="product-type-item"
          :class="{ active: productType == 'ram' }"
          @click="(e) => (productType = 'ram')"
        >
          <span to="/admin/product/ram">Bộ nhớ</span>
        </li>
        <li
          class="product-type-item"
          :class="{ active: productType == 'storage-drive' }"
          @click="(e) => (productType = 'storage-drive')"
        >
          <span to="/admin/product/storage-drive">Lưu trữ</span>
        </li>
        <li
          class="product-type-item"
          :class="{ active: productType == 'video-card' }"
          @click="(e) => (productType = 'video-card')"
        >
          <span to="/admin/product/video-card">Card màn hình</span>
        </li>
      </ul>
      <div class="info-table">
        <div class="" :key="productType">
          <CpuForm v-if="productType == 'cpu'" @on-escape="emit('escape')" />
          <MainboardForm
            v-else-if="productType == 'mainboard'"
            @on-escape="emit('escape')"
          />
          <MonitorForm
            v-else-if="productType == 'monitor'"
            @on-escape="emit('escape')"
          />
          <MouseForm
            v-else-if="productType == 'mouse'"
            @on-escape="emit('escape')"
          />
          <RamForm
            v-else-if="productType == 'ram'"
            @on-escape="emit('escape')"
          />
          <StoragedriveForm
            v-else-if="productType == 'storage-drive'"
            @on-escape="emit('escape')"
          />
          <VideocardForm
            v-else-if="productType == 'video-card'"
            @on-escape="emit('escape')"
          />
        </div>
      </div>
    </div>
  </div>
</template>
<script setup lang="ts">
  import type { Product } from '@/types/api/products';
  import { formatVND } from '@/util/formatNumber';
  import { onMounted, ref, computed, defineEmits, markRaw } from 'vue';
  import CpuForm from './CpuForm.vue';
  import MainboardForm from './MainBoardForm.vue';
  import MonitorForm from './MonitorForm.vue';
  import MouseForm from './MouseForm.vue';
  import RamForm from './RamForm.vue';
  import StoragedriveForm from './StoragedriveForm.vue';
  import VideocardForm from './VideocardForm.vue';
  // const props = defineProps<{
  //   // productItem?: Product;
  // }>();

  const productType = ref('cpu');
  const emit = defineEmits(['escape', 'click']);
  const productList = ref<Product[]>();
  onMounted(async () => {});
</script>
<style lang="scss">
  .product-popup-view {
    width: 1000px;
    min-height: 100px;
    background-color: #fff;
    border-radius: 5px;
    padding: 10px;
    color: var(--text-light-2);
    transition: all 0.3s ease;

    .heading {
      font-size: 1.4rem;
      font-weight: bold;
      display: flex;
      flex-direction: row;
      justify-content: space-between;

      .control-btn {
        height: 20px;
        display: flex;
        button {
          color: #aaaaaa;
          padding: 2px 8px;
          font-size: 1rem;
          background-color: transparent;
          &:hover {
            background-color: #eee;
          }
        }
      }
    }

    .product-content {
      display: flex;
      flex-direction: column;

      .product-type {
        display: flex;
        flex-direction: row;
        gap: 20px;
        cursor: pointer;
        .product-type-item {
          transition: all 0.4s ease;
          border-bottom: 4px solid transparent;

          span {
            color: var(--text-light-2);
            padding: 4px 10px;
            transition: 0.1s;
          }
          &.active {
            border-radius: 2px;
            color: var(--text-light-1);
            border-bottom: 4px solid var(--orange);
          }
          &:not(.active):hover {
            background-color: #eee;
          }
        }
      }
      .info-table {
        flex: 1;
        color: #000;
        td {
          vertical-align: middle;
        }
        .title {
          vertical-align: middle;
          text-align: end;
          font-weight: 500;
          padding: 0 10px;
        }
      }
    }
  }
</style>
