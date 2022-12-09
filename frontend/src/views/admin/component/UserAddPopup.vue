<template>
  <div class="user-popup-view" @click="(e) => e.stopPropagation()">
    <div class="heading">
      <h1>Thêm khách hàng</h1>
      <div class="control-btn">
        <button class="escape-btn" @click="emit('onEscape')">
          <font-awesome-icon icon="fa-solid fa-xmark" />
        </button>
      </div>
    </div>
    <hr />
    <form class="user-form" @submit="handleFormSubmit">
      <div class="form-group">
        <div class="text-control flex-1">
          <label for="usernameInput"
            >Username:<span style="color: red">*</span>
            <span class="err-msg">{{ usernameErrorMessage }}</span></label
          >
          <input type="text" v-model="username" id="usernameInput" />
        </div>
        <div class="text-control flex-1">
          <label for="passwordInput"
            >Mật khẩu:<span style="color: red">*</span>
            <span class="err-msg">{{ passErrorMessage }}</span>
          </label>
          <input type="password" v-model="password" id="passwordInput" />
        </div>
        <div class="text-control flex-1">
          <label for="rePasswordInput"
            >Nhập lại mật khẩu:<span style="color: red">*</span>
            <span class="err-msg">{{ repassErrorMessage }}</span>
          </label>
          <input type="password" v-model="rePassword" id="rePasswordInput" />
        </div>
      </div>
      <div class="form-group">
        <div class="text-control flex-1">
          <label for="emailInput"
            >Email:<span style="color: red">*</span>
            <span class="err-msg">{{ emailErrorMessage }}</span>
          </label>
          <input type="text" v-model="email" id="emailInput" />
        </div>
        <div class="text-control flex-1">
          <label for="nameInput"
            >Tên:<span style="color: red">*</span>
            <span class="err-msg">{{ nameErrorMessage }}</span></label
          >
          <input type="text" v-model="name" id="nameInput" />
        </div>
        <div class="text-control flex-1">
          <label for="lastnameInput"
            >Họ:<span style="color: red">*</span>
            <span class="err-msg">{{ lastnameErrorMessage }}</span></label
          >
          <input type="text" v-model="lastname" id="lastnameInput" />
        </div>
        <div class="text-control flex-1">
          <label for="phoneInput"
            >Số điện thoại:<span style="color: red">*</span>
            <span class="err-msg">{{ phoneErrorMessage }}</span></label
          >
          <input type="text" v-model="phone" id="phoneInput" />
        </div>
      </div>
      <div class="form-group">
        <div class="text-control flex-1">
          <label for="cityInput"
            >Thành phố:
            <span class="err-msg">{{ cityErrorMessage }}</span></label
          >
          <input type="text" v-model="city" id="cityInput" />
        </div>
        <div class="text-control flex-3">
          <label for="addressInput"
            >Địa chỉ:
            <span class="err-msg">{{ addressErrorMessage }}</span></label
          >
          <input type="text" v-model="address" id="addressInput" />
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
  import { useField, useForm } from 'vee-validate';
  import type { ComponentPublicInstance } from 'vue';
  import adminUserService from '@/service/admin/user.service';
  import * as yup from 'yup';
  import { ref } from 'vue';
  import type { UserFormData } from '@/types/api/system/user';
  import { useToast } from 'vue-toastification';

  const emit = defineEmits<{
    (event: 'onEscape'): void;
    (event: 'onCancel'): void;
    (event: 'onSubmit', user: UserFormData): void;
  }>();
  const submitBtnRef = ref<ComponentPublicInstance<HTMLButtonElement>>();
  const toast = useToast();

  const formValues = {
    username: '',
    email: '',
    name: '',
    lastname: '',
    address: '',
    city: '',
    phone: '',
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
  const { value: username, errorMessage: usernameErrorMessage } = useField(
    'username',
    yup.string().required('Bắt buộc')
  );
  const { value: password, errorMessage: passErrorMessage } = useField(
    'password',
    yup.string().required('Bắt buộc')
  );
  const { value: rePassword, errorMessage: repassErrorMessage } = useField(
    'rePassword',
    yup
      .string()
      // .oneOf([password.value, null, '123'], 'Chưa khớp')
      .test({
        name: 'repass',
        message: 'Chưa khớp',
        test: (v) => v === password.value,
      })
      .required('Bắt buộc')
  );
  const { value: email, errorMessage: emailErrorMessage } = useField(
    'email',
    yup.string().required('Bắt buộc').email('Không đúng định dạng')
  );
  const { value: phone, errorMessage: phoneErrorMessage } = useField(
    'phone',
    yup
      .string()
      .required('bắt buộc')
      .matches(
        RegExp('([+]84|84|0[3|5|7|8|9])+(([0-9]{8})|([0-9]{9}))'),
        'không đúng định dạng'
      )
  );
  const { value: name, errorMessage: nameErrorMessage } = useField(
    'name',
    yup.string().required('Bắt buộc')
  );
  const { value: lastname, errorMessage: lastnameErrorMessage } = useField(
    'lastname',
    yup.string().required('Bắt buộc')
  );
  const { value: city, errorMessage: cityErrorMessage } = useField('city');
  const { value: address, errorMessage: addressErrorMessage } =
    useField('address');
  const handleFormSubmit = handleSubmit(async (values) => {
    console.log(JSON.stringify(values, null, 2));
    try {
      const success = await adminUserService.create(values);
      if (success) {
        toast.success('Đã thêm');
        emit('onEscape');
      } else toast.info('Không thể thêm');
    } catch (error) {
      toast.info('Xảy ra lỗi');
    }
  });
</script>
<style lang="scss" scoped>
  .user-popup-view {
    min-width: 1000px;
    min-height: 200px;
    background-color: #fff;
    border-radius: 5px;
    padding: 10px 15px;
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

    .user-form {
      .form-group {
        display: flex;
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
  }
</style>
