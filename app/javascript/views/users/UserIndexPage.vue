<template>
  <v-container>
    <!-- <div v-if="errors.length != 0">
      <ul v-for="e in errors" :key="e">
        <li><font color="red">{{ e }}</font></li>
      </ul>
    </div> -->
    <h1 class="sub-msg">メンバーディレクトリ</h1>
    <div class="users-container">
    <ul class="users-box" v-for="u in users" :key="u.name">
      <li class="name">{{u.name}}</li>
      <li class="profile">{{u.profile}}</li>
      <li class="last-updated">最終ログイン：{{u.last_sign_in_at}}</li>
    </ul>
    </div>
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
