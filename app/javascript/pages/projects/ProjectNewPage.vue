<template>
  <v-container>
    <h1 class="sub-msg">プロジェクト新規作成</h1>
    <p>test</p>
    <div>
      <project-form-pane :errors="errors" :project="project" @submit="createProject"></project-form-pane>
    </div>
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
      Project: {
        name: '',
        profile: '',
        creator: '',

      },
      errors: ''
    }
  },
  methods: {
    createProject: function() {
      axios
        .post('/api/v1/projects', this.Project)
        .then(response => {
          let e = response.data;
          this.$router.push({ name: 'ProjectIndexPage', params: { id: e.id } });
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
