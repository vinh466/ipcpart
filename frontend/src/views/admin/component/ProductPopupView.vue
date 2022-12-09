<template>
  <div class="product-popup-view">
    <div class="heading">
      <h1>Sản phẩm</h1>
      <div class="control-btn">
        <button class="escape-btn" @click="emit('escape')">
          <font-awesome-icon icon="fa-solid fa-xmark" />
        </button>
      </div>
    </div>
    <hr />
    <div class="product-content">
      <div class="info-table">
        <table>
          <tbody></tbody>
        </table>
      </div>
    </div>
  </div>
</template>
<script setup lang="ts">
  import { product } from '@/components/datatemplate';
  import adminProductService from '@/service/admin/product/product.service';
  import type { Product } from '@/types/api/products';
  import { formatVND } from '@/util/formatNumber';
  import { onMounted, ref, computed, defineEmits } from 'vue';
  import type { TypeOf } from 'yup';

  const props = defineProps<{
    productItem: Product;
  }>();
  const emit = defineEmits(['escape', 'click']);
  const productList = ref<Product[]>();
  console.log(props.productItem);
  onMounted(async () => {
    if (props.productItem) {
      //   const result = await adminProductService.getProducts({
      //     pageSize: 1000,
      //     query: { },
      //   });
      console.log(props.productItem);
      //   productList.value = result.data;
    }
  });
</script>
<style lang="scss">
  .product-popup-view {
    min-width: 900px;
    min-height: 600px;
    background-color: #fff;
    border-radius: 5px;
    padding: 10px;
    color: var(--text-light-2);

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
      flex-direction: row;
      justify-content: space-between;

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
