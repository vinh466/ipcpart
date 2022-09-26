<script setup lang="ts">
import TheWelcome from '@/components/TheWelcome.vue';
import HelloWorld from '@/components/HelloWorld.vue';
import authService from '@/service/auth.service';
import userService from '@/service/user.service';
</script>

<template>
  <div class="container">
    <header>
      <img
        alt="Vue logo"
        class="logo"
        src="@/assets/image/logo.svg"
        width="125"
        height="125"
      />
      <div class="wrapper">
        <HelloWorld msg="You did it!" />
        <nav>
          <RouterLink to="/home">Home</RouterLink>
          <RouterLink to="/test">Test</RouterLink>
          <RouterLink to="/auth/signup">Sign up</RouterLink>
          <RouterLink to="/auth/signin">Sign in</RouterLink>
          <button type="button" @click="authService.test">Test Auth API</button>
          <button type="button" @click="userService.test">Test User API</button>
        </nav>
      </div>
    </header>

    <main>
      <TheWelcome />
    </main>
  </div>
</template>

<style lang="scss" scoped>
header {
  line-height: 1.5;
  max-height: 100vh;
}

.logo {
  display: block;
  margin: 0 auto 2rem;
}

nav {
  width: 100%;
  font-size: 12px;
  text-align: center;
  margin-top: 2rem;

  a {
    display: inline-block;
    padding: 0 1rem;
    border-left: 1px solid var(--color-border);

    &:first-of-type {
      border: 0;
    }
    &.router-link-exact-active {
      color: var(--color-text);
    }
    &.router-link-exact-active:hover {
      background-color: transparent;
    }
  }
}

@media (min-width: 1024px) {
  .container {
    display: flex;
    place-items: center;
    min-height: 100vh;
  }

  header {
    display: flex;
    place-items: center;
    padding-right: calc(var(--section-gap) / 2);

    .wrapper {
      display: flex;
      place-items: flex-start;
      flex-wrap: wrap;
    }
  }

  .logo {
    margin: 0 2rem 0 0;
  }

  nav {
    text-align: left;
    margin-left: -1rem;
    font-size: 1rem;

    padding: 1rem 0;
    margin-top: 1rem;
  }
}
</style>
