import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import mintUl from 'mint-ui'
import 'mint-ui/lib/style.min.css'

Vue.config.productionTip = false
Vue.use(mintUl);

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
