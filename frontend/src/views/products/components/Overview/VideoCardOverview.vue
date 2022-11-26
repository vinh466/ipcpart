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
        <p>Bộ xử lý: {{ productItem.chipsetName }}</p>
      </div>
      <div class="product_info-gen">
        <p>Thế hệ: {{ productItem.coreClock }}</p>
      </div>
      <div class="product_info-iGpu">
        <p>Bộ xử lý đồ họa{{ productItem.boostClock }}</p>
      </div>
      <div class="product_info-socket">
        <p>Socket: {{ productItem.color }}</p>
      </div>
      <div class="product_info-coreCount">
        <p>Nhân: {{ productItem.length }}</p>
      </div>
      <div class="product_info-thread">
        <p>Luồng: {{ productItem.memory }}</p>
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
  import type { VideoCardModel } from '@/types/api/products/videocard';
  import { formatVND } from '@/util/formatNumber';
  import { defineProps } from 'vue';
  const props = defineProps<{
    productItem: VideoCardModel;
    productType: string;
  }>();
  const emit = defineEmits<{
    (e: 'onPurchase', id: string): void;
    (e: 'onAddToCart', product: VideoCardModel): void;
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
