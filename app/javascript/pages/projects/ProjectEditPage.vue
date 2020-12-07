<template>
  <v-container>
    <h1 class="sub-msg">プロジェクト編集</h1>
      <ProjectFormPane :errors="errors" :project="project" @submit="updateProject"></ProjectFormPane>
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
    updateProject: function() {
      axios
        .patch(`/api/v1/projects/${this.project.id}`, this.project)
        .then(response => {
          this.$router.push({ name: 'ProjectDetailPage', params: { id: this.project.id } });
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
