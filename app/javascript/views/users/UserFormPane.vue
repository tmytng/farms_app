<template>
  <v-container>
    <v-app>
      <v-form ref="user_form">
      <v-text-field
        v-model="name"
        label="名前"
        :rules="[rules.required, rules.limit_length]"
        counter="10"
      >
      </v-text-field>
      <v-text-field
        v-model="email"
        label="Eメールアドレス"
        :rules="[rules.required, rules.email]"
      >
      </v-text-field>
      <v-text-field
        v-model="profile"
        label="プロフィール"
        counter="140"
      >
      </v-text-field>
      <v-text-field
        v-model="position"
        label="ポジション・役割"
        counter="10"
        :rules="[rules.limit_length]"
      >
      </v-text-field>
      <v-text-field
        v-model="password"
        label="パスワード"
        :rules="[rules.required]"
      >
      </v-text-field>
      <v-text-field
        v-model="password_confirmation"
        label="パスワードの確認"
        :rules="[rules.required]"
      >
      </v-text-field>
      </v-form>
        <v-btn text v-on:click="submit">送信する</v-btn>
        <span v-if="success">送信成功！</span>
    </v-app>
  </v-container>
</template>

<script>
import axios from 'axios'
export default {
  data (){
    return {
    // 各テキストボックスの値
      name: "",
      email: "",
      profile: "",
      position: "",
      password: "",
      password_confirmation: "",
    // 送信が成功したかどうかのフラグ
      success: false,
    // 入力規則
      rules:{
      required: value => !!value || "入力は必須です", // 入力必須の制約
      limit_length: value => value.length <= 10 || "10文字以内で入力してください", // 文字数の制約
      email: value => {const pattern = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return pattern.test(value) || 'Eメールアドレスが正しく入力されていません'
        }
      }
    }
  },
  methods: {
    submit() {
      if (this.$refs.user_form.validate()) {
      // すべてのバリデーションが通過したときのみ
      // if文の中に入る
      this.success = true;
      } else {
      this.success = false;
      }
    },
    createUser() {
      axios.post('/api/v1/users', {user: {name: this.user.name, email: this.user.email, profile: this.user.profile, position: this.user.position, password: this.user.password, password_confirmation: this.user.password_confirmation }})
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
  },
}
</script>
