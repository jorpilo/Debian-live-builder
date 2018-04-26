import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'home',
      component: require('@/components/LandingPage').default
    },
    {
      path: '/conf',
      name: 'configuration',
      component: require('@/components/Configuration').default
    },
    {
      path: '/packages',
      name: 'packages',
      component: require('@/components/Packages').default
    },
    {
      path: '/packages/:name',
      name: ':name',
      component: require('@/components/PackagesInfo').default
    }
  ]
})
