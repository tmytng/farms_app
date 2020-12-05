import Vue from "vue";
import Vuex from "vuex"
import VueRouter from "vue-router";
import store from "../store/store.js";
import router from "../routes/router.js";
import App from "../app.vue";
import axios from "axios";
import VueAxios from "vue-axios";
import Vuetify from "vuetify";
import "@mdi/font/css/materialdesignicons.css";
import "vuetify/dist/vuetify.min.css";

Vue.use(Vuex);
Vue.use(VueRouter);
Vue.use(VueAxios, axios);
Vue.use(Vuetify);
const vuetify = new Vuetify();

document.addEventListener("DOMContentLoaded", () => {
  const app = new Vue({
    store,
    router,
    vuetify,
    render: (h) => h(App),
  }).$mount();
  document.body.appendChild(app.$el);
});
