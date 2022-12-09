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
        <div class="select-control flex-1">
          <label for="processorInput"
            >Bộ xử lý:<span style="color: red">*</span>
            <span class="err-msg">{{ processorErrorMessage }}</span></label
          >
          <select
            id="processorInput"
            v-model="processor"
            @click="(e) => e.stopPropagation()"
          >
            <option value="">Chọn</option>
            <option
              v-for="(item, index) in productOptions.processor"
              :key="index"
              :value="item"
            >
              {{ item }}
            </option>
          </select>
        </div>

        <div class="select-control flex-1">
          <label for="genInput"
            >Thế hệ:<span style="color: red">*</span>
            <span class="err-msg">{{ genErrorMessage }}</span></label
          >
          <select
            id="genInput"
            v-model="gen"
            @click="(e) => e.stopPropagation()"
          >
            <option value="">Chọn</option>
            <option
              v-for="(item, index) in productOptions.gen"
              :key="index"
              :value="item"
            >
              {{ item }}
            </option>
          </select>
        </div>

        <div class="select-control flex-1">
          <label for="socketInput"
            >Socket:<span style="color: red">*</span>
            <span class="err-msg">{{ socketErrorMessage }}</span></label
          >
          <select
            id="socketInput"
            v-model="socket"
            @click="(e) => e.stopPropagation()"
          >
            <option value="">Chọn</option>
            <option
              v-for="(item, index) in productOptions.socket"
              :key="index"
              :value="item"
            >
              {{ item }}
            </option>
          </select>
        </div>

        <div class="number-control flex-1">
          <label for="coreCountInput"
            >Core:
            <span class="err-msg">{{ coreCountErrorMessage }}</span></label
          >
          <input type="number" v-model="coreCount" id="coreCountInput" />
        </div>

        <div class="number-control flex-1">
          <label for="threadInput"
            >Thread:
            <span class="err-msg">{{ threadErrorMessage }}</span></label
          >
          <input type="number" v-model="thread" id="threadInput" />
        </div>
        <div class="text-control flex-1">
          <label for="coreClockInput"
            >Core clock:
            <span class="err-msg">{{ coreClockErrorMessage }}</span></label
          >
          <input type="text" v-model="coreClock" id="coreClockInput" />
        </div>

        <div class="text-control flex-1">
          <label for="coreBoostInput"
            >Core boost:
            <span class="err-msg">{{ coreBoostErrorMessage }}</span></label
          >
          <input type="text" v-model="coreBoost" id="coreBoostInput" />
        </div>

        <div class="text-control flex-1">
          <label for="tdpInput"
            >TDP: <span class="err-msg">{{ tdpErrorMessage }}</span></label
          >
          <input type="text" v-model="tdp" id="tdpInput" />
        </div>

        <div class="text-control flex-1">
          <label for="iGpuInput"
            >iGpu: <span class="err-msg">{{ iGpuErrorMessage }}</span></label
          >
          <input type="text" v-model="iGpu" id="iGpuInput" />
        </div>
      </div>

      <button type="submit" hidden ref="submitBtnRef"></button>
    </form>
    <div class="footing">
      <div class="btn-control">
        <button @click="emit('onEscape')">Hủy</button>
        <button @click="submitBtnRef?.click()">Thêm</button>
      </div>
    </div>
  </div>
</template>
<script setup lang="ts">
  import cpuService from '@/service/user/products/cpu.service';
  import { useField, useForm } from 'vee-validate';
  import type { ComponentPublicInstance } from 'vue';
  import { useToast } from 'vue-toastification';
  import { ref, watch, reactive, onMounted } from 'vue';
  import * as yup from 'yup';
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
    processor: Array<string>;
    gen: Array<string>;
    socket: Array<string>;
  }>({
    brand: [],
    processor: [],
    gen: [],
    socket: [],
  });
  const formValues = {
    productName: props.product?.productName || '',
    productPhoto:
      props.product?.productPhoto || '/images/products/no-image.png',
    productBrand: props.product?.productBrand || '',
    price: props.product?.price || 0,
    inStock: props.product?.inStock || 0,
    processor: '',
    gen: '',
    socket: '',
    coreCount: 0,
    thread: 0,
    coreClock: '',
    coreBoost: '',
    tdp: '',
    iGpu: '',
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
  const { value: processor, errorMessage: processorErrorMessage } = useField(
    'processor',
    yup.string().required('Bắt buộc')
  );
  const { value: gen, errorMessage: genErrorMessage } = useField(
    'gen',
    yup.string().required('Bắt buộc')
  );
  const { value: socket, errorMessage: socketErrorMessage } = useField(
    'socket',
    yup.string().required('Bắt buộc')
  );
  const { value: coreCount, errorMessage: coreCountErrorMessage } = useField(
    'coreCount'
    // yup.string().required('Bắt buộc')
  );
  const { value: thread, errorMessage: threadErrorMessage } = useField(
    'thread'
    // yup.string().required('Bắt buộc')
  );
  const { value: coreClock, errorMessage: coreClockErrorMessage } = useField(
    'coreClock'
    // yup.string().required('Bắt buộc')
  );
  const { value: coreBoost, errorMessage: coreBoostErrorMessage } = useField(
    'coreBoost'
    // yup.string().required('Bắt buộc')
  );
  const { value: tdp, errorMessage: tdpErrorMessage } = useField(
    'tdp'
    // yup.string().required('Bắt buộc')
  );
  const { value: iGpu, errorMessage: iGpuErrorMessage } = useField(
    'iGpu'
    // yup.string().required('Bắt buộc')
  );
  onMounted(() => {
    fetchOption();
    if (props.editForm) {
      fetchProductDetail();
    }
  });
  const handleFormSubmit = handleSubmit(async (values) => {
    // console.log(JSON.stringify(values, null, 2));
    try {
      const success = await cpuService.create(values);
      if (success) {
        toast.success('Đã thêm');
        emit('onEscape');
      } else toast.info('Không thể thêm');
    } catch (error) {
      toast.info('Xảy ra lỗi');
    }
  });
  watch([productBrand, processor, gen, socket], () => {
    fetchOption();
  });
  async function fetchOption() {
    const res = await cpuService.getOptions({
      query: {
        brand: productBrand.value,
        processor: processor.value,
        gen: gen.value,
        socket: socket.value,
      },
    });
    console.log(res);
    if (res) {
      productOptions.brand = res.options.brand;
      productOptions.processor = res.options.processor;
      productOptions.gen = res.options.gen;
      productOptions.socket = res.options.socket;
    }
  }
  async function fetchProductDetail() {
    if (props.product?.productId)
      try {
        let getProduct = null;
        getProduct = await cpuService.getProduct({
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
