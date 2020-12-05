<template>
  <section id="UserIndex">
    <h1>User-index</h1>
    <p>{{users}}</p>
  </section>
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
