<template>
  <div class="user-datatable" v-if="!unauthorized">
    <div class="function-button">
      <button class="add" @click="handleAddUser">
        <font-awesome-icon icon="fa-solid fa-plus" />
      </button>
      <!-- <button>download</button>
      <button>print</button>
      <button>copy</button>
      <button>Excel Export</button>
      <button>PDF Export</button> -->
    </div>
    <div class="table-wrapper">
      <div class="heading">
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
      <table>
        <thead>
          <tr>
            <th>Ảnh</th>
            <th>Username</th>
            <th>Email</th>
            <th>Tên KH</th>
            <th>Họ KH</th>
            <th>Địa chỉ</th>
            <th>Thành phố</th>
            <th>Sđt</th>
            <th></th>
          </tr>
        </thead>
        <tbody :class="{ 'table-loading': tableLoading }">
          <tr
            v-for="(item, index) in userData?.data"
            :key="index"
            class="product-item"
          >
            <td class="product-item_avatar" style="text-align: center">
              <Avatar
                :initial="
                  item.name.charAt(0).toUpperCase() ||
                  item.username.charAt(0).toUpperCase() ||
                  'A'
                "
                :img-url="item.avatar"
                :height="40"
                :width="40"
                style="border: 1px solid #ccc; margin: auto"
              />
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
            <td class="product-item_lastname">
              <span>{{ item.lastname }}</span>
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
            <td class="action">
              <div class="action-group">
                <button class="edit-btn" @click="(e) => handleEdit(e, item)">
                  <font-awesome-icon icon="fa-solid fa-pen-to-square" />
                </button>
                <button
                  class="delete-btn"
                  @click="(e) => handleConfirmDelete(e, item.username)"
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
  </div>
  <div v-else class="unauthorized">
    Bạn không được phép truy cập vào tài nguyên này !
  </div>
  <div
    class="popup"
    :class="{ active: activePopup }"
    @click="(e) => (activePopup = false)"
  >
    <div class="popup-content">
      <ConfirmDialog
        v-if="confirmDelete"
        :title="'Xóa sản phẩm'"
        :msg="'Bạn chắc chắn muốn xóa'"
        @onConfirm="
          handleDelete(confirmDelete);
          confirmDelete = '';
        "
        @onCancel="
          () => {
            activePopup = false;
            confirmDelete = '';
          }
        "
      />
      <UserAddPopup
        v-if="addPopupView"
        @onEscape="() => (activePopup = false)"
      />
      <UserEditPopup
        v-if="editPopupView"
        :user-data="editPopupView"
        :key="editPopupView.username"
        @onEscape="() => (activePopup = false)"
      />
    </div>
  </div>
</template>
<script setup lang="ts">
  import Avatar from '@/components/Avatar.vue';
  import UserAddPopup from './component/UserAddPopup.vue';
  import UserEditPopup from './component/UserEditPopup.vue';
  import ConfirmDialog from '@/components/ConfirmDialog.vue';
  import Pagination from '@/components/Pagination.vue';
  import adminStaffService from '@/service/admin/staff.service';
  import adminUserService from '@/service/admin/user.service';
  import type {
    UserFormData,
    UserItem,
    UserPageResult,
  } from '@/types/api/system/user';
  import axios from 'axios';
  import { reactive, computed, ref, watch, onMounted } from 'vue';
  import { useToast } from 'vue-toastification';

  const userData = ref<UserPageResult>();
  const activePopup = ref(false);
  const addPopupView = ref(false);
  const editPopupView = ref<UserFormData>();
  const totalPage = ref(1);
  const searchTable = ref('');
  const unauthorized = ref(false);
  const tableLoading = ref(false);
  const confirmDelete = ref<string>('');

  const timer = {
    waitSreachInput: setTimeout(() => '', 0),
  };
  const pagination = reactive({
    pageSize: 10,
    currentPage: 1,
  });
  const tableInfo = computed(() => {
    const currentPage = pagination.currentPage;
    const totalRecord = userData.value?.meta.totalItems || 0;
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
    document.title = 'Admin - Khách hàng';
    await getUsers();
  });
  watch([searchTable], () => {
    timer.waitSreachInput && clearTimeout(timer.waitSreachInput);
    timer.waitSreachInput = setTimeout(() => {
      getUsers();
    }, 500);
  });
  watch([activePopup], () => {
    if (activePopup.value == false) {
      addPopupView.value = false;
      confirmDelete.value = '';
      editPopupView.value = undefined;
      getUsers();
    }
  });
  watch([pagination], () => {
    getUsers();
  });
  function handleAddUser() {
    addPopupView.value = true;
    activePopup.value = true;
  }
  function handleEdit(e: Event, user: UserItem) {
    e.stopPropagation();
    editPopupView.value = user;
    activePopup.value = true;
  }
  async function handleDelete(username: string) {
    try {
      const OK = await adminStaffService.remove(username);
      if (OK) {
        toast.success('Đã xóa ' + username);
      } else {
        toast('Không thể xóa ' + username);
      }
    } catch (error) {
      toast.error('Không thể xóaa ' + username);
    }
    confirmDelete.value = '';
    activePopup.value = false;
    getUsers();
  }

  async function handleConfirmDelete(e: Event, id: string) {
    e.stopPropagation();
    confirmDelete.value = id;
    activePopup.value = true;
  }
  async function getUsers() {
    tableLoading.value = true;
    try {
      userData.value = await adminUserService.getUsers({
        pageSize: pagination.pageSize,
        page: pagination.currentPage,
        query: {
          roles: 'user',
          username: searchTable.value,
          email: searchTable.value,
          name: searchTable.value,
          lastname: searchTable.value,
          address: searchTable.value,
          city: searchTable.value,
          phone: searchTable.value,
        },
      });
      totalPage.value = userData.value?.meta.totalPage || 0;
    } catch (error) {
      if (axios.isAxiosError(error) && error.response?.status == 403) {
        unauthorized.value = true;
      } else {
        unauthorized.value = false;
      }
    }
    tableLoading.value = false;
  }
</script>
<style lang="scss">
  .unauthorized {
    color: red;
    font-size: 1.1rem;
    font-weight: bold;
  }
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
  .user-datatable {
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
              transition: all 0.2s ease;
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
