<template>
  <v-container>
    <!-- <div v-if="errors.length != 0">
      <ul v-for="e in errors" :key="e">
        <li><font color="red">{{ e }}</font></li>
      </ul>
    </div> -->
    <h1>user index</h1>
    <ul v-for="u in users" :key="u.name">
      <li>{{u.name}}</li>
      <li>{{u.profile}}</li>
      <li>{{u.last_sign_in_at}}</li>
      <li>{{u.admin}}</li>
    </ul>
  </v-container>
</template>

<script>
import axios from 'axios'
  export default {
    data() {
      return {
        users: [],
      }
    },
    created() {
      axios.get('/api/v1/users')
        .then(res => {
          this.users = res.data
        })
    }
  }
</script>


<style scoped>
</style>
