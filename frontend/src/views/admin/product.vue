<template>
  <div class="product-datatable">
    <div class="function-button">
      <button class="add" @click="handleAddProduct">
        <font-awesome-icon icon="fa-solid fa-plus" />
      </button>
    </div>
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
        <ul class="navbar product-type">
          <li class="product-type-item active">
            <router-link to="/admin/product/">Tất cả</router-link>
          </li>
          <li class="product-type-item active">
            <router-link to="/admin/product/cpu">CPU</router-link>
          </li>
          <li class="product-type-item">
            <router-link to="/admin/product/mainboard">Mainboard</router-link>
          </li>
          <li class="product-type-item">
            <router-link to="/admin/product/monitor">Màn hình</router-link>
          </li>
          <li class="product-type-item">
            <router-link to="/admin/product/mouse">Chuột</router-link>
          </li>
          <li class="product-type-item">
            <router-link to="/admin/product/ram">Bộ nhớ</router-link>
          </li>
          <li class="product-type-item">
            <router-link to="/admin/product/storage-drive">Lưu trữ</router-link>
          </li>
          <li class="product-type-item">
            <router-link to="/admin/product/video-card"
              >Card màn hình</router-link
            >
          </li>
        </ul>
      </div>
      <table>
        <thead>
          <tr>
            <th>Ảnh</th>
            <th>Tên</th>
            <th>Hãng</th>
            <th>Loại</th>
            <th>Kho</th>
            <th>Giá</th>
            <th></th>
          </tr>
        </thead>
        <tbody :class="{ 'table-loading': tableLoading }">
          <tr
            v-for="(item, index) in productData?.data"
            :key="index"
            class="product-item"
          >
            <td class="product-item_photo">
              <img :src="item.productPhoto" alt="" />
            </td>
            <td class="product-item_name">
              <span>{{ item.productName }}</span>
            </td>
            <td class="product-item_brand">
              <span>{{ item.productBrand }}</span>
            </td>
            <td class="product-item_type">
              <span>{{ item.productType }}</span>
            </td>
            <td class="product-item_stock">
              <span>{{ item.inStock }}</span>
            </td>
            <td class="product-item_price">
              <span>{{ formatVND(item.price * 1000) }}</span>
            </td>
            <td class="action">
              <div class="action-group">
                <button class="edit-btn" @click="(e) => handleEdit(e, item)">
                  <font-awesome-icon icon="fa-solid fa-pen-to-square" />
                </button>
                <button
                  class="delete-btn"
                  @click="(e) => handleConfirmDelete(e, item.productId)"
                >
                  <font-awesome-icon icon="fa-solid fa-trash" />
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
    <div
      class="popup"
      :class="{ active: activePopup }"
      @click="(e) => (activePopup = false)"
    >
      <div class="popup-content">
        <EditProductPopup
          v-if="productEdit"
          :productItem="productEdit"
          @click="(e) => e.stopPropagation()"
          :key="productEdit.productId"
          @escape="hadnlEscapePopup"
        />
        <AddProductPopup
          v-if="addProductView"
          @click="(e) => e.stopPropagation()"
          @escape="hadnlEscapePopup"
        />
        <!-- @escape="(e) => (activePopup = false)" -->
        <ConfirmDialog
          v-if="confirmDelete"
          :title="'Xóa sản phẩm'"
          :msg="'Bạn chắc chắn muốn xóa'"
          @onConfirm="
            () => {
              handleDelete(confirmDelete);
            }
          "
          @onCancel="hadnlEscapePopup"
        />
      </div>
    </div>
  </div>
</template>
<script setup lang="ts">
  import Pagination from '@/components/Pagination.vue';
  import ConfirmDialog from '@/components/ConfirmDialog.vue';
  import adminProductService from '@/service/admin/product/product.service';
  import type { Product, ProductPageResult } from '@/types/api/products';
  import { formatVND } from '@/util/formatNumber';
  import { defineProps, ref, watch, onMounted, computed, reactive } from 'vue';
  import { useRoute } from 'vue-router';
  import { useToast } from 'vue-toastification';
  import EditProductPopup from './component/EditProductPopup.vue';
  import AddProductPopup from './component/AddProductPopup.vue';
  import axios from 'axios';
  import productService from '@/service/user/products/product.service';
  // const props = defineProps<{
  //   // data: Product[];
  // }>();
  const route = useRoute();
  const productData = ref<ProductPageResult>();
  const activePopup = ref(false);
  const tableLoading = ref(false);
  const searchTable = ref('');
  const productEdit = ref<Product>();
  const addProductView = ref<boolean>(false);
  const productType = computed(() => route.params.type || '');
  const confirmDelete = ref<string>('');

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
    const totalRecord = productData.value?.meta.totalItems || 0;
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
    document.title = 'Admin - Sản phẩm';
    await getProduct();
  });
  watch([searchTable], () => {
    timer.waitSreachInput && clearTimeout(timer.waitSreachInput);
    timer.waitSreachInput = setTimeout(() => {
      getProduct();
    }, 500);
  });
  watch([productType, pagination], () => {
    getProduct();
  });
  watch([productType], () => {
    pagination.currentPage = 1;
    getProduct();
  });
  watch([activePopup], () => {
    if (activePopup.value == false) {
      productEdit.value = undefined;
      confirmDelete.value = '';
      addProductView.value = false;
    }
  });
  async function getProduct() {
    tableLoading.value = true;
    try {
      productData.value = await productService.searchProducts({
        pageSize: pagination.pageSize,
        page: pagination.currentPage,
        query: {
          productId: searchTable.value,
          productType: productType.value as string,
          productName: searchTable.value,
          productBrand: searchTable.value,
        },
      });
      totalPage.value = productData.value?.meta.totalPage || 0;
    } catch (error) {
      console.log(error);
    }
    tableLoading.value = false;
  }
  function handleAddProduct() {
    addProductView.value = true;
    activePopup.value = true;
    console.log('object');
  }
  function handleEdit(e: Event, product: Product) {
    e.stopPropagation();
    console.log(product);
    productEdit.value = product;
    activePopup.value = true;
    getProduct();
  }
  async function handleDelete(id: string) {
    try {
      console.log(id);
      const status = await adminProductService.removeProduct(id);
      console.log(status);
      if (status == 200) {
        toast.success('Đã xóa ' + id);
      }
    } catch (error) {
      console.log(error);
      if (axios.isAxiosError(error)) {
        if (error.response?.status == 403) {
          toast('Không đủ quyền !');
        }
      } else toast.error('Không thể xóa ' + id);
    }
    confirmDelete.value = '';
    activePopup.value = false;
    getProduct();
  }
  async function handleConfirmDelete(e: Event, id: string) {
    e.stopPropagation();
    confirmDelete.value = id;
    activePopup.value = true;
  }
  function hadnlEscapePopup() {
    activePopup.value = false;
    getProduct();
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
  .product-datatable {
    background-color: #fff;
    padding: 10px;
    color: var(--text-light-1);
    border-radius: 5px;
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
        .product-type {
          display: flex;
          flex-direction: row;
          gap: 20px;
          .product-type-item {
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
                .edit-btn {
                  color: var(--orange);
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
              min-width: 350px;
              width: 40%;
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
            &_brand {
              min-width: 90px;
              text-align: center;
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
