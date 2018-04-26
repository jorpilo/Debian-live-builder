<template>
    <div>
        <md-list v-for="mirror in mirrors">
        <md-list-item >
            <span class="md-list-item-text"> {{ mirror.name }} </span>
            <span class="md-list-item-text"> {{ mirror.url }}</span>
            <span class="md-list-item-text"> {{ mirror.zones }}</span>

            <md-button class="md-icon-button md-list-action">
                <md-icon class="md-primary">build</md-icon>

            </md-button>
            <md-button class="md-icon-button md-list-action">
                <md-icon class="md-primary">delete</md-icon>

            </md-button>

        </md-list-item>

        </md-list>
        <div id="fab">
        <md-button class="md-fab md-fab-bottom-right md-primary" @click="">
            <md-icon>add</md-icon>
        </md-button>
        </div>
    </div>
</template>

<script>
  export default {
    name: 'Packages',
    components: {},
    data () {
      return {
        mirrors: [
          {name: 'Main',
            url: 'http://softlibre.unizar.es',
            zones: 'main'},
          {name: 'Debian-ESP',
            url: 'ftp.es.debian.org/debian/',
            zones: 'main'}
        ]
      }
    }
  }
</script>

<style scoped>
    .md-fab {
        transform: scale(1);
        transition: transform 0.3s linear;
    }
.md-fab-bottom-right {
    position: relative;
    margin: 35px 10px 0 0px;
}
    #fab {
        text-align: right;
    }

</style>
