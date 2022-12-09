<template>
  <div class="order-popup-view">
    <div class="heading">
      <h1>Đơn hàng</h1>
      <div class="control-btn">
        <button class="escape-btn" @click="emit('escape')">
          <font-awesome-icon icon="fa-solid fa-xmark" />
        </button>
      </div>
    </div>
    <hr />
    <div class="order-content">
      <div class="info-table">
        <table>
          <tbody>
            <tr>
              <td class="title"><span>Mã đơn:</span></td>
              <td>
                <span>{{ orderItem.orderId }}</span>
              </td>
            </tr>
            <tr>
              <td class="title"><span>Username:</span></td>
              <td>
                <span>{{ orderItem.username }}</span>
              </td>
            </tr>
            <tr>
              <td class="title"><span>Email:</span></td>
              <td>
                <span>{{ orderItem.email }}</span>
              </td>
            </tr>
            <tr>
              <td class="title"><span>Tên:</span></td>
              <td>
                <span>{{ orderItem.name }}</span>
              </td>
            </tr>
            <tr>
              <td class="title"><span>Họ:</span></td>
              <td>
                <span>{{ orderItem.lastname }}</span>
              </td>
            </tr>
            <tr>
              <td class="title"><span>Phương thức:</span></td>
              <td>
                <span>{{ orderItem.paymentMethod }}</span>
              </td>
            </tr>
            <tr>
              <td class="title"><span>Tổng thành toán:</span></td>
              <td>
                <span>{{ orderItem.paymentTotal }}</span>
              </td>
            </tr>
            <tr>
              <td class="title"><span>Thành phố:</span></td>
              <td>
                <span>{{ orderItem.city }}</span>
              </td>
            </tr>
            <tr>
              <td class="title"><span>Trạng thái:</span></td>
              <td>
                <span>{{ orderItem.status }}</span>
              </td>
            </tr>
            <tr>
              <td class="title"><span>Địa chỉ:</span></td>
              <td>
                <span>{{ orderItem.address }}</span>
              </td>
            </tr>
            <tr>
              <td class="title"><span>Điện thoại:</span></td>
              <td>
                <span>{{ orderItem.phone }}</span>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="orderItem-list">
        <table>
          <thead>
            <tr>
              <th>Ảnh</th>
              <th>Tên Sp</th>
              <th>Kho</th>
              <th>Giá</th>
              <th>SL</th>
              <th>Tổng</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(item, index) in productList" :key="index">
              <td><img :src="item.productPhoto" :alt="'img' + index" /></td>
              <td>{{ item.productName }}</td>
              <td>{{ item.inStock }}</td>
              <td v-if="orderItems">
                {{ formatVND(orderItems[index].price * 1000) }}
              </td>
              <td v-else></td>
              <td v-if="orderItems">
                {{ orderItems[index].quantity }}
              </td>
              <td v-else></td>
              <td>{{ formatVND(item.price * 1000) }}</td>
            </tr>
          </tbody>
          <tfoot>
            <tr>
              <td colspan="4"></td>
              <td>Tổng</td>
              <td>{{ formatVND(totalPrice * 1000) }}</td>
            </tr>
          </tfoot>
        </table>
      </div>
    </div>
  </div>
</template>
<script setup lang="ts">
  import { product } from '@/components/datatemplate';
  import adminProductService from '@/service/admin/product/product.service';
  import type { Product } from '@/types/api/products';
  import type { Order } from '@/types/api/products/order';
  import { formatVND } from '@/util/formatNumber';
  import { onMounted, ref, computed, defineEmits } from 'vue';
  import type { TypeOf } from 'yup';

  const props = defineProps<{
    orderItem: Order;
  }>();
  const emit = defineEmits(['escape', 'click']);
  const productList = ref<Product[]>();
  const orderItems = props.orderItem.orderItems;
  const totalPrice = computed(() => {
    if (orderItems)
      return orderItems.reduce((total, curr) => {
        return total + curr.price * curr.quantity;
      }, 0);
    else return 0;
  });
  console.log(props.orderItem);
  onMounted(async () => {
    if (props.orderItem.orderItems) {
      const result = await adminProductService.getProducts({
        pageSize: 1000,
        query: {
          productId: props.orderItem.orderItems?.map((v) => v.productId),
        },
      });
      console.log(result);
      productList.value = result.data;
    }
  });
</script>
<style lang="scss">
  .order-popup-view {
    min-width: 900px;
    min-height: 600px;
    background-color: #fff;
    border-radius: 5px;
    padding: 10px;
    color: var(--text-light-2);

    .heading {
      font-size: 1.4rem;
      font-weight: bold;
      display: flex;
      flex-direction: row;
      justify-content: space-between;

      .control-btn {
        height: 20px;
        display: flex;
        button {
          color: #aaaaaa;
          padding: 2px 8px;
          font-size: 1rem;
          background-color: transparent;
          &:hover {
            background-color: #eee;
          }
        }
      }
    }

    .order-content {
      display: flex;
      flex-direction: row;
      justify-content: space-between;

      .info-table {
        flex: 1;
        color: #000;
        td {
          vertical-align: middle;
        }
        .title {
          vertical-align: middle;
          text-align: end;
          font-weight: 500;
          font-size: 1rem;
          padding: 0 10px;
        }
      }

      .orderItem-list {
        flex: 1;
        max-height: 600px;
        overflow-y: auto;
        thead {
          background-color: #eee;
        }
        tbody {
          tr {
            img {
              width: 50px;
            }
            td {
              vertical-align: middle;
              padding: 0 5px;
            }
          }
        }
        tfoot {
          td {
            font-weight: bold;
            vertical-align: middle;
            padding: 0 5px;
          }
        }
      }
    }
  }
</style>
