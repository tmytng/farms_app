import Vue from "vue";
import Router from "vue-router";
Vue.use(Router);
import Home from "../views/Home.vue";
import Enterprise from "../views/Enterprise.vue";
import About from "../views/About.vue";
import UserIndex from "../views/users/UserIndexPage.vue";
import UserNew from "../views/users/UserNewPage.vue";

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
    {
      path: '/users/new',
      component: UserNew,
    },
  ],
});
export default router;
