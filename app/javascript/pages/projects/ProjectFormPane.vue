<template>
  <form @submit.prevent="$emit('submit')">
    <div v-if="errors.length != 0">
      <ul v-for="e in errors" :key="e">
        <li><font color="red">{{ e }}</font></li>
      </ul>
    </div>
    <div>
      <label>Name</label>
      <input v-model="project.name" type="text">
    </div>
    <div>
      <label>Profile</label>
      <input v-model="project.profile" type="text">
    </div>
    <button type="submit">登録する</button>
  </form>
</template>

<script>
export default {
  props: {
    project: {},
    errors: ''
  }
}
</script>
