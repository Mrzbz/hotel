import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import mintUl from 'mint-ui'
import 'mint-ui/lib/style.min.css'
import axios from 'axios'
import qs from 'qs'
import cors from 'cors'


Vue.prototype.axios = axios;
Vue.prototype.qs = qs;
Vue.config.productionTip = false;
axios.defaults.baseURL="http://127.0.0.1:8000"
Vue.use(mintUl);
Vue.use(axios);
Vue.use(qs);


new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
