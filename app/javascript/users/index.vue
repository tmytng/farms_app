<template>
  <div>
    <h1>test</h1>
    <p>{{users}}</p>
  </div>
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
