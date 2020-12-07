<template>
  <v-container>
    <h1 class="sub-msg">プロジェクト詳細</h1>

      <div v-if="errors.length != 0">
      <ul v-for="e in errors" :key="e">
        <li><font color="red">{{ e }}</font></li>
      </ul>
      </div>
      <dl>
        <dt>プロジェクトID</dt>
        <dd>{{ project.id }}</dd>
        <dt>プロジェクト名</dt>
        <dd>{{ project.name }}</dd>
        <dt>インフォメーション</dt>
        <dd>{{ project.profile }}</dd>
        <dt>作成者</dt>
        <dd>{{ project.creator }}</dd>
        <dt>登録日</dt>
        <dd>{{ project.created_at }}</dd>
        <dt>更新日</dt>
        <dd>{{ project.updated_at }}</dd>
      </dl>
      <p><router-link :to="{ name: 'ProjectEditPage', params: { id: project.id } }">{{ project.name }}を編集する</router-link></p>
      <button @click="destroyProject(project.id)">削除する</button>
  </v-container>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      project: {},
      errors: ''
    }
  },
  mounted () {
    axios
      .get(`/api/v1/projects/${this.$route.params.id}.json`)
      .then(response => (this.project = response.data))
  },
  methods: {
    destroyProject(id) {
      axios
        .delete(`api/v1/projects/` + id)
          .then(response => {
            this.$router.push('/projects/');
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
</style>
