import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router'
import Home from '../views/home.vue'
import About from '../views/about.vue'
import AdminEbook from '../views/admin/admin-ebook.vue'
import AdminCategory from '../views/admin/admin-category.vue'
import AdminDoc from '../views/admin/admin-doc.vue'
import Doc from '../views/doc.vue'

const routes: Array<RouteRecordRaw> = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/about',
    name: 'About',
    component: About
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    // component: () => import(/* webpackChunkName: "about" */ '../views/about.vue')
  },
  {
    path: '/admin/ebook',
    name: 'AdminEbook',
    component: AdminEbook
  },
  {
    path: '/admin/category',
    name: 'AdminCategory',
    component: AdminCategory
  },
  {
    path: '/admin/doc',
    name: 'AdminDoc',
    component: AdminDoc
  },
  {
    path: '/doc',
    name: 'Doc',
    component: Doc
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
