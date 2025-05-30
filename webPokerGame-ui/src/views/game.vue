<template>
  <iframe
    ref="gameIframe"
    :src="src"
    frameborder="0"
    class="width-full height-full"></iframe>
</template>

<script>
import store from '@/store'

export default {
  name: "game",
  data() {
    return {
      src: "http://localhost:5173/user"
    }
  },
  methods: {
    sendToken() {
      this.$refs.gameIframe.contentWindow.postMessage({
        type: 'token',
        data: store.getters.token
      }, this.src);
    },
    listenMessage() {
      return (e) => {
        console.log(e.data)
        if (e.data.type === 'reload') {
          location.reload();
        }
      }
    },
  },
  mounted() {
    console.log(store.getters);
    this.$refs.gameIframe.onload = this.sendToken;
    window.addEventListener('message', this.listenMessage);
  },
  destroyed() {
    window.removeEventListener('message', this.listenMessage)
  }
}

</script>

<style scoped lang="scss">
iframe {
  position: absolute;
  width: 100%;
  height: 100%;
}
</style>
