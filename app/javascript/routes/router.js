import Vue from "vue";
import Router from "vue-router";
Vue.use(Router);
import Home from "../pages/Home.vue";
import Enterprise from "../pages/Enterprise.vue";
import About from "../pages/About.vue";
import UserIndexPage from "../pages/users/UserIndexPage.vue";
import UserNewPage from "../pages/users/UserNewPage.vue";
import ProjectNewPage from "../pages/projects/ProjectNewPage.vue";
import ProjectIndexPage from "../pages/projects/ProjectIndexPage.vue";
import ProjectEditPage from "../pages/projects/ProjectEditPage.vue";
import ProjectDetailPage from "../pages/projects/ProjectDetailPage.vue";

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
    {
      path: '/projects/new',
      component: ProjectNewPage,
    },
    {
      path: '/projects/',
      component: ProjectIndexPage,
    },
    {
      path: '/projects/edit',
      name: 'ProjectEditPage',
      component: ProjectEditPage,
    },
    {
      path: '/projects/detail',
      name: 'ProjectDetailPage',
      component: ProjectDetailPage,
    },
  ],
});
export default router;
