<template>
  <v-container>
    <h1 class="sub-msg">プロジェクト新規作成</h1>
      <ProjectFormPane :errors="errors" :project="project" @submit="createProject"></ProjectFormPane>
  </v-container>
</template>

<script>
import axios from 'axios';
import ProjectFormPane from './ProjectFormPane.vue';

export default {
  components: {
    ProjectFormPane
  },
  data() {
    return {
      project: {
        name: '',
        profile: '',
        // creatorはstrong parameterで処理
      },
      errors: ''
    }
  },
  methods: {
    createProject() {
      axios
        .post('/api/v1/projects', this.project)
        .then(response => {
          this.$router.push('/');
        })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
    }
  }
}
</script>
