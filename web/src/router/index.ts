import { createRouter, createWebHashHistory, RouteRecordRaw } from 'vue-router'

const routes: Array<RouteRecordRaw> = [
  {
    path: '/',
    name: 'index',
    component: () => import('../views/user/UserHome.vue')
  },
  {
    path: '/user',
    name: 'user',
    component: () => import('../views/user/UserHome.vue')
  },
  {
    path: '/game',
    name: 'game',
    component: () => import('../views/user/GameView.vue')
  }
]

const router = createRouter({
  history: createWebHashHistory(),
  routes
})

export default router;