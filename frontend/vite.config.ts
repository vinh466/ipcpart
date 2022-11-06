import { fileURLToPath, URL } from 'node:url'

import vue from '@vitejs/plugin-vue'
import { defineConfig } from 'vite'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [vue()],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url)),
      "public": fileURLToPath(new URL('./public', import.meta.url))
    }
  },
  build: {
    outDir: '../dist/frontend'
  },
  server: {
    port: 3002,
    proxy: {
      "/api": {
        target: "http://localhost:3005/",
        changeOrigin: true,
        secure: false,
        ws: true,
      },
    },
  }
})
