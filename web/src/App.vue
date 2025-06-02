<template>
  <router-view v-if="supportWebSocket"></router-view>
  <div v-else>Your browser does not support WebSocket</div>
</template>

<script lang="ts" setup>
import '@/utils/poker.ts';
const supportWebSocket = "WebSocket" in window;

import { useUserStore } from '@/store/userStore'
const userStore = useUserStore()
window.addEventListener('message', (e) => {
  console.log(e.data)
  if (e.data.type === 'token') {
    localStorage.setItem('accessToken', e.data.data);
  }
})
</script>

<style>
html, body, #app {
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
}
</style>
