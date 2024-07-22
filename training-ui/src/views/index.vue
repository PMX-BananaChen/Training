<template>
  <div class="app-container home">
    <img src="../assets/images/login-background.jpg"
         alt="">
    <h2>欢迎访问员工培训平台</h2>
  </div>
</template>

<script>
export default {
  name: 'index',
  data() {
    return {}
  },
  methods: {}
}
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

  font-family: 'open sans', 'Helvetica Neue', Helvetica, Arial, sans-serif;
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
* {
  margin: 0;
  padding: 0;
}
.app-container {
  position: relative;
  img {
    width: 100%;
    height: 100%;
  }
  h2 {
    position: absolute;
    left: 10px;
    top: 10px;
    color: aliceblue;
  }
}
</style>

