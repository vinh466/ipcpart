<template>
  <div class="product_overview" v-if="productItem">
    <div class="product_info">
      <div class="product_info-productName">
        <p>{{ productItem.productName }}</p>
      </div>
      <div class="divider--small"></div>
      <div class="product_info-price">
        <p>{{ formatVND(productItem.price * 1000) }}</p>
      </div>
      <div class="product_info-productBrand">
        <p>Hãng: {{ productItem.productBrand }}</p>
      </div>
      <div class="product_info-processor">
        <p>Bộ xử lý: {{ productItem.chipset }}</p>
      </div>
      <div class="product_info-gen">
        <p>Thế hệ: {{ productItem.form }}</p>
      </div>
      <div class="product_info-iGpu">
        <p>Bộ xử lý đồ họa{{ productItem.socket }}</p>
      </div>
      <div class="product_info-socket">
        <p>Socket: {{ productItem.ramCap }}</p>
      </div>
      <div class="product_info-coreCount">
        <p>Nhân: {{ productItem.ramStandard }}</p>
      </div>
      <div class="product_info-thread">
        <p>Luồng: {{ productItem.color }}</p>
      </div>
      <div class="product_info-coreClock">
        <p>Tốc độ: {{ productItem.ramSlot }}</p>
      </div>

      <div class="product_info-control" v-if="productItem">
        <button @click="(e) => handleAddToCart(e)">
          <font-awesome-icon icon="fa-solid fa-cart-arrow-down" /> Thêm vào giỏ
        </button>
        <button @click="(e) => handlePurchase(e)">Mua Ngay</button>
      </div>
    </div>
    <div class="product_Img">
      <img :src="productItem.productPhoto" alt="" srcset="" />
    </div>
  </div>
</template>

<script setup lang="ts">
  import type { MainboardModel } from '@/types/api/products/mainboard';
  import { formatVND } from '@/util/formatNumber';
  import { defineProps } from 'vue';
  const props = defineProps<{
    productItem: MainboardModel;
    productType: string;
  }>();
  const emit = defineEmits<{
    (e: 'onPurchase', id: string): void;
    (e: 'onAddToCart', product: MainboardModel): void;
  }>();

  function handleAddToCart(e: Event) {
    e.stopPropagation();
    emit('onAddToCart', props.productItem);
  }
  function handlePurchase(e: Event) {
    e.stopPropagation();
    emit('onPurchase', props.productItem.productId);
  }
</script>

<style lang=""></style>
