<template>
  <div class="order-datatable">
    <div class="table-wrapper">
      <div class="heading">
        <div class="top">
          <div class="page-size-input">
            Hiện
            <select name="pageSize" id="pageSize" v-model="pagination.pageSize">
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
            <router-link to="/admin/order/">Tất cả</router-link>
          </li>
          <li class="order-type-item">
            <router-link to="/admin/order/pending">Đang duyệt</router-link>
          </li>
          <li class="order-type-item">
            <router-link to="/admin/order/awaiting-payment"
              >Chờ thanh toán</router-link
            >
          </li>
          <li class="order-type-item">
            <router-link to="/admin/order/awaiting-pickup"
              >Đang lấy hàng</router-link
            >
          </li>
          <li class="order-type-item">
            <router-link to="/admin/order/awaiting-shipment"
              >Đang vận chuyển</router-link
            >
          </li>
          <li class="order-type-item">
            <router-link to="/admin/order/compeleted">Hoàn thành</router-link>
          </li>
          <li class="order-type-item">
            <router-link to="/admin/order/cancelled">Đã hủy</router-link>
          </li>
          <li class="order-type-item">
            <router-link to="/admin/order/refunded">Đã trả hàng</router-link>
          </li>
        </ul>
      </div>
      <table>
        <thead>
          <tr>
            <th>Mã đơn</th>
            <th>Username</th>
            <th>Email</th>
            <th>Tên KH</th>
            <th>Thời gian</th>
            <th>Địa chỉ</th>
            <th>Thành phố</th>
            <th>Sđt</th>
            <th>Phương thức</th>
            <th>Trạng thái</th>
            <th>Tổng Thanh toán</th>
            <th></th>
          </tr>
        </thead>
        <tbody :class="{ 'table-loading': tableLoading }">
          <tr
            v-for="(item, index) in orderData?.data"
            :key="index"
            class="product-item"
          >
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
            <td class="product-item_username">
              <span>{{ item.username }}</span>
            </td>
            <td class="product-item_email">
              <span>{{ item.email }}</span>
            </td>
            <td class="product-item_name">
              <span>{{ item.name }}</span>
            </td>
            <td class="product-item_address">
              <span>{{
                item.createdAt && new Date(item.createdAt).toLocaleString()
              }}</span>
            </td>
            <td class="product-item_address">
              <span>{{ item.address }}</span>
            </td>
            <td class="product-item_city">
              <span>{{ item.city }}</span>
            </td>
            <td class="product-item_phone">
              <span>{{ item.phone }}</span>
            </td>
            <td class="product-item_paymentMethod">
              <span>{{ item.paymentMethod }}</span>
            </td>
            <td class="product-item_status">
              <select
                :name="`order-status${index}`"
                id="order-status${index}"
                :value="item.status"
                @change="(e) => handleChangeStatus(e, item.orderId)"
                @click="(e) => e.stopPropagation()"
              >
                <option value="pending">Đang duyệt</option>
                <option value="awaiting-payment">Chờ thanh toán</option>
                <option value="awaiting-pickup">Đang lấy hàng</option>
                <option value="awaiting-shipment">Đang vận chuyển</option>
                <option value="compeleted">Hoàn thành</option>
                <option value="cancelled">Đã hủy</option>
                <option value="refunded">Đã trả hàng</option>
              </select>
            </td>
            <td class="product-item_price">
              <span>{{ formatVND(item.paymentTotal * 1000) }}</span>
            </td>
            <td class="action">
              <div class="action-group">
                <!-- <button
                  class="edit-btn"
                  @click="(e) => handleEdit(e, item.orderId)"
                >
                  <font-awesome-icon icon="fa-solid fa-pen-to-square" />
                </button> -->
                <button
                  class="view-btn"
                  @click="(e) => handleViewDetail(e, item)"
                >
                  <font-awesome-icon icon="fa-solid fa-eye" />
                </button>
              </div>
            </td>
          </tr>
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
  <div
    class="popup"
    :class="{ active: activePopup }"
    @click="(e) => (activePopup = false)"
  >
    <div class="popup-content">
      <OrderPopupView
        v-if="orderView"
        :orderItem="orderView"
        @click="(e) => e.stopPropagation()"
        :key="orderView.orderId"
        @escape="(e) => (activePopup = false)"
      />
    </div>
  </div>
</template>
<script setup lang="ts">
  import { product, order } from '@/components/datatemplate';
  import Pagination from '@/components/Pagination.vue';
  import orderAdminService from '@/service/admin/order.service';
  import OrderPopupView from './component/OrderPopupView.vue';
  import type { Order, OrderPageResult } from '@/types/api/products/order';
  import { formatVND } from '@/util/formatNumber';
  import {
    defineProps,
    ref,
    watch,
    computed,
    onMounted,
    reactive,
    onUnmounted,
  } from 'vue';
  import { useRoute } from 'vue-router';
  import { useToast } from 'vue-toastification';
  // const props = defineProps<{
  //   // data: Product[];
  // }>();
  const route = useRoute();
  const orderData = ref<OrderPageResult>();
  const orderView = ref<Order>();
  const activePopup = ref(false);
  const searchTable = ref('');
  const orderType = computed(() => route.params.type || '');
  const tableLoading = ref(false);

  const statusTrans = {
    pending: 'Đang duyệt',
    'awaiting-payment': 'Chờ thanh toán',
    'awaiting-pickup': 'Đang lấy hàng',
    'awaiting-shipment': 'Đang vận chuyển',
    compeleted: 'Hoàn thành',
    cancelled: 'Đã hủy',
    refunded: 'Đã trả hàng',
  };
  const timer = {
    waitSreachInput: setTimeout(() => '', 0),
  };
  const pagination = reactive({
    pageSize: 10,
    currentPage: 1,
  });
  const totalPage = ref(1);
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
  const toast = useToast();

  onMounted(async () => {
    document.title = 'Admin - Đơn hàng';
    window.addEventListener('keyup', handleEscKeyboard);
    await getOrders();
  });
  onUnmounted(() => {
    window.removeEventListener('keyup', handleEscKeyboard);
  });
  watch([searchTable], () => {
    timer.waitSreachInput && clearTimeout(timer.waitSreachInput);
    timer.waitSreachInput = setTimeout(() => {
      getOrders();
    }, 500);
  });
  watch([orderType, pagination], () => {
    getOrders();
  });
  watch([activePopup], () => {
    if (activePopup.value == false) {
      orderView.value = undefined;
    }
  });
  function handleEscKeyboard(e: KeyboardEvent) {
    if (e.key == 'Escape') activePopup.value = false;
  }
  async function handleChangeStatus(e: Event, orderId: string) {
    const newStatus = (e.target as HTMLInputElement)?.value;
    console.log(orderId);
    if (newStatus) {
      try {
        console.log('before update');
        await orderAdminService.update({
          orderId,
          status: newStatus,
        });
        console.log('refresh after update');
        toast.success(
          `Đã cập nhập đơn ${
            'thành ' + statusTrans[newStatus as keyof typeof statusTrans] || ''
          } !!!`
        );
        await getOrders();
      } catch (error) {
        console.log(error);
        toast.error('Không thể cập nhập !!!');
      }
    }
    // navigator.clipboard.writeText();
  }
  async function handleCopyToClipboard(e: Event, orderId: string) {
    navigator.clipboard.writeText(orderId);
    try {
      await navigator.clipboard.writeText(orderId);
      toast.success('Đã copy mã đơn ' + orderId);
    } catch (e) {}
  }
  function handleEdit(e: Event, id: string) {
    e.stopPropagation();
    toast('Edit ' + id);
  }
  async function getOrders() {
    tableLoading.value = true;
    orderData.value = await orderAdminService.getOrders({
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
  function handleViewDetail(e: Event, item: Order) {
    e.stopPropagation();
    orderView.value = item;
    activePopup.value = true;
  }
</script>
<style lang="scss">
  .popup {
    position: fixed;
    display: none;
    inset: 0;
    margin-left: 250px;
    z-index: 999;
    opacity: 0;

    &.active {
      display: block;
      opacity: 1;
      background-color: rgba(0, 0, 0, 0.4);
      transition: all 0.3s ease;
    }
    .popup-content {
      width: 100%;
      height: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
    }
  }
  .order-datatable {
    background-color: #fff;
    padding: 10px;
    color: var(--text-light-1);
    border-radius: 5px;
    overflow-x: auto;
    .function-button {
      margin: 5px 0;
      & > * {
        margin-right: 5px;
        padding: 5px 10px;
        &:hover {
          opacity: 0.8;
        }
      }
      .add {
        background-color: rgb(0, 194, 0);
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
          tr {
            height: 50px;
            &:hover {
              background-color: #eee;
              img {
                opacity: 0.8;
              }
            }
            td {
              vertical-align: middle;
              text-align: center;
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
</style>
