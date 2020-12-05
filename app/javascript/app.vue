<template>
  <div>
    <router-view></router-view>
  </div>
</template>

<script>
import Vue from 'vue'
import VueRouter from 'vue-router'
import BaseRayout from 'packs/components/BaseRayout.vue'
import UserIndex from 'packs/components/user/UserIndex.vue'

const router = new VueRouter({
mode: 'history',
base: process.env.BASE_URL,
  routes: [
    { path: '/',
      component: BaseRayout
    },
    { path: '/users/',
      name: 'UserIndex',
      component: () => import('packs/components/user/UserIndex.vue')
    },
    {
      path: '/enterprise',
      name: 'enterprise',
      component: () => import('packs/components//Enterprise.vue')
    }
  ]
})

Vue.use(VueRouter)

export default {
  router
}
</script>
<style scoped>
</style>
