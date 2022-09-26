<template>
  <div class="home">
    <div class="container">
      <div class="banner">
        <h1>AD Section</h1>
        <img src="/image/adv.jpg" alt="adv" />
      </div>

      <div>
        <ProductSection
          sectionTitle="Dành cho bạn"
          :sectionCategory="['asd', 'asdsad']"
        />
        <ProductSection :reverse-col="true" />
        <ProductSection />
        <ProductSection :reverse-col="true" />
        <ProductSection />
        <ProductSection :reverse-col="true" :banner="false" :row="2" />
      </div>

      <div>
        <h1>Last View Section</h1>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { getSSD } from '@/api/products/fetchData';
import type { ProductPageResult } from '@/types/api/products/product';
import { onMounted, ref } from '@vue/runtime-core';
import CardList from '../../components/ProductCardList.vue';
import ProductSection from './components/ProductSection.vue';
const ssd = ref<ProductPageResult>();

onMounted(() => {
  setTimeout(() => (ssd.value = getSSD()), 2000);
  // console.log(ssd);
});
</script>

<style lang="scss" scoped>
.banner {
  img {
    width: 100%;
    height: 430px;
    object-fit: cover;
    background: white;
  }
}
@media (min-width: 1024px) {
  .home {
    display: flex;
    align-items: center;
  }
}
</style>
