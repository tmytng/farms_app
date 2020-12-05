import Vue from "vue";
import Router from "vue-router";
Vue.use(Router);
import Home from "../views/Home.vue";
import Enterprise from "../views/Enterprise.vue";
import About from "../views/About.vue";
import UserIndex from "../views/users/UserIndex.vue";

const router = new Router({
  mode: "history",
  routes: [
    {
      path: '/',
      component: Home,
    },
    {
      path: '/enterprise',
      component: Enterprise,
    },
    {
      path: '/about',
      component: About,
    },
    {
      path: '/users/',
      component: UserIndex,
    },
  ],
});
export default router;
