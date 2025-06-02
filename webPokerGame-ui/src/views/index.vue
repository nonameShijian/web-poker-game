<template>
  <div class="app-container home">
    欢迎使用立棍扑克游戏平台{{ role === "player" ? "" : "管理系统" }}
  </div>
</template>

<script>
import store from '@/store'

export default {
  name: "Index",
  data() {
    return {
      // 版本号
      version: "3.8.5",
      role: null,
    };
  },
  methods: {
    goTarget(href) {
      window.open(href, "_blank");
    }
  },
  created() {
    this.role = store.getters.roles[0];
    if (this.role === "player") {
      // this.$router.replace({ path: "/game" });
    }
  }
};
</script>

<style scoped lang="scss">
.home {
  blockquote {
    padding: 10px 20px;
    margin: 0 0 20px;
    font-size: 17.5px;
    border-left: 5px solid #eee;
  }
  hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid #eee;
  }
  .col-item {
    margin-bottom: 20px;
  }

  ul {
    padding: 0;
    margin: 0;
  }

  font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 13px;
  color: #676a6c;
  overflow-x: hidden;

  ul {
    list-style-type: none;
  }

  h4 {
    margin-top: 0px;
  }

  h2 {
    margin-top: 10px;
    font-size: 26px;
    font-weight: 100;
  }

  p {
    margin-top: 10px;

    b {
      font-weight: 700;
    }
  }

  .update-log {
    ol {
      display: block;
      list-style-type: decimal;
      margin-block-start: 1em;
      margin-block-end: 1em;
      margin-inline-start: 0;
      margin-inline-end: 0;
      padding-inline-start: 40px;
    }
  }
}
</style>

