import Vue from 'vue';
// import Vuetify from "vuetify";
import App from '../App.vue';
import LikeNumber from './components/LikeNumber.vue';

// import BootstrapVue from 'bootstrap-vue'
// import 'bootstrap/dist/css/bootstrap.css'
// import 'bootstrap-vue/dist/bootstrap-vue.css'
// import "vuetify/dist/vuetify.min.css";

// Vue.use(Vuetify);
// const vuetify = new Vuetify();
// Vue.use(BootstrapVue)

Vue.component('LikeNumber', LikeNumber);

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    // vuetify,
    render: h => h(App)
  }).$mount()
  document.body.appendChild(app.$el)

  console.log(app)
})
