<template>
  <div>
    <p>投稿表示フォーム</p>

      <!-- preventでsetPost()メソッドがページ遷移なく発火する -->
    <form v-on:submit.prevent="setUser()">
      <p>
        <label>Title</label>
        <input name="user.name" type="text" v-model="user.title"><br />
      </p>
      <p>
        <label>Body</label>
        <input name="user.profile" type="text" v-model="user.profile"><br />
      </p>

      <!-- post.idを指定して... -->
      <p>
        <label>IDを指定</label>
        <input name="user.id" type="text" v-model="user.id">
      </p>

      <!-- ここを押してデータ取得 -->
      <input type="submit" value="ここを押して投稿データ取得" >

      <!-- Base64形式であればimgタグでそのまま読み込みが可能 -->
      <img :src="user.image" alt="user.image">
    </form>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  name: 'sample',
  data() {
    return {
      user: {},
    }
  },
  methods: {
    setUser() {
      axios.get('/users', {params: {id: this.user.id}}) //入力したidに応じてpostが返ってくる
      .then(response => {
        this.user = response.data
      })
      .catch( error => {
        console.error(error)
      })
    }

  }
}
</script>
