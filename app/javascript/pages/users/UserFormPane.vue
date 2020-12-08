<template>
  <form @submit.prevent="$emit('submit')">
    <div v-if="errors.length != 0">
      <ul v-for="e in errors" :key="e">
        <li><font color="red">{{ e }}</font></li>
      </ul>
    </div>
    <div>
      <label>Name</label>
      <input v-model="user.name" type="text">
    </div>
    <div>
      <label>Profile</label>
      <input v-model="user.profile" type="text">
    </div>
    <div>
      <label>email</label>
      <input v-model="user.email" type="text">
    </div>
    <div>
      <label>password</label>
      <input v-model="user.password" type="password">
    </div>
    <div>
      <label>re:password</label>
      <input v-model="user.password_confirmation" type="password">
    </div>
    <button type="submit">登録する</button>
  </form>
</template>

<script>
export default {
  props: {
    user: {},
    errors: ''
  }
}
</script>
