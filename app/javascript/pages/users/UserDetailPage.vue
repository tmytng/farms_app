<template>
  <v-container>
    <h1 class="sub-msg">ユーザー詳細画面</h1>
      <dl>
        <dt>メンバーID</dt>
        <dd>{{ user.id }}</dd>
        <dt>名前</dt>
        <dd>{{ user.name }}</dd>
        <dt>メールアドレス</dt>
        <dd>{{ user.email }}</dd>
        <dt>ポジション</dt>
        <dd>{{ user.position }}</dd>
        <dt>プロフィール</dt>
        <dd>{{ user.profile }}</dd>
        <dt>所属プロジェクト</dt>
        <dd class="check">テスト。要データ呼び出し</dd>
        <dt>メンバー登録日</dt>
        <dd class="check">{{ user.created_at }}</dd>
        <dt>ユーザー権限</dt>
        <dd class="check">テスト。要データ呼び出し</dd>
        <dt>最終ログイン</dt>
        <dd class="check">テスト。要データ呼び出し</dd>
      </dl>
      <br />
      <p><router-link :to="{ name: 'UserEditPage', params: { id: user.id } }">{{ user.name }}を編集する</router-link></p>
      <button @click="destroyUser(user.id)">削除する</button>
  </v-container>
</template>

<script>
import axios from 'axios';
export default {
  data: function () {
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
    destroyUser(id) {
      axios
        .delete(`api/v1/users/` + id)
          .then(response => {
            this.$router.push('/users/');
        })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
    }
  },
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

dt {
  font-weight: bold;
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
