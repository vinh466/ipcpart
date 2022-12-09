<template>
  <div class="product-popup-view" @click="(e) => e.stopPropagation()">
    <div class="heading">
      <h1>Chỉnh sửa sản phẩm</h1>
      <div class="control-btn">
        <button class="escape-btn" @click="emit('escape')">
          <font-awesome-icon icon="fa-solid fa-xmark" />
        </button>
      </div>
    </div>
    <hr />
    <div class="product-content">
      <div class="info-table">
        <div class="" :key="productType">
          <CpuForm
            :edit-form="true"
            v-if="productType == 'cpu'"
            :product="productItem"
            @on-escape="emit('escape')"
          />
          <MainboardForm
            :edit-form="true"
            v-else-if="productType == 'mainboard'"
            :product="productItem"
            @on-escape="emit('escape')"
          />
          <MonitorForm
            :edit-form="true"
            v-else-if="productType == 'monitor'"
            :product="productItem"
            @on-escape="emit('escape')"
          />
          <MouseForm
            :edit-form="true"
            v-else-if="productType == 'mouse'"
            :product="productItem"
            @on-escape="emit('escape')"
          />
          <RamForm
            :edit-form="true"
            v-else-if="productType == 'ram'"
            :product="productItem"
            @on-escape="emit('escape')"
          />
          <StoragedriveForm
            :edit-form="true"
            v-else-if="productType == 'storage drive'"
            :product="productItem"
            @on-escape="emit('escape')"
          />
          <VideocardForm
            :edit-form="true"
            v-else-if="productType == 'video card'"
            :product="productItem"
            @on-escape="emit('escape')"
          />
        </div>
      </div>
    </div>
  </div>
</template>
<!-- productType == 'cpu' 
productType == 'mainboard' 
productType == 'monitor' 
productType == 'mouse' 
productType == 'ram' 
productType == 'storage-drive' 
productType == 'video-card'  -->
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
  const props = defineProps<{
    productItem?: Product;
  }>();

  const productType = computed(() => props.productItem?.productType || '');
  const emit = defineEmits(['escape', 'click']);
  const productList = ref<Product[]>();
  onMounted(async () => {
    console.log(productType);
  });
</script>
<style lang="scss">
  .product-popup-view {
    min-width: 200px;
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
