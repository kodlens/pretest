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
 //import JsonExcel from "vue-json-excel";


//import 'buefy/dist/buefy.css'
//import moment from 'moment';

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

//FOOTER
Vue.component('footer-page', require('./components/FooterPage.vue').default);


//REGISTRATION
Vue.component('registration', require('./components/Registration.vue').default);


//AUTH /////////////AUTH ////////AUTH
Vue.component('email-reset-password', require('./components/Auth/EmailResetPassword.vue').default);


//RESET PASSWORD
Vue.component('password-reset', require('./components/Auth/PasswordReset.vue').default);


//WELCOME PAGE
Vue.component('welcome-page', require('./components/WelcomePage.vue').default);



//-----------------------------//
//ADMINISTRATOR AREA

//ADMINISTRATOR
Vue.component('panel-login', require('./components/Administrator/PanelLogin.vue').default);
Vue.component('panel-home', require('./components/Administrator/PanelHome.vue').default);
Vue.component('admin-navbar', require('./components/Administrator/AdminNavbar.vue').default);

Vue.component('panel-question', require('./components/Administrator/Question/PanelQuestion.vue').default);
Vue.component('panel-question-create', require('./components/Administrator/Question/PanelQuestionCreate.vue').default);


//ACAD YEAR
Vue.component('acad-year', require('./components/Administrator/AcadYear/AcadYear.vue').default);
//Vue.component('test-schedule-create', require('./components/Administrator/TestSchedule/TestScheduleCreate.vue').default);




//SCHEDULES
Vue.component('test-schedule', require('./components/Administrator/TestSchedule/TestSchedule.vue').default);
Vue.component('test-schedule-create', require('./components/Administrator/TestSchedule/TestScheduleCreate.vue').default);
Vue.component('test-schedule-edit', require('./components/Administrator/TestSchedule/TestScheduleEdit.vue').default);

Vue.component('student-schedule', require('./components/Administrator/StudentSchedule/StudentSchedule.vue').default);
Vue.component('student-schedule-create', require('./components/Administrator/StudentSchedule/StudentScheduleCreate.vue').default);
Vue.component('student-schedule-edit', require('./components/Administrator/StudentSchedule/StudentScheduleEdit.vue').default);

//STUDENT SECTION TAKEN
Vue.component('student-section-taken', require('./components/Administrator/StudentSectionTaken/StudentSectionTaken.vue').default);



//MODAL COMPONENT
Vue.component('modal-schedule', require('./components/Administrator/StudentSchedule/Modal/ModalSchedule.vue').default);
Vue.component('modal-browse-student', require('./components/Administrator/StudentSchedule/Modal/ModalBrowseStudent.vue').default);
//Vue.component('modal-users', require('./components/Administrator/StudentSchedule/Modal/ModalUser.vue').default);




//SECTION
Vue.component('panel-section', require('./components/Administrator/Section/SectionPanel.vue').default);


//STUDENT ANSWER
Vue.component('student-answer', require('./components/Administrator/StudentAnswer/StudentAnswer.vue').default);

//STUDENT RESULT (REPORT)
Vue.component('student-result', require('./components/Administrator/StudentResult/StudentResult.vue').default);

//USER
Vue.component('user-page', require('./components/Administrator/User/UserPage.vue').default);
Vue.component('user-page-create', require('./components/Administrator/User/UserPageCreate.vue').default);
Vue.component('user-page-edit', require('./components/Administrator/User/UserPageEdit.vue').default);


//ADMIN REPORT
Vue.component('admit-student', require('./components/Administrator/Admission/AdmitStudent.vue').default);

Vue.component('report-result', require('./components/Administrator/Admission/ReportResult.vue').default);







//STUDENT AREA
//-----------------------------//
//verification email
Vue.component('verify-email', require('./components/VerifyEmail.vue').default);


Vue.component('login-page', require('./components/LoginPaga.vue').default);

//STUDENT
Vue.component('student-navbar', require('./components/Student/StudentNavbar.vue').default);

Vue.component('home-page', require('./components/Student/HomePage.vue').default);
Vue.component('section-page', require('./components/Student/SectionPage.vue').default)

Vue.component('taking-exam', require('./components/Student/TakingExam.vue').default);
Vue.component('result-exam', require('./components/Student/ResultExam.vue').default);


//STUDENT AREA
//-----------------------------//




/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

Vue.use(Buefy);
//Vue.use(JsonExcel);
//Vue.component("downloadExcel", JsonExcel);
//Vue.use(moment);

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
