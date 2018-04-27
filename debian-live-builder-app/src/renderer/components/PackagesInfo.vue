<template>
        <md-card class="md-layout-item md-size-75 md-small-size-100 md-with-hover">
            <md-card-header>
                <div class="md-title">Packages from main (http://softlibre.unizar.es/debian):</div>
            </md-card-header>
            <md-card-content>
                <div v-for="mirror in allpkgs.main">
                    <md-checkbox v-model="array" v-bind:value="mirror.name">{{ mirror.name }}</md-checkbox>
                    <p> {{ mirror.description }} </p>
                </div>
            </md-card-content>
        </md-card>
</template>

<script>
  export default {
    name: 'PackagesInfo',
    data () {
      return {
        allpkgs: {
          main: [
            {
              name: 'nano',
              description: 'small, friendly text editor inspired by Pico'
            },
            {
              name: 'vim',
              description: 'Vi IMproved - enhanced vi editor'
            },
            {
              name: 'nano1',
              description: 'small, friendly text editor inspired by Pico'
            },
            {
              name: 'vim1',
              description: 'Vi IMproved - enhanced vi editor'
            },
            {
              name: 'nano2',
              description: 'small, friendly text editor inspired by Pico'
            },
            {
              name: 'vim2',
              description: 'Vi IMproved - enhanced vi editor'
            },
            {
              name: 'nano3',
              description: 'small, friendly text editor inspired by Pico'
            },
            {
              name: 'vim3',
              description: 'Vi IMproved - enhanced vi editor'
            }

          ]
        },
        array: []
      }
    }
  }
</script>

<style scoped>

</style>
