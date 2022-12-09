<template>
  <div class="auth">
    <div class="auth-from">
      <div class="content">
        <div class="auth-form signin-form">
          <SigninForm />
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
  import SigninForm from './component/SignInForm.vue';
  import { computed, watch } from '@vue/runtime-core';
  import { useRoute } from 'vue-router';
  import { storeToRefs } from 'pinia';
</script>

<style lang="scss">
  body {
    background-color: #fff;
  }
  .mb-1 {
    margin-bottom: 0.5rem;
  }
  .btn {
    padding: 5px 8px 4px;
  }
  .text-center {
    text-align: center;
  }
  .form-feedback {
    color: var(--red);
  }
  .error-feedback {
    margin-left: 10px;
    color: var(--red);
    font-size: 0.8rem;
  }
  .auth {
    display: flex;
    align-items: center;
    flex-direction: column;
    height: 100vh;
    user-select: none;
    background: #001c40;
    border-bottom-left-radius: 100%;
    .auth-from {
      background-color: white;
      padding: 30px;
      margin: 20vh;
      box-shadow: 5px 5px 25px #9dcab6;
      border-radius: 10px;
      .orther-auth {
        display: flex;
        flex-direction: column;
        align-items: center;

        p {
          color: var(--text-light-2);
        }

        .btn-group {
          & > * {
            margin: 0px 5px;
          }
        }
      }
      .nav {
        display: flex;
        justify-content: center;
        gap: 10px;

        .nav-link {
          display: block;
          text-align: center;
          color: #aaaaaa;
          padding: 0 5px;
          cursor: pointer;
          &.active {
            font-weight: 600;
            background-color: #ddd;
            color: hsl(160deg, 100%, 37%);
          }
          &:hover {
            background-color: #eee;
          }
        }
      }

      .content {
        .auth-form {
          color: var(--text-light-2);
          .form-text-control {
            margin: 10px 0 6px;

            .input-field {
              position: relative;

              input {
                width: 400px;
                height: 40px;
                border-radius: 5px;
                padding-left: 5px;
              }
              input:not(:placeholder-shown) ~ label,
              input:focus ~ label {
                display: none;
              }
              label {
                position: absolute;
                user-select: none;
                top: 50%;
                transform: translateY(-50%);
                left: 10px;
              }
            }
          }
          .form-control-end {
            display: flex;
            justify-content: space-between;
            .form-checkbox {
              display: flex;
              justify-content: space-between;
              .form-check-input {
                appearance: checkbox;
              }
              .form-check-label {
                padding-left: 4px;
                cursor: pointer;
              }
            }
            /* .from-forgot {} */
          }
          .from-submit.center {
            display: flex;
            justify-content: center;
          }
          .form-submit-btn {
            font-size: 20px;
            margin: 10px;
          }
        }
      }
    }
  }
</style>
