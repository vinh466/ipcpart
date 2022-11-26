<template>
  <div class="header">
    <div class="header-top">
      <div class="container">
        <div class="left">
          <!-- <span>top header</span> -->
        </div>
        <div class="right">
          <ThemeButton />
        </div>
      </div>
    </div>
    <div class="header-main">
      <div class="container">
        <div class="logo">
          <router-link to="/">
            <img alt="brand logo" src="@/assets/image/brand-logo.png" />
          </router-link>
        </div>

        <div class="sreach-bar">
          <input type="text" name="headerSreach" id="headerSreach" />
          <button>Tìm</button>
        </div>

        <div class="right">
          <div class="cart_btn">
            <span class="cart_count" v-if="count" :key="count">{{
              count
            }}</span>
            <router-link to="/cart">
              <font-awesome-icon icon="fa-solid fa-cart-shopping" />
              Giỏ hàng
            </router-link>

            <div class="cart_dropdown">
              <div class="content" v-if="cartItems.length">
                <div class="dropdown_cardList">
                  <div
                    class="card"
                    v-for="(cartItem, index) in cartItems"
                    :key="index"
                  >
                    <div
                      class="remove"
                      @click="
                        () => cartStore.removeFromCart(cartItem.productId)
                      "
                    >
                      <font-awesome-icon icon="fa-regular fa-circle-xmark" />
                    </div>
                    <div class="photo">
                      <router-link
                        :to="`/product/${cartItem.productType.replace(
                          ' ',
                          '-'
                        )}/${cartItem.productId}`"
                      >
                        <img
                          :src="cartItem.productPhoto"
                          :alt="cartItem.productPhoto"
                      /></router-link>
                      <!-- <img
                        :src="cartItem.productPhoto"
                        :alt="cartItem.productPhoto"
                      /> -->
                    </div>
                    <div class="content">
                      <span class="name">{{ cartItem.productName }}</span>
                      <span class="price">{{
                        `${cartItem.quantity} x ${formatVND(
                          cartItem.price * 1000
                        )}`
                      }}</span>
                    </div>
                  </div>
                </div>
                <div class="dropdown_footer">
                  <div class="total">
                    Tổng:
                    <span class="price">
                      {{ `${formatVND(payAmount * 1000)}` }}</span
                    >
                  </div>
                  <div class="cartview">
                    <router-link to="/cart" tag="button"
                      ><button>Xem giỏ hàng</button></router-link
                    >
                  </div>
                </div>
              </div>
              <div class="content empty" v-else>
                Chưa có sản phẩm trong giỏ hàng.
              </div>
            </div>
          </div>

          <router-link to="/auth/signin" v-if="!user">
            <button>
              <font-awesome-icon :icon="['fa-regular', 'fa-user']" />
              Đăng Nhập
            </button>
          </router-link>

          <DropdownMenuButton
            v-else
            text-right
            menu-alignment="end"
            :dropdown-list="accountMenu"
          >
            <Avatar
              :initial="user && user.username?.slice(0, 1).toUpperCase()"
            />
            <span>&nbsp;{{ user && user.username }}</span>
          </DropdownMenuButton>
        </div>
      </div>
    </div>

    <div class="header-nav">
      <!-- prettier-ignore -->
      <div class="container">
        <div class="nav_items">
          <div class="nav_item" @click="router.push({path:'/product/cpu'})">
            <img class="nav_icon" src="/public/icon/cpu.svg" alt="cpu.svg " />
            <span class="nav_title">CPU</span>
          </div>
          <div class="nav_item" @click="router.push({path:'/product/mainboard'})">
            <img class="nav_icon" src="/public/icon/mainboard.svg" alt="mainboard.svg " />
            <span class="nav_title">Mainboard</span>
          </div>
          <div class="nav_item" @click="router.push({path:'/product/monitor'})">
            <img class="nav_icon" src="/public/icon/monitor.svg" alt="monitor.svg " />
            <span class="nav_title">Màn hình</span>
          </div>
          <div class="nav_item" @click="router.push({path:'/product/mouse'})">
            <img class="nav_icon" src="/public/icon/mouse.svg" alt="mouse.svg " />
            <span class="nav_title">Chuột</span>
          </div>
          <div class="nav_item" @click="router.push({path:'/product/ram'})">
            <img class="nav_icon" src="/public/icon/ram.svg" alt="ram.svg " />
            <span class="nav_title">Bộ nhớ</span>
          </div>
          <div class="nav_item" @click="router.push({path:'/product/storage-drive'})">
            <img class="nav_icon" src="/public/icon/ssd.svg" alt="ssd.svg " />
            <span class="nav_title">Lưu trữ</span>
          </div>
          <div class="nav_item" @click="router.push({path:'/product/video-card'})">
            <img class="nav_icon" src="/public/icon/videocard.svg" alt="videocard.svg" />
            <span class="nav_title">Card màn hình</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
  import { useAuthStore } from '@/stores/auth/AuthStore';
  import type { DropdownItem } from '@/types/component/props';
  import { ref } from '@vue/reactivity';
  import { onMounted, onUnmounted, watch } from '@vue/runtime-core';
  import { storeToRefs } from 'pinia';
  import DropdownMenuButton from './DropdownMenuButton.vue';
  import Avatar from './Avatar.vue';
  import ThemeButton from './ThemeButton.vue';
  import { useRouter } from 'vue-router';
  import { useCartStore } from '@/stores/CartStore';
  import { formatVND } from '@/util/formatNumber';
  const router = useRouter();
  const authStore = useAuthStore();
  const userMenu = [{ title: 'Đăng Xuất', onClick: authStore.logout }];
  const anonymousMenu = [
    { title: 'Đăng nhập', onClick: '/auth' },
    { title: 'Tạo tài khoản', onClick: '/auth/signup' },
  ];
  const accountMenu = ref(<DropdownItem[]>userMenu);
  const { user } = storeToRefs(authStore);

  const cartStore = useCartStore();
  const { cartItems, payAmount, count } = storeToRefs(cartStore);
  const cartUpdateCount = ref(0);
  watch(user, () => {
    checkUser();
  });
  watch(cartItems, () => {
    cartUpdateCount.value++;
  });
  onMounted(() => {
    checkUser();
  });

  onUnmounted(() => {
    console.log(authStore.user);
  });

  function checkUser() {}
</script>

<style lang="scss">
  .header {
    white-space: nowrap;
    --color-text: var(--text-dark-1);
    width: 100%;
    background-color: var(--color-primary);

    a {
      color: inherit;
      transition: none;
    }
    &-top {
      color: var(--color-text);
      height: 37px;
      border-bottom: 1px solid;
      border-color: rgba(255, 255, 255, 0.4);
      line-height: 36px;
      background: #0a804a;

      .container {
        display: flex;
        height: 100%;
        justify-content: space-between;
      }

      .right {
        display: flex;
        align-items: center;
      }
    }
    &-main {
      height: 94px;

      .container {
        display: flex;
        align-items: center;
        justify-content: space-between;
        .logo {
          width: 300px;
          height: 90px;
        }
        .sreach-bar {
          flex-grow: 1;
          min-width: 230px;
          border-radius: 5px;
          overflow: hidden;
          input {
            width: 100%;
            height: 40px;
            border: none;
            padding: 0 68px 0 8px;
            font-size: 20px;
          }
          button {
            position: absolute;
            top: 8%;
            right: 4px;
            height: 84%;
            width: 60px;
          }
        }
        .right {
          position: relative;
          color: var(--color-text);
          display: flex;
          justify-content: end;
          width: 350px;
          margin: 15px 8px 0;
          font-size: 20px;
          font-weight: 700;

          & > * {
            margin-left: 15px;
            display: flex;
          }
          button {
            padding: 4px 8px;
            color: var(--light);
            border-radius: 5px;
            background-color: transparent;
            font-size: inherit;
            &:hover {
              color: var(--orange-mute) !important;
            }
            span {
              margin-left: 5px;
            }
          }

          .cart_btn {
            position: relative;

            .cart_count {
              position: absolute;
              top: -5px;
              right: -10px;
              z-index: 99;
              color: #fff;
              background-color: red;
              padding: 0px 5px;
              border-radius: 50%;
              font-size: 10px;

              animation: hightlight 1s ease;
            }
            @keyframes hightlight {
              50% {
                transform: scale(1.2);
              }
            }
            &:hover > .cart_dropdown {
              display: block;
              opacity: 1;
              z-index: 9999;
            }
            .cart_dropdown {
              cursor: unset;
              // display: none;
              opacity: 0;
              color: var(--text-light-2);
              position: absolute;
              left: 50%;
              top: 30px;
              padding: 10px;
              z-index: -9999;
              transform: translateX(-50%);
              background-color: #fff;
              box-shadow: 5px 5px 25px #829c90;
              border-radius: 5px;
              transition: all 0.4s ease;
              .empty {
                font-size: 1rem;
              }
              .dropdown_cardList {
                max-height: 280px;
                overflow-y: scroll;
                border: 1px solid #ccc;
                .card {
                  display: flex;
                  flex-direction: row;
                  align-items: center;
                  border-bottom: 1px;
                  padding: 5px 0;
                  border-color: #ccc;
                  border-style: solid;

                  .remove {
                    margin: 0 5px;
                    font-size: 1rem;
                    &:hover {
                      cursor: pointer;
                      color: red;
                    }
                  }
                  .photo {
                    border: 1px solid #ccc;
                    padding: 0 5px;
                    border-radius: 5px;
                    img {
                      width: 45px;
                      height: 45px;
                      object-fit: contain;
                    }
                  }
                  .content {
                    display: flex;
                    flex-direction: column;
                    padding: 0 5px;
                    width: 250px;

                    .name {
                      font-size: 1rem;
                      white-space: nowrap;
                      overflow: hidden;
                      text-overflow: ellipsis;
                    }
                    .price {
                      font-size: 0.9rem;
                      color: var(--orange);
                    }
                  }
                }
              }

              .dropdown_footer {
                .total {
                  display: flex;
                  justify-content: center;
                  border-bottom: 1px solid #ccc;
                  .price {
                    color: var(--orange);
                    padding: 0 10px;
                  }
                }
                .cartview {
                  display: flex;
                  justify-content: center;
                  margin: 10px 0 5px;
                  button {
                    border: 2px solid transparent;
                    color: #fff;
                    background-color: var(--orange);
                    &:hover {
                      color: var(--orange) !important;
                      background-color: transparent;
                      border: 2px solid var(--orange);
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    &-nav {
      .nav_items {
        display: flex;

        .nav_item {
          cursor: pointer;
          color: #eee;
          display: flex;
          padding-bottom: 10px;
          user-select: none;
          .nav_icon {
            width: 20px;
          }
          .nav_title {
            padding: 0 10px;
            font-weight: bold;
          }
          &:hover .nav_title {
            color: var(--orange);
            transition: all 0.25s ease;
          }
          &:hover .nav_icon {
            transform: scale(1.2);
            transition: all 0.25s ease;
          }
        }
      }
    }
  }
</style>
