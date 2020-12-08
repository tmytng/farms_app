import Vue from "vue";
import Router from "vue-router";
Vue.use(Router);
import Home from "../pages/Home.vue";
import Enterprise from "../pages/Enterprise.vue";
import About from "../pages/About.vue";
import UserIndexPage from "../pages/users/UserIndexPage.vue";
import UserNewPage from "../pages/users/UserNewPage.vue";
import UserEditPage from "../pages/users/UserEditPage.vue";
import UserDetailPage from "../pages/users/UserDetailPage.vue";
import ProjectIndexPage from "../pages/projects/ProjectIndexPage.vue";
import ProjectNewPage from "../pages/projects/ProjectNewPage.vue";
import ProjectEditPage from "../pages/projects/ProjectEditPage.vue";
import ProjectDetailPage from "../pages/projects/ProjectDetailPage.vue";

const router = new Router({
  mode: "history",
  routes:
  [
    { path: '/',                    name: 'Home',               component: Home },
    { path: '/enterprise',          name: 'EnterprisePage',     component: Enterprise },
    { path: '/about',               name: 'AboutPage',          component: About },
    { path: '/users/',              name: 'UserIndexPage',      component: UserIndexPage },
    { path: '/users/new',           name: 'UserNewPage',        component: UserNewPage },
    { path: '/users/edit',          name: 'UserEditPage',       component: UserEditPage },
    { path: '/users/:id(\\d+)',     name: 'UserDetailPage',     component: UserDetailPage },
    { path: '/projects/',           name: 'ProjectIndexPage',   component: ProjectIndexPage },
    { path: '/projects/new',        name: 'ProjectNewPage',     component: ProjectNewPage },
    { path: '/projects/edit',       name: 'ProjectEditPage',    component: ProjectEditPage },
    { path: '/projects/:id(\\d+)',  name: 'ProjectDetailPage',  component: ProjectDetailPage },
  ],
});

export default router;
