import Vue from 'vue'
import axios from 'axios'
import BootstrapVue from 'bootstrap-vue'
import VueElectron from 'vue-electron'

import App from './App'
import router from './router'
import store from './store'

import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import 'vue-material/dist/vue-material.min.css'
import VueMaterial from 'vue-material'
import 'vue-material/dist/theme/default-dark.css'
import draggable from 'vuedraggable'

if (!process.env.IS_WEB) Vue.use(require('vue-electron'))
Vue.http = Vue.prototype.$http = axios
Vue.config.productionTip = false

Vue.use(VueMaterial)
Vue.use(VueElectron)
Vue.use(draggable)

/* eslint-disable no-new */
new Vue({
  components: { App },
  router,
  store,
  BootstrapVue,
  template: '<App/>'
}).$mount('#app')
