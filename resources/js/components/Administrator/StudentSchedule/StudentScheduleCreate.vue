<template>

    <div>
        <div class="section">
            <div class="columns">
                <div class="column is-6 is-offset-3">
                    <div class="box">
                        <form @submit.prevent="submit">

                            <h1 class="title is-5">CREATE STUDENT SCHEDULE</h1>

                            <div class="columns">
                                <div class="column">
                                    <modal-schedule :prop-desc="schedule.description" @description="emitSchedule($event)"></modal-schedule>
                                </div>
                            </div>

                            <div class="columns">
                                <div class="column">
                                    <modal-browse-student :prop-name="student.fullname" @student="emitStudent($event)"></modal-browse-student>
                                </div>
                            </div>

                            <div class="buttons is-right">
                                <button class="button is-success">SUBMIT</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>


    </div><!--root-->
</template>

<script>
export default {

    // props:{
    //     dataAcademics:{
    //         type: String,
    //         default: '',
    //     }
    // },

    data(){
        return{
            fields: {
                test_schedule_id: null,
                user_id: null,
            },
            errors: {},
            schedule: {},
            student: {},
            sched_from: null,
            sched_to: null,
            hourFormat: '12',

            academicyears: [],

            isModalSchedule: false,
            isModalUser: false,
        }
    },
    methods: {
        submit(){
            axios.post('/panel/student-schedule', this.fields).then(res=>{
                if(res.data.status === 'saved'){
                    this.$buefy.dialog.alert({
                        title: 'SAVED!',
                        message: 'Successfully saved.',
                        type: 'is-success',
                        onConfirm: ()=> window.location = '/panel/student-schedule'
                    });
                }
            }).catch(err=>{
                if(err.response.status === 422){
                    this.errors = err.response.data.errors;
                }
            })
        },



        emitSchedule: function(data){
            this.schedule = data;
            this.fields.test_schedule_id = data.test_schedule_id;

        },

        emitStudent: function(data){
            this.student = data;
            this.student.fullname = data.lname + ', ' + data.fname + ' ' + data.mname;
            this.fields.user_id = data.user_id;
        },

        loadSchedules: function(){
            axios.get('/fetch-studen-schedules').then(res=>{

            })
        },

        loadUsers: function(){
            axios.get('/fetch-users').then(res=>{

            })
        },


        initData(){
           // this.academicyears = JSON.parse(this.dataAcademics);

        }

    },

    mounted(){
        this.initData();
    }
}
</script>

<style scoped>
    .box{
        border-top: 4px solid blueviolet;
    }
</style>
