<template>
  <v-app>
    <BaseRayout></BaseRayout>
    <router-view></router-view>
  </v-app>
</template>

<script>
import BaseRayout from './components/BaseRayout.vue'
  export default {
    components: {
      BaseRayout,
    },
  }

</script>

<style scoped>
</style>
