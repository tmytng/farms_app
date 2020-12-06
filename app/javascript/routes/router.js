import Vue from "vue";
import Router from "vue-router";
Vue.use(Router);
import Home from "../views/Home.vue";
import Enterprise from "../views/Enterprise.vue";
import About from "../views/About.vue";
import UserIndexPage from "../views/users/UserIndexPage.vue";
import UserNewPage from "../views/users/UserNewPage.vue";

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
      component: UserIndexPage,
    },
    {
      path: '/users/new',
      component: UserNewPage,
    },
  ],
});
export default router;
