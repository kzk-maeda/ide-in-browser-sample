import Vue from 'vue/dist/vue.esm'
import ActionCable from 'actioncable'
import Xterm from './components/xterm.vue'
import Header from './components/header.vue'
import Editor from './components/editor.vue'

Vue.config.devtools = true;

const cable = ActionCable.createConsumer('ws:localhost:3000/socket')
Vue.prototype.$cable = cable

var app = new Vue({
    el: '#app',
    components: {
        'xterm': Xterm,
        'header-bar': Header,
        'ace-editor': Editor
    },
})

