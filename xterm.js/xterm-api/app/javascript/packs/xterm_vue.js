import Vue from 'vue/dist/vue.esm'
import Xterm from './components/xterm.vue'
import Header from './components/header.vue'

var app = new Vue({
    el: '#app',
    components: {
        'xterm': Xterm,
        'header-bar': Header
    }
})

