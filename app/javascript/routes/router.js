import Vue from "vue";
import Router from "vue-router";
Vue.use(Router);
import Enterprise from "../views/Enterprise.vue";
import About from "../views/About.vue";

const router = new Router({
  mode: "history",
  routes: [
    {
      path: '/enterprise',
      component: Enterprise,
    },
    {
      path: "/about",
      component: About,
    },
  ],
});
export default router;
