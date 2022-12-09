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
          <label for="ramStandardInput"
            >Chuẩn Ram:<span style="color: red">*</span>
            <span class="err-msg">{{ ramStandardErrorMessage }}</span></label
          >
          <select
            id="ramStandardInput"
            v-model="ramStandard"
            @click="(e) => e.stopPropagation()"
          >
            <option value="">Chọn</option>
            <option
              v-for="(item, index) in productOptions.ramStandard"
              :key="index"
              :value="item"
            >
              {{ item }}
            </option>
          </select>
        </div>
        <div class="select-control flex-1">
          <label for="chipsetInput"
            >Chipset:<span style="color: red">*</span>
            <span class="err-msg">{{ chipsetErrorMessage }}</span></label
          >
          <select
            id="chipsetInput"
            v-model="chipset"
            @click="(e) => e.stopPropagation()"
          >
            <option value="">Chọn</option>
            <option
              v-for="(item, index) in productOptions.chipset"
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
          <label for="ramCapInput"
            >ramCap:
            <span class="err-msg">{{ ramCapErrorMessage }}</span></label
          >
          <input type="number" v-model="ramCap" id="ramCapInput" />
        </div>

        <div class="number-control flex-1">
          <label for="ramSlotInput"
            >ramSlot:
            <span class="err-msg">{{ ramSlotErrorMessage }}</span></label
          >
          <input type="number" v-model="ramSlot" id="ramSlotInput" />
        </div>

        <div class="text-control flex-1">
          <label for="formInput"
            >form: <span class="err-msg">{{ formErrorMessage }}</span></label
          >
          <input type="text" v-model="form" id="formInput" />
        </div>

        <div class="text-control flex-1">
          <label for="colorInput"
            >color: <span class="err-msg">{{ colorErrorMessage }}</span></label
          >
          <input type="text" v-model="color" id="colorInput" />
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
<!-- { 
    
    "chipset": "X570",
    "socket": "AM4",
    "ramStandard": "DDR4",

    "form": "ATX",
    "color": "Black / Silver",
    "ramCap": 128,
    "ramSlot": 4,
    
} -->
<script setup lang="ts">
  import cpuService from '@/service/user/products/cpu.service';
  import { useField, useForm } from 'vee-validate';
  import type { ComponentPublicInstance } from 'vue';
  import { useToast } from 'vue-toastification';
  import { ref, watch, reactive, onMounted } from 'vue';
  import * as yup from 'yup';
  import { mainboardService } from '@/service/user/products';
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
    chipset: Array<string>;
    brand: Array<string>;
    ramStandard: Array<string>;
    socket: Array<string>;
  }>({
    chipset: [],
    brand: [],
    ramStandard: [],
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
    socket: '',
    chipset: '',
    ramStandard: '',
    form: '',
    color: '',
    ramCap: 0,
    ramSlot: 0,
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
  const { value: chipset, errorMessage: chipsetErrorMessage } = useField(
    'chipset',
    yup.string().required('Bắt buộc')
  );
  const { value: ramStandard, errorMessage: ramStandardErrorMessage } =
    useField('ramStandard', yup.string().required('Bắt buộc'));
  const { value: socket, errorMessage: socketErrorMessage } = useField(
    'socket',
    yup.string().required('Bắt buộc')
  );
  const { value: form, errorMessage: formErrorMessage } = useField(
    'form'
    // yup.string().required('Bắt buộc')
  );
  const { value: color, errorMessage: colorErrorMessage } = useField(
    'color'
    // yup.string().required('Bắt buộc')
  );
  const { value: ramCap, errorMessage: ramCapErrorMessage } = useField(
    'ramCap'
    // yup.string().required('Bắt buộc')
  );
  const { value: ramSlot, errorMessage: ramSlotErrorMessage } = useField(
    'ramSlot'
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
        getProduct = await mainboardService.getProduct({
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
  watch([chipset, ramStandard, socket], () => {
    fetchOption();
  });
  async function fetchOption() {
    const res = await mainboardService.getOptions({
      query: {
        brand: productBrand.value,
        chipset: chipset.value,
        socket: socket.value,
        ramStandard: ramStandard.value,
      },
    });
    console.log(res);
    if (res) {
      productOptions.brand = res.options.brand;
      productOptions.chipset = res.options.chipset;
      productOptions.socket = res.options.socket;
      productOptions.ramStandard = res.options.ramStandard;
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
