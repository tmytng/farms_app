<template>
  <div id="App">
    <BaseLayout></BaseLayout>
    <router-view></router-view>
  </div>
</template>

<script>
import BaseLayout from './components/BaseLayout.vue'
  export default {
    components: {
      BaseLayout,
    },
  }

</script>

<style scoped>
</style>
