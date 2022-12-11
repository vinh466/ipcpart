<template>
  <div class="form">
    <form class="product-form" @submit="handleFormSubmit">
      <div class="form-group">
        <div class="text-control flex-2">
          <label for="productNameInput"
            >Tên sản phẩm:<span style="color: red">*</span>
            <span class="err-msg">{{ productNameErrorMessage }}</span></label
          >
          <input type="text" v-model="productName" id="productNameInput" />
        </div>
        <div class="text-control flex-1">
          <label for="priceInput"
            >Giá:<span style="color: red">*</span>
            <span class="err-msg">{{ priceErrorMessage }}</span></label
          >
          <input type="text" v-model="price" id="priceInput" />
        </div>
        <div class="text-control flex-1" v-if="editForm">
          <label for="inStockInput"
            >Kho:<span style="color: red">*</span>
            <span class="err-msg">{{ inStockErrorMessage }}</span></label
          >
          <input type="text" v-model="inStock" id="inStockInput" />
        </div>
      </div>
      <div class="form-group">
        <div class="select-control flex-1">
          <label for="productBrandInput"
            >NSX:<span style="color: red">*</span>
            <span class="err-msg">{{ productBrandErrorMessage }}</span></label
          >
          <select
            id="productBrandInput"
            v-model="productBrand"
            @click="(e) => e.stopPropagation()"
          >
            <option value="">Chọn</option>
            <option
              v-for="(item, index) in productOptions.brand"
              :key="index"
              :value="item"
            >
              {{ item }}
            </option>
          </select>
        </div>
        <div class="text-control flex-3">
          <label for="productPhotoInput"
            >URL ảnh:<span style="color: red">*</span>
            <span class="err-msg">{{ productPhotoErrorMessage }}</span></label
          >
          <input type="text" v-model="productPhoto" id="productPhotoInput" />
        </div>
      </div>

      <div class="form-group">
        <div class="text-control flex-1">
          <label for="screenSizeInput"
            >ScreenSize:
            <span class="err-msg">{{ screenSizeErrorMessage }}</span></label
          >
          <input type="text" v-model="screenSize" id="screenSizeInput" />
        </div>

        <div class="select-control flex-1">
          <label for="resolutionInput"
            >Resolution:<span style="color: red">*</span>
            <span class="err-msg">{{ resolutionErrorMessage }}</span></label
          >
          <select
            id="resolutionInput"
            v-model="resolution"
            @click="(e) => e.stopPropagation()"
          >
            <option value="">Chọn</option>
            <option
              v-for="(item, index) in [
                '3840 x 2160',
                '2560 x 1440',
                '7680 x 4320',
                '1920 x 1080',
                '3440 x 1440',
                '1366 x 768',
                '5120 x 1440',
                '1600 x 900',
                '2560 x 1080',
                '1280 x 1024',
              ]"
              :key="index"
              :value="item"
            >
              {{ item }}
            </option>
          </select>
        </div>

        <div class="select-control flex-1">
          <label for="refreshRateInput"
            >RefreshRate:<span style="color: red">*</span>
            <span class="err-msg">{{ refreshRateErrorMessage }}</span></label
          >
          <select
            id="refreshRateInput"
            v-model="refreshRate"
            @click="(e) => e.stopPropagation()"
          >
            <option value="">Chọn</option>
            <option
              v-for="(item, index) in [
                '240 Hz',
                '165 Hz',
                '60 Hz',
                '75 Hz',
                '144 Hz',
                '280 Hz',
                '170 Hz',
                '180 Hz',
                '360 Hz',
                'none',
                '155 Hz',
                '200 Hz',
                '270 Hz',
                '120 Hz',
                '160 Hz',
                '175 Hz',
              ]"
              :key="index"
              :value="item"
            >
              {{ item }}
            </option>
          </select>
        </div>

        <div class="select-control flex-1">
          <label for="responseTimeInput"
            >ResponseTime:<span style="color: red">*</span>
            <span class="err-msg">{{ responseTimeErrorMessage }}</span></label
          >
          <select
            id="responseTimeInput"
            v-model="responseTime"
            @click="(e) => e.stopPropagation()"
          >
            <option value="">Chọn</option>
            <option
              v-for="(item, index) in [
                '1 ms',
                '6 ms',
                '4 ms',
                '5 ms',
                'none',
                '0.5 ms',
                '2 ms',
                '3 ms',
                '0.1 ms',
                '0.4 ms',
              ]"
              :key="index"
              :value="item"
            >
              {{ item }}
            </option>
          </select>
        </div>

        <div class="select-control flex-1">
          <label for="panelTypeInput"
            >PanelType:<span style="color: red">*</span>
            <span class="err-msg">{{ panelTypeErrorMessage }}</span></label
          >
          <select
            id="panelTypeInput"
            v-model="panelType"
            @click="(e) => e.stopPropagation()"
          >
            <option value="">Chọn</option>
            <option
              v-for="(item, index) in [
                'VA',
                'IPS',
                'OLED',
                'TN',
                'none',
                'QD-OLED',
              ]"
              :key="index"
              :value="item"
            >
              {{ item }}
            </option>
          </select>
        </div>

        <div class="select-control flex-1">
          <label for="ratioInput"
            >Ratio:<span style="color: red">*</span>
            <span class="err-msg">{{ ratioErrorMessage }}</span></label
          >
          <select
            id="ratioInput"
            v-model="ratio"
            @click="(e) => e.stopPropagation()"
          >
            <option value="">Chọn</option>
            <option
              v-for="(item, index) in ['16:9', '21:9', '32:9', '5:4']"
              :key="index"
              :value="item"
            >
              {{ item }}
            </option>
          </select>
        </div>
      </div>
      <button type="submit" hidden ref="submitBtnRef"></button>
    </form>
    <div class="footing">
      <div class="btn-control">
        <button @click="emit('onEscape')">Hủy</button>
        <button @click="submitBtnRef?.click()">
          {{ editForm ? 'Cập nhập' : 'Thêm' }}
        </button>
      </div>
    </div>
  </div>
</template>
<!-- { 
    "screenSize": "32.0",
    "resolution": "3840 x 2160",
    "refreshRate": "240 Hz",
    "responseTime": "1 ms",
    "panelType": "VA",
    "ratio": "16:9", 
} -->
<script setup lang="ts">
  import cpuService from '@/service/user/products/cpu.service';
  import { useField, useForm } from 'vee-validate';
  import type { ComponentPublicInstance } from 'vue';
  import { useToast } from 'vue-toastification';
  import { ref, watch, reactive, onMounted } from 'vue';
  import * as yup from 'yup';
  import {
    mainboardService,
    monitorService,
    ramService,
    videoCardService,
  } from '@/service/user/products';
  import type { Product } from '@/types/api/products';
  const toast = useToast();
  const submitBtnRef = ref<ComponentPublicInstance<HTMLButtonElement>>();
  const emit = defineEmits<{
    (event: 'onEscape'): void;
    (event: 'onCancel'): void;
  }>();
  const props = withDefaults(
    defineProps<{
      product?: Product;
      editForm: boolean;
    }>(),
    { editForm: false }
  );
  const productOptions = reactive<{
    brand: Array<string>;
  }>({
    brand: [],
  });
  const formValues = {
    productName: props.product?.productName || '',
    productPhoto:
      props.product?.productPhoto || '/images/products/no-image.png',
    productBrand: props.product?.productBrand || '',
    price: props.product?.price || 0,
    inStock: props.product?.inStock || 0,
    processor: '',
    socket: '',
    chipset: '',
    ramStandard: '',
    form: '',
    color: '',
    ramCap: 0,
    ramSlot: 0,
    standard: '',
    chipsetName: '',
  };
  const {
    handleSubmit,
    setFieldValue,
    setValues,
    resetForm,
    controlledValues,
    errors,
    isSubmitting,
  } = useForm({
    initialValues: formValues,
  });
  const { value: productName, errorMessage: productNameErrorMessage } =
    useField('productName', yup.string().required('Bắt buộc'));
  const { value: productPhoto, errorMessage: productPhotoErrorMessage } =
    useField('productPhoto', yup.string().required('Bắt buộc'));
  const { value: productBrand, errorMessage: productBrandErrorMessage } =
    useField('productBrand', yup.string().required('Bắt buộc'));
  const { value: price, errorMessage: priceErrorMessage } = useField(
    'price',
    yup.string().required('Bắt buộc')
  );
  const { value: inStock, errorMessage: inStockErrorMessage } = useField(
    'inStock',
    yup.string().required('Bắt buộc').min(0)
  );
  const { value: screenSize, errorMessage: screenSizeErrorMessage } = useField(
    'screenSize'
    // yup.string().required('Bắt buộc')
  );
  const { value: resolution, errorMessage: resolutionErrorMessage } = useField(
    'resolution'
    // yup.string().required('Bắt buộc')
  );
  const { value: refreshRate, errorMessage: refreshRateErrorMessage } =
    useField(
      'refreshRate'
      // yup.string().required('Bắt buộc')
    );
  const { value: responseTime, errorMessage: responseTimeErrorMessage } =
    useField(
      'responseTime'
      // yup.string().required('Bắt buộc')
    );
  const { value: panelType, errorMessage: panelTypeErrorMessage } = useField(
    'panelType'
    // yup.string().required('Bắt buộc')
  );
  const { value: ratio, errorMessage: ratioErrorMessage } = useField(
    'ratio'
    // yup.string().required('Bắt buộc')
  );

  onMounted(() => {
    fetchOption();
    if (props.editForm) {
      fetchProductDetail();
    }
  });
  async function fetchProductDetail() {
    if (props.product?.productId)
      try {
        let getProduct = null;
        getProduct = await monitorService.getProduct({
          query: {
            productId: props.product.productId as string,
          },
        });
        if (getProduct) {
          setValues(getProduct.data[0]);
        }
      } catch (error) {
        console.log(error);
      }
  }
  const handleFormSubmit = handleSubmit(async (values) => {
    console.log(JSON.stringify(values, null, 2));
    try {
      const success = false; //await cpuService.create(values);
      if (success) {
        toast.success('Đã thêm');
        emit('onEscape');
      } else toast.info('Không thể thêm');
    } catch (error) {
      toast.info('Xảy ra lỗi');
    }
  });
  async function fetchOption() {
    const res = await videoCardService.getOptions({
      query: {
        brand: productBrand.value,
      },
    });
    console.log(res);
    if (res) {
      productOptions.brand = res.options.brand;
    }
  }
</script>
<style lang="scss">
  .err-msg {
    color: red;
  }
  label {
    white-space: nowrap;
  }
  .form {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
  }
  .product-form {
    .form-group {
      display: flex;
      flex-wrap: wrap;
      width: 100%;
      gap: 20px;
      margin: 10px 0 20px;

      .flex-1 {
        flex: 1;
      }

      .flex-2 {
        flex: 2;
      }

      .flex-3 {
        flex: 3;
      }
    }
    .select-control {
      display: flex;
      flex-direction: column;
      label {
        margin-right: 5px;
        font-size: 0.9rem;
      }
      select {
        border: 1px solid #ccc;
        border-radius: 5px;
        background-color: #f5f5f5;
        padding: 5px 10px;
      }
    }
    .text-control {
      display: flex;
      flex-direction: column;

      label {
        font-size: 0.9rem;
      }

      .err-msg {
        color: red;
      }

      input {
        border: 1px solid #ccc;
        border-radius: 5px;
        background-color: #f5f5f5;
        padding: 5px 10px;
      }
    }
    .number-control {
      display: flex;
      flex-direction: column;

      label {
        font-size: 0.9rem;
        margin-right: 5px;
      }

      .err-msg {
        color: red;
      }

      input {
        border: 1px solid #ccc;
        border-radius: 5px;
        background-color: #f5f5f5;
        padding: 5px 10px;
      }
    }
  }

  .footing {
    .btn-control {
      text-align: end;

      button {
        margin-left: 10px;
        padding: 5px 10px;
      }
    }
  }
</style>
