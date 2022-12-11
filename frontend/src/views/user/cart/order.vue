<template>
  <div class="">
    <div class="container">
      <Breadcrumb :breadcrumb-paths="breadcrumbPath" :last-path="'Giỏ hàng'" />
      <div class="order">
        <div class="table-wrapper">
          <div class="heading">
            <div class="top">
              <div class="page-size-input">
                Hiện
                <select
                  name="pageSize"
                  id="pageSize"
                  v-model="pagination.pageSize"
                >
                  <option value="20">20</option>
                  <option value="10">10</option>
                  <option value="5">5</option>
                </select>
                danh mục
              </div>
              <div class="search">
                <span>Tìm kiếm </span>
                <input
                  type="text"
                  name="searchTable"
                  v-model="searchTable"
                  id="searchTable"
                />
              </div>
            </div>
            <ul class="navbar order-type">
              <li class="order-type-item active">
                <router-link to="/order/">Tất cả</router-link>
              </li>
              <li class="order-type-item">
                <router-link to="/order/pending">Đang duyệt</router-link>
              </li>
              <li class="order-type-item">
                <router-link to="/order/awaiting-payment"
                  >Chờ thanh toán</router-link
                >
              </li>
              <li class="order-type-item">
                <router-link to="/order/awaiting-pickup"
                  >Đang lấy hàng</router-link
                >
              </li>
              <li class="order-type-item">
                <router-link to="/order/awaiting-shipment"
                  >Đang vận chuyển</router-link
                >
              </li>
              <li class="order-type-item">
                <router-link to="/order/compeleted">Hoàn thành</router-link>
              </li>
              <li class="order-type-item">
                <router-link to="/order/cancelled">Đã hủy</router-link>
              </li>
              <li class="order-type-item">
                <router-link to="/order/refunded">Đã trả hàng</router-link>
              </li>
            </ul>
          </div>
          <table>
            <thead>
              <tr>
                <th>Mã đơn</th>
                <th>Thời gian</th>
                <th>Email</th>
                <th>Người nhận</th>
                <th>Địa chỉ</th>
                <th>Sđt</th>
                <th>PT</th>
                <th>Trạng thái</th>
                <th>Tổng Thanh toán</th>
              </tr>
            </thead>
            <tbody :class="{ 'table-loading': tableLoading }">
              <template v-for="(item, index) in orderData?.data" :key="index">
                <tr class="product-item">
                  <td class="action copy-action">
                    <div class="action-group">
                      <button
                        class="copy-btn"
                        @click="(e) => handleCopyToClipboard(e, item.orderId)"
                      >
                        <font-awesome-icon icon="fa-regular fa-copy" />
                      </button>
                    </div>
                  </td>
                  <td class="product-item_time">
                    <span>{{
                      item.createdAt &&
                      new Date(item.createdAt).toLocaleString()
                    }}</span>
                  </td>
                  <td class="product-item_email">
                    <span>{{ item.email }}</span>
                  </td>
                  <td class="product-item_name">
                    <span>{{ item.name }}</span>
                  </td>
                  <td class="product-item_address">
                    <span>{{ item.address }}</span>
                  </td>
                  <td class="product-item_phone">
                    <span>{{ item.phone }}</span>
                  </td>
                  <td class="product-item_paymentMethod">
                    <span>{{ item.paymentMethod }}</span>
                  </td>
                  <td class="product-item_status">
                    <span v-if="item.status == 'pending'" class="pending"
                      >Đang duyệt</span
                    >
                    <span
                      v-else-if="item.status == 'awaiting-payment'"
                      class="awaiting-payment"
                      >Chờ thanh toán</span
                    >
                    <span
                      v-else-if="item.status == 'awaiting-pickup'"
                      class="awaiting-pickup"
                      >Đang lấy hàng</span
                    >
                    <span
                      v-else-if="item.status == 'awaiting-shipment'"
                      class="awaiting-shipment"
                      >Đang vận chuyển</span
                    >
                    <span
                      v-else-if="item.status == 'compeleted'"
                      class="compeleted"
                      >Hoàn thành</span
                    >
                    <span
                      v-else-if="item.status == 'cancelled'"
                      class="cancelled"
                      >Đã hủy</span
                    >
                    <span v-else-if="item.status == 'refunded'" class="refunded"
                      >Đã trả hàng</span
                    >
                    <span v-else>{{ item.status }}</span>
                  </td>
                  <td class="product-item_price">
                    <span style="font-weight: 600; color: orange">{{
                      formatVND(item.paymentTotal * 1000)
                    }}</span>
                  </td>
                </tr>
                <tr class="expand-row">
                  <td></td>
                  <td></td>
                  <td colspan="100%">
                    <tr
                      v-for="(orderItem, orderItemIndex) in item.orderItems"
                      :key="index"
                    >
                      <td>
                        <img
                          :src="
                            'http://localhost:3005' + orderItem.productPhoto
                          "
                          alt="product photo"
                        />
                      </td>
                      <td>{{ orderItem.productName }}</td>
                      <td>{{ formatVND(orderItem.price * 1000) }}</td>
                      <td>{{ orderItem.quantity }}</td>
                      <td>
                        {{
                          formatVND(orderItem.price * orderItem.quantity * 1000)
                        }}
                      </td>
                    </tr>
                  </td>
                </tr>
              </template>
            </tbody>
          </table>
          <div class="footing">
            <Pagination
              v-if="totalPage > 1"
              :current-page="pagination.currentPage"
              :total-page="totalPage"
              @on-change-page="(newPage) => (pagination.currentPage = newPage)"
            />
            <p>
              {{ tableInfo }}
            </p>
          </div>
        </div>
      </div>
      <div class="order empty">
        <div class="order_empty">
          <h1>Chưa có sản phẩm.</h1>
          <button class="button-continue outline">
            <router-link to="/">←&nbsp;Xem sản phẩm</router-link>
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
  import Breadcrumb from '@/components/Breadcrumb.vue';
  import { useCartStore } from '@/stores/CartStore';
  import Pagination from '@/components/Pagination.vue';
  import { reactive, computed, ref, onMounted, watch } from 'vue';
  import { useToast } from 'vue-toastification';
  import CartItem from './component/CartItem.vue';
  import { storeToRefs } from 'pinia';
  import { formatVND } from '@/util/formatNumber';
  import { useRoute, useRouter } from 'vue-router';
  import orderService from '@/service/user/order.service';
  import type { OrderPageResult } from '@/types/api/cart';
  const toast = useToast();

  const breadcrumbPath = reactive([
    {
      title: 'Trang chủ',
      linkTo: '/',
    },
  ]);
  const router = useRouter();

  onMounted(() => {
    document.title = 'Giỏ hàng';
    getOrders();
  });
  const route = useRoute();
  const searchTable = ref('');
  const orderType = computed(() => route.params.type || '');
  const totalPage = ref(1);
  const orderData = ref<OrderPageResult>();
  const tableLoading = ref(false);
  const timer = {
    waitSreachInput: setTimeout(() => '', 0),
  };
  const tableInfo = computed(() => {
    const currentPage = pagination.currentPage;
    const totalRecord = orderData.value?.meta.totalItems || 0;
    const pageSize = pagination.pageSize;
    const startRecord = pageSize * (currentPage - 1) + 1;
    const endRecord =
      pageSize * currentPage < totalRecord
        ? pageSize * currentPage
        : totalRecord;

    return (
      `Hiện  ` +
      (currentPage == 1 && endRecord >= totalRecord
        ? ''
        : `${startRecord} đến ${endRecord} của `) +
      `${totalRecord} danh mục`
    );
  });
  const pagination = reactive({
    pageSize: 10,
    currentPage: 1,
  });
  watch([orderType, pagination], () => {
    getOrders();
  });
  watch([searchTable], () => {
    console.log(searchTable.value);
    timer.waitSreachInput && clearTimeout(timer.waitSreachInput);
    timer.waitSreachInput = setTimeout(() => {
      getOrders();
    }, 500);
  });
  async function getOrders() {
    tableLoading.value = true;
    orderData.value = await orderService.getOrders({
      pageSize: pagination.pageSize,
      page: pagination.currentPage,
      query: {
        status: orderType.value as string,
        username: searchTable.value,
        orderId: searchTable.value,
        city: searchTable.value,
        address: searchTable.value,
        phone: searchTable.value,
        paymentMethod: searchTable.value,
      },
    });
    totalPage.value = orderData.value?.meta.totalPage || 0;
    tableLoading.value = false;
  }
  async function handleCopyToClipboard(e: Event, orderId: string) {
    navigator.clipboard.writeText(orderId);
    try {
      await navigator.clipboard.writeText(orderId);
      toast.success('Đã copy mã đơn ' + orderId);
    } catch (e) {}
  }
</script>

<style lang="scss" scoped>
  .container {
    background-color: #fff;
  }
  .order {
    width: 100%;
    display: flex;
    gap: 10px;
    justify-content: space-between;
    border-radius: 10px;
    flex-wrap: wrap;
    overflow: hidden;
    color: var(--text-light-2);
    a {
      color: inherit;
    }
    button {
      padding: 5px 8px;
    }
    table {
      width: 100%;
      td {
        vertical-align: middle;
      }
    }
    thead tr th {
      text-align: left;
      border-bottom: 2px solid;
      border-color: var(--orange-mute);
      font-weight: bold;
      color: var(--text-light-1);
    }
    &.empty {
      background-color: #fff;
      height: 400px;
      display: flex;
      justify-content: center;
      align-items: center;

      button {
        margin: 10px 0;
      }
    }

    .table-wrapper {
      width: 100%;
      min-width: 1000px;
      .heading {
        margin: 5px 0;
        .top {
          display: flex;
          flex-direction: row;
          justify-content: space-between;
          margin: 5px 0;

          .page-size-input {
            display: flex;
            flex-direction: row;
            align-items: center;
            gap: 5px;
          }
          .search {
            border: 1px solid #bbb;
            padding: 10px 5px;
            border-radius: 10px;
            input {
              border: 1px solid #bbb;
              border-radius: 10px;
              background-color: #eee;
              padding: 2px 10px;
            }
          }
        }
        .order-type {
          display: flex;
          flex-direction: row;
          gap: 20px;
          .order-type-item {
            a {
              color: var(--text-light-2);
              padding: 4px 10px;
              transition: 0.1s;
              &.router-link-active {
                border-radius: 2px;
                color: var(--text-light-1);
                border-bottom: 4px solid var(--orange);
              }
              &:not(.router-link-active):hover {
                background-color: #eee;
              }
            }
          }
        }
      }
      table {
        width: calc(100% - 20px);
        margin: 15px;
        overflow-x: auto;
        &:has(> .table-loading) {
          overflow: hidden;
        }
        thead {
          background-color: #eee;
          th {
            border-left: 2px;
            border-right: 2px;
            border-color: #fff;
            border-style: solid;
            text-align: center;
            white-space: nowrap;
            padding: 0 6px;
          }
        }
        tbody {
          &.table-loading {
            position: relative;
            height: 575px;
            &::before {
              content: '';
              position: absolute;
              top: 0;
              right: 0;
              bottom: 0;
              left: 0;
              z-index: 99999;
              transform: translateX(-100%);
              background-image: linear-gradient(
                90deg,
                rgba(#ccc, 0) 0,
                rgba(#ccc, 0.2) 20%,
                rgba(#ccc, 0.5) 60%,
                rgba(#ccc, 0)
              );
              animation: shimmer 2s infinite;
            }

            @keyframes shimmer {
              100% {
                transform: translateX(100%);
              }
            }
          }
          .product-item_status {
            & > * {
              white-space: nowrap;
              padding: 4px 10px;
              border-radius: 8px;
              color: #000;
              font-weight: 500;
            }
            .pending {
              background-color: #ccc;
            }
            .awaiting-payment {
              background-color: rgb(241, 237, 0);
            }
            .awaiting-pickup {
              background-color: rgb(192, 221, 255);
            }
            .awaiting-shipment {
              background-color: rgb(0, 110, 255);
            }
            .compeleted {
              background-color: rgb(61, 255, 22);
            }
            .cancelled {
              background-color: rgb(255, 81, 0);
            }
            .refunded {
              background-color: orange;
            }
          }
          tr {
            height: 50px;
            background-color: #f5f5f5;

            &.expand-row {
              background-color: #fff;
              tr {
                background-color: #fff;
                td:nth-child(2) {
                  width: 500px;
                  text-align: left;
                  padding: 0 15px;
                }
                td:nth-child(3),
                td:nth-child(5) {
                  width: 120px;
                  text-align: right;
                  padding-right: 15px;
                }
                td:nth-child(4) {
                  width: 40px;
                }
                img {
                  width: 50px;
                  height: 50px;
                  object-fit: cover;
                }
              }
            }
            &:hover {
              background-color: #eee;
              img {
                opacity: 0.8;
              }
            }
            td {
              vertical-align: middle;
              text-align: center;
              padding: 0 5px;
            }
          }
          .product-item {
            border-bottom: 1px solid #ddd;
            .action {
              width: 100px;
              &.copy-action {
                width: 60px;
              }
              &-group {
                display: flex;
                justify-content: space-evenly;
                flex-direction: row;
                button {
                  background-color: transparent;
                  padding: 5px 10px;
                  transition: all 0.2s ease;
                  &:hover {
                    background-color: #ddd;
                  }
                  &:active {
                    background-color: #ccc;
                  }
                }
                .copy-btn {
                  color: rgb(0, 140, 255);
                }
                .edit-btn {
                  color: var(--orange);
                }
                .view-btn {
                  color: rgb(0, 140, 255);
                }
                .delete-btn {
                  color: rgb(255, 72, 72);
                }
              }
            }
            &_time {
              width: 180px;
            }
            &_photo {
              width: 50px;
              img {
                width: 50px;
                height: 50px;
                object-fit: cover;
              }
            }
            &_name {
              span {
                display: block;
                max-width: 350px;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
                padding: 0 20px;
              }
            }

            &_email {
              min-width: 150px;
              // width: 10%;
              text-align: start;
              span {
                display: block;
                max-width: 350px;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
                padding: 0 20px;
              }
            }
            &_address {
              text-align: start;
            }
            &_address {
              text-align: start;
            }
            &_status {
              text-align: center;
              select {
                padding: 8px;
                text-align: center;
              }
            }
          }
        }
      }
      .footing {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        margin: 0 15px;
      }
    }
  }
  .loading-icon {
    display: none;
    position: absolute;
    top: calc(50% - 10px);
    left: calc(50% - 10px);
    z-index: 100;
    font-size: 20px;
    animation: spin 1s infinite linear;
  }
  .isLoading {
    position: relative;

    & > .loading-icon {
      display: block;
    }
    &::before {
      content: '';
      position: absolute;
      inset: 0 0 0 0;
      background-color: #000;
      opacity: 0.2;
      z-index: 99;
      cursor: wait;
    }
  }
  .isChange {
    transition: all 1s ease;
    animation: highlightChange 2s ease;
  }
  @keyframes highlightChange {
    0% {
      color: orange;
      transform: scale(1.1);
    }
    20% {
      transform: scale(1);
    }
    100% {
      color: inherit;
    }
  }
  @media (max-width: 1100px) {
    .cart-detail,
    .cart-collaterals {
      width: 100%;
    }
  }
</style>
