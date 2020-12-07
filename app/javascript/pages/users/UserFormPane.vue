<template>
  <v-container>
    <v-app>
      <v-form ref="user_form" @submit.prevent="$emit('submit')">
        <div v-if="errors.length != 0">
          <ul v-for="e in errors" :key="e">
            <li><font color="red">{{ e }}</font></li>
          </ul>
        </div>
      <v-text-field
        v-model="name"
        label="名前"
      >
      </v-text-field>
      <v-text-field
        v-model="email"
        label="Eメールアドレス"
      >
      </v-text-field>
      <v-text-field
        v-model="profile"
        label="プロフィール"
      >
      </v-text-field>
      <v-text-field
        v-model="position"
        label="ポジション・役割"
      >
      </v-text-field>
      <v-text-field
        v-model="password"
        label="パスワード"
      >
      </v-text-field>
      <v-text-field
        v-model="password_confirmation"
        label="パスワードの確認"
      >
      </v-text-field>
        <button type="submit">送信する</button>
      </v-form>
    </v-app>
  </v-container>
</template>

<script>
import axios from 'axios'
export default {
  props: {
    user: {},
    errors: ''
  },
}
</script>
