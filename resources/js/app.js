/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

 window.Vue = require('vue').default;
 window.axios = require('axios');


 import Vue from 'vue';
 //import VueRouter from 'vue-router'
 import Buefy from 'buefy';


/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

Vue.component('example-component', require('./components/ExampleComponent.vue').default);

Vue.component('csrf', require('./components/Csrf.vue').default);
Vue.component('student-login-page', require('./components/Student/StudentLoginPaga.vue').default);


//STUDENT
Vue.component('student-navbar', require('./components/Student/StudentNavbar.vue').default);

Vue.component('home-page', require('./components/Student/HomePage.vue').default);

//ADMINISTRATOR
Vue.component('panel-login', require('./components/Administrator/PanelLogin.vue').default);
Vue.component('panel-home', require('./components/Administrator/PanelHome.vue').default);
Vue.component('admin-navbar', require('./components/Administrator/AdminNavbar.vue').default);

Vue.component('panel-question', require('./components/Administrator/Question/PanelQuestion.vue').default);
Vue.component('panel-question-create', require('./components/Administrator/Question/PanelQuestionCreate.vue').default);

Vue.component('panel-section', require('./components/Administrator/Section/SectionPanel.vue').default);


/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

Vue.use(Buefy);

Vue.filter('formatTime', function(value) {
    var timeString = value;
    var H = +timeString.substr(0, 2);
    var h = (H % 12) || 12;
    var ampm = H < 12 ? " AM" : " PM";
    timeString = h + timeString.substr(2, 3) + ampm;
    return timeString;
});


const app = new Vue({
    el: '#app',
});
