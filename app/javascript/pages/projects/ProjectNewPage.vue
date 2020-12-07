<template>
  <v-container>
    <h1 class="sub-msg">プロジェクト新規作成</h1>
    <div>
      <project-form-pane :errors="errors" :project="project" @submit="createProject"></project-form-pane>
    </div>
  </v-container>
</template>

<script>
import axios from 'axios';
// import UserFormPane from './UserFormPane.vue';
export default {
  components: {
  },
  data() {
    return {
      project: {
        name: '',
        email: '',
        password: '',
        password_confirmation: ''
      },
      errors: ''
    }
  },
  methods: {
    createUser() {
      axios.post('/api/v1/project', {user: {name: this.user.name, email: this.user.email, profile: this.user.profile, position: this.user.position, password: this.user.password, password_confirmation: this.user.password_confirmation }})
        .then(res => {
          switch (res.status) {
            case 201:
              this.$emit('add', res.data)
              this.user = { name: '', email: '', profile: '', position: '', password: '', password_confirmation: ''}
              this.$emit('close')
              break;
            case 400:
              console.log(res.data.message)
              break;
          }
        })
    }
  }
}
</script>


<style scoped>
a:hover,
a:link,
a:visited,
a:active {
  color: black;
  text-decoration: none;
}

ul,li {
  list-style: none;

}
.sub-msg {
  font-size: 24px;
  margin:8px 0px;
}

.users-container {
  display: grid;
  grid-template-columns: repeat(5, auto);
  gap: 8px;
  justify-content: space-around;
}
.users-box {
  height: auto;
  width: 256px;
  padding: 8px;
  background-color: lightgray;
  font-size: 12px;
  display: flex;
  align-items: center;
  flex-direction: column;
}
.avatar {
  width: 240px;
  height: 240px;
}

img {
  width: 100%;
  height: 240px;
  border: 1px solid lightgray;
  object-fit: cover;
  display: block;
}
.name {
  width: 240px;
  font-size: 16px;
  font-weight: bold;
  margin: 6px 0;
  text-align: center;
}
.profile {
  width: 240px;
  margin-bottom: 6px;
}
.register-date, .last-updated {
  color: #414141;
}

</style>
