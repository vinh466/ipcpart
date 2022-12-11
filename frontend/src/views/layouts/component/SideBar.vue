<template>
  <aside class="app-sidebar">
    <div class="app-sidebar__user">
      <p class="app-sidebar__user-name">
        <b>{{ user?.name + ' - ' + roleName }}</b>
      </p>
      <div class="app-sidebar__user-exist">
        <button @click="authStore.logout()">
          <font-awesome-icon icon="fa-solid fa-right-from-bracket" />
        </button>
      </div>
    </div>
    <hr />
    <ul class="app-menu">
      <!-- <li>
        <router-link
          to="/admin"
          class="app-menu__item"
          :class="{ active: route.meta.sidebar == 'dashboard' }"
        >
          <font-awesome-icon
            class="app-menu__icon"
            icon="fa-solid fa-table-columns"
          />
          <span class="app-menu__label">Tổng quan</span>
        </router-link>
      </li> -->
      <li>
        <router-link
          to="/admin/staff"
          class="app-menu__item"
          :class="{ active: route.meta.sidebar == 'staff' }"
        >
          <font-awesome-icon
            class="app-menu__icon"
            icon="fa-solid fa-user-tie"
          />
          <span class="app-menu__label">Quản lý nhân viên</span>
        </router-link>
      </li>
      <li>
        <router-link
          to="/admin/user"
          class="app-menu__item"
          :class="{ active: route.meta.sidebar == 'user' }"
        >
          <font-awesome-icon
            class="app-menu__icon"
            icon="fa-solid fa-user"
          /><span class="app-menu__label">Quản lý khách hàng</span>
        </router-link>
      </li>
      <li>
        <router-link
          to="/admin/product"
          class="app-menu__item"
          :class="{ active: route.meta.sidebar == 'product' }"
        >
          <font-awesome-icon class="app-menu__icon" icon="fa-solid fa-tags" />
          <span class="app-menu__label">Quản lý sản phẩm</span>
        </router-link>
      </li>
      <li>
        <router-link
          to="/admin/order"
          class="app-menu__item"
          :class="{ active: route.meta.sidebar == 'order' }"
        >
          <font-awesome-icon
            class="app-menu__icon"
            icon="fa-solid fa-clipboard-check"
          /><span class="app-menu__label">Quản lý đơn hàng</span>
        </router-link>
      </li>
    </ul>
  </aside>
</template>
<script setup lang="ts">
  import { useAdminAuthStore } from '@/stores/auth/AdminAuthStore';
  import { storeToRefs } from 'pinia';
  import { useRoute } from 'vue-router';
  import { computed } from 'vue';
  const route = useRoute();
  const authStore = useAdminAuthStore();
  const { user } = storeToRefs(authStore);
  const roleName = computed(() => {
    console.log(user.value?.roles);
    let role = 'Nhân viên';
    if (user.value?.roles) {
      user.value?.roles.forEach((value) => {
        if (value === 'admin') role = 'Quản lý';
      });
    }
    return role;
  });
</script>
<style lang="scss">
  .app-sidebar {
    position: fixed;
    top: 0;
    bottom: 0;
    left: 0;
    padding-top: 20px;
    padding-left: 10px;
    padding-right: 10px;
    overflow: auto;
    z-index: 10;
    // background: rgb(0, 28, 64);
    background-color: var(--color-primary);
    /* box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23); */
    /* border-bottom-right-radius: 50px; */

    &::-webkit-scrollbar {
      width: 6px;
    }

    &::-webkit-scrollbar-thumb {
      background: rgba(0, 0, 0, 0.2);
    }

    @media print {
      & {
        display: none;
      }
    }

    &__user {
      display: flex;
      flex-direction: row;
      justify-content: space-between;
      padding: 0 5px 10px 20px;
      color: white;
      &-avatar {
        background: white;
        border-radius: 0.357rem;
        width: 70px;
        border: 3px solid white;
        margin-bottom: 10px;
      }
      &-name {
        font-size: 17px;
        font-weight: bold;
        line-height: 1.3;
      }
      &-exist {
        button {
          background-color: transparent;
          padding: 4px 8px;
        }
      }
      &-name,
      &-designation {
        white-space: nowrap;
        overflow: hidden;
        -o-text-overflow: ellipsis;
        text-overflow: ellipsis;
        margin-bottom: 0;
      }
    }

    .info-tong {
      font-size: 12px !important;
      margin-top: 5px !important;
      border-top: 1px dashed #e8e8e8;
      padding-top: 10px !important;
    }

    .app-menu {
      display: flex;
      flex-direction: column-reverse;
      margin-bottom: 0;
      padding-bottom: 40px;

      &__item {
        position: relative;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-align: center;
        -ms-flex-align: center;
        align-items: center;
        border-radius: 0.375rem;
        margin-bottom: 10px;
        padding: 15px 15px;
        font-size: 1.08em;
        border-left: 0px;
        box-shadow: none;
        -webkit-transition: border-left-color 0.3s ease,
          background-color 0.3s ease;
        -o-transition: border-left-color 0.3s ease, background-color 0.3s ease;
        transition: border-left-color 0.3s ease, background-color 0.3s ease;
        color: white;
        border: 1px solid transparent;
        /* border-bottom: 1px solid #ddd; */
        &.active,
        &:hover,
        &:focus {
          background: #eeee;
          // background: #c6defd;
          text-decoration: none;
          color: rgb(22 22 72);
          box-shadow: none;
        }
      }

      &__icon {
        font-size: 23px;
        -webkit-box-flex: 0;
        -ms-flex: 0 0 auto;
        flex: 0 0 auto;
        width: 40px;
      }
    }
  }
</style>
