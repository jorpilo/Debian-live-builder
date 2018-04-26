<template>
  <div class="landing-page">
    <img src="../assets/logo.png" width="130" height="180" class="logo">
    <div class="container btn-group-wrap menu">
        <button type="button" class="btn btn-primary btn-lg" @click="build()">Build</button>
        <button type="button" class="btn btn-primary btn-lg" @click="clean()">Clean</button>
        <button type="button" class="btn btn-primary btn-lg" @click="exit()">Exit</button>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'landing-page',
    components: {},
    data () {
      return {
        w: require('electron').remote.getCurrentWindow()
      }
    },
    methods: {
      build: function () { console.log('Build command') },
      clean: function () { console.log('Clean command') },
      exit: function () { this.w.close() },
      navConf () {
        this.$router.push({name: 'configuration'})
      }
    }
}
</script>

<style>
  .landing-page {
    margin-top: 15px
  }
  .logo {
    display: block;
    margin: 0 auto;
  }
  .btn-group-wrap {
    text-align: center;
  }
  .btn {
    margin: 10px 0 10px 0;
    width: 50%;
  }
</style>
