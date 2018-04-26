<template>
  <div id="app" class="app">
    <router-view></router-view>
  </div>
</template>

<script>
  export default {
    name: 'debian-live-builder'
  }
</script>

<style>
  /* CSS */
  @import url('https://fonts.googleapis.com/css?family=Raleway:300,700|Passion+One');
  body {
    background-color: #394149;
  }
  h1 {
    background-color: darkgrey;
    border-radius: 25px;
    color: black;
    font-family: 'Passion One', serif;

  }
  body {
    font-family: 'Raleway', 'Arial', serif;
  }
</style>
