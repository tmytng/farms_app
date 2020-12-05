import Vue from 'vue'
// import Vuetify from "vuetify";
// import "vuetify/dist/vuetify.min.css";
import App from '../app.vue'

import BootstrapVue from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
// Vue.use(Vuetify);
// const vuetify = new Vuetify();
Vue.use(BootstrapVue)

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    // vuetify,
    render: h => h(App)
  }).$mount()
  document.body.appendChild(app.$el)

  console.log(app)
})
