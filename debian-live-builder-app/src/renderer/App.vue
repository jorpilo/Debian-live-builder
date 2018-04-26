<template>
  <div class="page-container">
    <md-app md-waterfall md-mode="fixed-last">
      <md-app-toolbar class="md-large md-dense md-primary">
        <div class="md-toolbar-row">
            <span class="md-title">Debian Live Builder</span>
        </div>

        <div class="md-toolbar-row">
          <md-tabs class="md-primary">
            <md-tab id="tab-home" md-label="Home" to="/"></md-tab>
            <md-tab id="tab-posts" md-label="Configuration" to="/conf"></md-tab>
            <md-tab id="tab-pages" md-label="Packages" to="/packages"></md-tab>

          </md-tabs>
        </div>
      </md-app-toolbar>
      <md-app-content>
        <router-view></router-view>
      </md-app-content>
    </md-app>
  </div>
</template>

<style lang="scss">
  @import url("http://fonts.googleapis.com/css?family=Roboto:400,500,700,400italic|Material+Icons");
  .md-app {

    border: 1px solid rgba(#000, .12);
  }

  body {
    background-color: var(--md-theme-default-background, #424242);
  }
</style>

<script>
  export default {
    name: 'LastRowFixed',
    data: () => ({
      menuVisible: false
    })
  }
</script>
