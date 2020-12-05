import Vue from 'vue'
import UserIndex from '../../users/index.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(UserIndex)
  }).$mount()
  document.body.appendChild(app.$el)
})
