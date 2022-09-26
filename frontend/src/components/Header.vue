<template>
  <div class="header">
    <div class="header-top">
      <div class="container">
        <div class="left">
          <span>top header</span>
        </div>
        <div class="right">
          <button class="theme-btn" @click="changeTheme">
            <font-awesome-icon
              v-if="darkTheme"
              class="theme-icon"
              icon="fa-solid fa-moon"
              style="color: black"
            />
            <font-awesome-icon
              v-else
              class="theme-icon"
              icon="fa-solid fa-sun"
            />
          </button>
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
          <router-link to="/cart">
            <button>
              <font-awesome-icon icon="fa-solid fa-cart-shopping" />
              Giỏ hàng
            </button>
          </router-link>

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
      <div class="container"></div>
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

const authStore = useAuthStore();
const userMenu = [{ title: 'Đăng Xuất', onClick: authStore.logout }];
const anonymousMenu = [
  { title: 'Đăng nhập', onClick: '/auth' },
  { title: 'Tạo tài khoản', onClick: '/auth/signup' },
];
const darkTheme = ref(true);
const accountMenu = ref(<DropdownItem[]>userMenu);
const { user } = storeToRefs(authStore);

watch(user, () => {
  checkUser();
});

onMounted(() => {
  checkUser();
});
function changeTheme() {
  darkTheme.value = !darkTheme.value;
  document.body.dataset.theme = darkTheme.value ? 'dark' : '';
}

onUnmounted(() => {
  console.log(authStore.user);
});

function checkUser() {}
</script>

<style lang="scss" >
.header {
  --color-text: var(--text-dark-1);
  width: 100%;
  background-color: var(--color-primary);

  &-top {
    color: var(--color-text);
    height: 37px;
    border-bottom: 1px solid;
    border-color: rgba(255, 255, 255, 0.4);
    line-height: 36px;
    background: #0a804a;

    .container {
      display: flex;
      justify-content: space-between;
    }
    .theme-btn {
      background-color: transparent;
    }
    .theme-icon {
      user-select: none;
      border: 3px solid currentColor;
      border-radius: 50px;
      padding: 2px 3px;
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
      }
    }
  }
}
</style>
