<template>
  <v-container>
    <h1 class="sub-msg">ユーザー情報編集</h1>
      <UserFormPane :errors="errors" :user="user" @submit="updateUser"></UserFormPane>
  </v-container>
</template>

<script>
import axios from 'axios';
import UserFormPane from './UserFormPane.vue';

export default {
  components: {
    UserFormPane
  },
  data() {
    return {
      user: {},
      errors: ''
    }
  },
  mounted () {
    axios
      .get(`/api/v1/users/${this.$route.params.id}.json`)
      .then(response => (this.user = response.data))
  },
  methods: {
    updateUser: function() {
      axios
        .patch(`/api/v1/users/${this.user.id}`, this.user)
        .then(response => {
          this.$router.push({ name: 'UserDetailPage', params: { id: this.user.id } });
        })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
    }
  }
}
</script>
