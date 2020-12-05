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
  routes: [
    { path: '/',
      component: BaseRayout },
    { path: '/users/',
      component: UserIndex}
  ]
})

Vue.use(VueRouter)

export default {
  router
}
</script>
<style scoped>
</style>
