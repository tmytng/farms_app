<template>
  <v-container>
    <h1 class="sub-msg">プロジェクト詳細</h1>
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
  </v-container>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      project: {}
    }
  },
  mounted () {
    axios
      .get(`/api/v1/projects/${this.$route.params.id}.json`)
      .then(response => (this.project = response.data))
  }
}
</script>

<style scoped>
</style>
