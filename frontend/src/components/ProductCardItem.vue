<template>
  <div class="card">
    <div
      class="card-thumbnail"
      @click="(e) => handleViewProduct(e, item.productId)"
    >
      <img
        v-lazy="`/image/product/${item.imgUrl}`"
        :alt="item.imgUrl.slice(0 - 4)"
      />
    </div>

    <div class="card-detail">
      <div
        class="card-detail__name"
        @click="(e) => handleViewProduct(e, item.productId)"
      >
        <span>{{ item.productName }}</span>
      </div>

      <div class="card-detail_bot">
        <div class="card-detail__price">
          <span>{{ formatVND(newPrice) }} </span>
          <del v-if="item.discount" class="card-detail__price--old"
            >{{ formatVND(item.price) }}
          </del>
        </div>

        <div
          :class="{ 'visible-hidden': starCount < 1 }"
          class="card-detail__review"
        >
          <span v-for="i in 5">
            <font-awesome-icon
              v-if="i < starCount + 1"
              icon="fa-solid fa-star"
            />
            <font-awesome-icon v-else icon="fa-regular fa-star" />
          </span>
          <span v-if="item.review"> ({{ item.review.total }} đánh giá)</span>
        </div>
      </div>
    </div>

    <div class="card-control" :class="{ 'card-control--hover': controlHover }">
      <button @click="(e) => handlePreview(e, item.productId)">
        <font-awesome-icon icon="fa-solid fa-eye" />
      </button>
      <button @click="(e) => handleAddToCart(e, item.productId)">
        <font-awesome-icon icon="fa-solid fa-cart-arrow-down" />
      </button>
      <button @click="(e) => handlePurchase(e, item.productId)">
        Mua Ngay
      </button>
    </div>

    <div v-if="item.discount" class="card-sale-flag">
      <span>-{{ item.discount }}%</span>
    </div>
  </div>
</template>

<script setup lang="ts">
import type { Product } from '@/types/api/products/product';
import { computed } from '@vue/runtime-core';
import { formatVND } from '@/util/formatNumber';
import { useToast } from 'vue-toastification';

const props = withDefaults(
  defineProps<{ item: Product; controlHover?: boolean }>(),
  {
    controlHover: true,
  }
);
const emit = defineEmits<{
  (e: 'onViewProduct', event: Event, id: String): void;
  (e: 'onPurchase', event: Event, id: String): void;
  (e: 'onAddToCart', event: Event, id: String): void;
  (e: 'onPreview', event: Event, id: String): void;
  (e: 'change', event: Event, id: number): void;
  (e: 'update', value: String): void;
}>();

const toast = useToast();

const starCount = computed(() => props.item.review?.rate || 0);
const newPrice = computed(() => {
  if (props.item.discount)
    return (props.item.price * (100 - props.item.discount)) / 100;
  return props.item.price;
});
const handleViewProduct = (e: Event, id: String) => {
  emit('onViewProduct', e, id);
  e.stopPropagation();
};
const handlePurchase = (e: Event, id: String) => {
  emit('onPurchase', e, id);
  e.stopPropagation();
};
const handleAddToCart = (e: Event, id: String) => {
  emit('onAddToCart', e, id);
  e.stopPropagation();
};
const handlePreview = (e: Event, id: String) => {
  emit('onPreview', e, id);
  e.stopPropagation();
};
</script>

<style lang="scss">
.card {
  display: flex;
  position: relative;
  flex-direction: column;
  justify-content: space-between;
  min-width: 200px;
  margin: 10px;
  background: white;
  color: var(--text-light-1);
  cursor: pointer;

  &:hover {
    .card-control {
      visibility: visible;
    }

    .card-detail__name {
      color: var(--green-mute);
    }
  }

  &-thumbnail {
    display: flex;
    align-items: center;
    object-fit: cover;
    width: 100%;
    height: 226px;
    position: relative;
    margin-bottom: 5px;

    & img {
      -webkit-user-drag: none;
      -khtml-user-drag: none;
      -moz-user-drag: none;
      -o-user-drag: none;
      user-drag: none;
      user-select: none;
      width: 100%;
      max-width: 100%;
    }
  }
  &-detail {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    flex: 1;
    margin-bottom: 5px;

    &__name {
      display: block;
      padding: 0 10px;
      /* text-align: justify; */
      overflow: hidden;
      text-overflow: ellipsis;
      display: -webkit-box;
      -webkit-line-clamp: 2; /* number of lines to show */
      line-clamp: 2;
      -webkit-box-orient: vertical;
    }

    &__price {
      padding: 10px 10px 0;

      &:first-child {
        font-weight: 700;
      }
      &--old {
        padding: 0 5px;
        color: gray;
        font-size: 0.9rem;
      }
    }

    &__review {
      padding: 0 10px;
      font-size: 0.9rem;
      & svg {
        color: orange;
      }
    }
  }
  &-sale-flag {
    position: absolute;
    top: 3px;
    left: 3px;
    color: white;
    background-color: red;
    font-weight: 700;
    border-radius: 50px;
    padding: 0 5px 0 2px;
  }

  &-control {
    display: flex;
    justify-content: end;
    margin: 0 5px 5px;

    & > * {
      font-size: 18px;
      margin-right: 5px;
      padding: 5px 8px;
      background-color: var(--green-soft);
    }

    &--hover {
      flex-direction: row-reverse;
      position: absolute;
      bottom: 115px;
      right: 0;
      visibility: hidden;
      z-index: 99;
    }
  }
}
</style>
