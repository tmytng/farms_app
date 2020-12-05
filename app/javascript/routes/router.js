import Vue from "vue";
import Router from "vue-router";
Vue.use(Router);
import Enterprise from "../views/Enterprise.vue";
import About from "../views/About.vue";
import UserIndex from "../views/user/UserIndex.vue";

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
    {
      path: "/user/index",
      component: UserIndex,
    },
  ],
});
export default router;
