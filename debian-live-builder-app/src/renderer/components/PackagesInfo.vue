<template>
<form v-for="packages in mirrors["
</template>

<script>
  export default {
    name: 'PackagesInfo',
    data: function () {
      return {
        packages: [],
        mirror: this.$route.params
      }
    }
  }
</script>

<style scoped>

</style>
