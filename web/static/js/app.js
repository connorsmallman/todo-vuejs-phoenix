import Vue from 'vue'
import store from './store'
import App from './components/App.vue'

new Vue({
  store, // inject store to all children
  el: '#babyTodoApp',
  render: h => h(App)
})
