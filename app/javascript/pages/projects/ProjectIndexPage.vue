<template>
  <v-container>
    <h1 class="sub-msg">プロジェクトディレクトリ</h1>
      <ul v-for="pj in projects" :key="pj.name">
        <li>{{pj.id}}</li>
        <li>{{pj.name}}</li>
        <li>{{pj.profile}}</li>
      </ul>
  </v-container>
</template>

<script>
import axios from 'axios'
  export default {
    data() {
      return {
        projects: [],
      }
    },
    created() {
      axios.get('/api/v1/projects')
        .then(res => {
          this.projects = res.data
        })
    }
  }
</script>

<style scoped>
</style>
