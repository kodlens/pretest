<template>
    <div>
        <div class="hero is-fullheight-with-navbar">
            <div class="hero-body">
                <div class="container">

                    <div class="columns">
                        <div class="column is-6 is-offset-3">
                            <div class="box">
                                <h1 class="title is-5">GADTEST SCHEDULE</h1><hr>

                                <b-notification v-if="isNotScheduled == 1"
                                    type="is-danger"
                                    aria-close-label="Close notification"
                                    role="alert">
                                    Sorry, it is not yet your schedule. You may take the test only by the system generated schedule below.
                                </b-notification>

                                <b-notification v-if="alreadyVisitedSection.trim() == 'visited'"
                                    type="is-danger is-light"
                                    aria-close-label="Close notification"
                                    role="alert">
                                    Entering twice is prohibited.
                                </b-notification>

                                <b-notification v-if="isExist.trim() == 'exist'"
                                                type="is-danger is-light"
                                                aria-close-label="Close notification"
                                                role="alert">
                                    You already have test records.
                                </b-notification>

                                <p v-if="schedules" style="text-align:center;">Your schedule is on {{ scheduleNiya }}</p>
                                <p v-else style="text-align:center;">To take the test, you must request a schedule first.</p>

                                <div class="instruction">
                                    <p class="title is-5">ADMISSION TEST DIRECTIONS</p>
                                    <ul>
                                        <li>1. You will  take  five (5) sets of  tests; each consists of 18 - item multiple choice test.</li>
                                        <li>2. You will take a total of 90  test items randomly generated from our system.</li>
                                        <li>3. You are only given 10 minutes to finish each set of tests.</li>
                                        <li>4. Once you click each set, the timer will immediately start; you can find it at the bottom right of the screen; avoid clicking back without submitting the test.</li>
                                        <li>5. Answer each set of tests and click submit.</li>
                                        <li>6. After submitting, proceed to the next test.</li>
                                        <li>7. If done, wait for the admission results to be sent to your respective e-mail address.</li>
                                    </ul>

                                </div>


                                <div v-if="schedules" class="buttons is-centered mt-5">
                                    <b-button @click="proceedNext" class="button is-primary is-outlined">
                                        <b-icon pack="fa" icon="arrow-right"></b-icon> &nbsp;&nbsp;NEXT
                                    </b-button>

                                    <form id="section-form" method="POST" action="/section">
                                        <csrf></csrf>
                                        <input type="hidden" id="schedule_id" name="student_schedule_id" readonly :value="this.schedules.student_schedule_id"></input>
                                    </form>
                                </div>

                                <div v-else class="buttons mt-5 is-centered">
                                    <button  @click="requestSchedule" :class="btnClass">REQUEST SCHEDULE</button>
                                </div>



                               <b-loading :is-full-page="false" v-model="isLoading" :can-cancel="true"></b-loading>
                            </div>
                        </div>
                    </div>


                    <!-- <div class="columns">
                        <div class="column is-8 is-offset-2">

                            <b-notification v-if="isTaken == 1"
                                type="is-danger"
                                aria-close-label="Close notification"
                                role="alert">
                                You already taken the test.
                            </b-notification>

                            <div class="horizontal-word">
                                <span>PLEASE READ ME!</span>
                            </div>
                            <div class="instruction">

                                <p>Good day our dear freshmen! You are about to take the GADTC Admission Test (GADTest).
                                    This is a 90 item test that you should take for only 45 minutes.
                                    A timer is found at the bottom for your reference.
                                    Rest assured all information that you will input in the test will be kept confidential.
                                    If you are ready, click the button below.
                                </p>

                            </div>
                            <div class="buttons is-centered">
                                <a href="/section" class="button is-primary is-outlined">
                                    <b-icon pack="fa" icon="arrow-right"></b-icon> &nbsp;&nbsp;NEXT
                                </a>
                            </div>
                        </div>
                    </div> -->


                </div>
            </div>
        </div>
    </div>
</template>

<script>

export default {
    props: ['isNotScheduled', 'alreadyVisitedSection', 'isExist'],

    data() {
        return {

            btnClass:{
                'button': true,
                'is-success': true,
                'is-outlined': true,
                'is-loading': false,
            },

            isLoading: false,

            schedules: {
                from: null,
            },

        }
    },

    methods: {
        requestSchedule: function(){
            this.btnClass['is-loading'] = true;

            axios.post('/set-schedule').then(res=>{
                console.log(res.data);
                if(res.data.status === 'full'){
                    this.$buefy.dialog.alert({
                        title: 'NO SCHEDULE!',
                        message: 'Sorry, no schedule found.',
                        type: 'is-danger',
                    });
                     this.btnClass['is-loading'] = false;
                }
                if(res.data.status === 'scheduled'){
                    this.$buefy.dialog.alert({
                        title: 'ALREADY SCHEDULED!',
                        message: 'You already have a schedule.',
                        type: 'is-danger',
                    });
                     this.btnClass['is-loading'] = false;
                }
                if(res.data.status === 'schedule'){
                    this.$buefy.dialog.alert({
                        title: 'SCHEDULED!',
                        message: 'You are successfully scheduled on ' + this.formatSchedFromDate(res.data.schedfrom),
                        type: 'is-success',
                        onConfirm: ()=> this.getSchedule()
                    });
                     this.btnClass['is-loading'] = false;
                }
                if(res.data.status === 'no_schedule'){
                    this.$buefy.dialog.alert({
                        title: 'NO SCHEDULE!',
                        message: 'No new schedule found. Maybe admission test is closed.',
                        type: 'is-danger',
                        onConfirm: ()=> this.getSchedule()
                    });
                    this.btnClass['is-loading'] = false;
                }
            }).catch(err=>{
                console.log(err.response);
                 this.btnClass['is-loading'] = false;
            })

            this.btnClass['is-loading'] = false; //activate this for debugging only
        },

        formatSchedFromDate(from){
            //moment().format()
            //console.log(moment.format('Y-m-D'));
            const monthNames = ["January", "February", "March", "April", "May", "June",
                "July", "August", "September", "October", "November", "December"
            ];

            try {
                //non iOS
                let d = new Date(from);
                let hours = d.getHours();
                hours = hours % 12;
                hours = hours ? hours : 12; // the hour '0' should be '12'
                let minute = ('0' + d.getMinutes()).slice(-2);
                let ampm = d.getHours() < 12 ? 'AM' : 'PM';
                let monthname = d.getMonth();
                return monthNames[monthname] + ' ' + d.getDate() + ' ' + d.getFullYear() + ' at exactly ' + hours+':'+minute+' '+ampm;
            }
            catch(err) {
                return from;
            }



        },

        getSchedule: function(){
            this.isLoading = true;
            axios.get('/get-schedule').then(res=>{
                //console.log(res.data[0]);
                this.schedules = res.data[0];
                this.isLoading = false;
            })
        },

        proceedNext: function(){
            let form = document.getElementById('section-form');
            //this.schedules.student_schedule_id = null; //testing only
            if(this.schedules.student_schedule_id){
                form.submit();
            }else{
                alert('Please acquire schedule first. Rest assured you have enough internet connectivity in your area and ' +
                    'kindly reload the page. If still the problem exist, please contact CISO Personnel for this matter.');
            }

        }
    },

    mounted(){
        this.getSchedule();
    },

    computed:{

        scheduleNiya: function(){

            if(this.schedules.from){
                return this.formatSchedFromDate(this.schedules.from);
            }else{
                return '';
            }

        }
    }

}
</script>

<style scoped>
    /*.instruction{*/
    /*    display: flex;*/
    /*    justify-content: center;*/
    /*    text-align: justify;*/
    /*    font-size: 20px;*/
    /*    font-weight: bold;*/
    /*    margin: 15px;*/
    /*    border-bottom: 1px solid darkgreen;*/
    /*    padding: 15px;*/
    /*}*/

    .horizontal-word {
        width: 100%;
        text-align: center;
        border-bottom: 1px solid darkgreen;
        line-height: 0.1em;
        margin: 10px 0 20px;
        font-weight: bold;
    }

    .horizontal-word > span {
        background: #fff;
        padding: 0 10px;
        color: darkgreen;
    }

    .box{
        border-top: 3px solid green;
    }

    .instruction{
        margin-top: 30px;
    }
    .instruction > ul > li{
        font-style: italic;
    }

</style>
