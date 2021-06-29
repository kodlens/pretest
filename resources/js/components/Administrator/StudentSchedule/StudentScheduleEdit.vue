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
                                    <modal-schedule :prop-desc="description" @description="emitSchedule($event)"></modal-schedule>
                                </div>
                            </div>

                            <div class="columns">
                                <div class="column">
                                    <modal-browse-student :prop-name="fullname" @student="emitStudent($event)"></modal-browse-student>
                                </div>
                            </div>

                            <div class="buttons is-right">
                                <button class="button is-success">UPDATE</button>
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

    props:{
        propStudentSchedule:{
            type: String,
            default: '',
        }
    },

    data(){
        return{
            fields: {

                test_schedule_id: null,
                user_id: null,
            },

            errors: {},
            description: '',
            fullname: '',
            schedule: {},
            globalId: 0,
        }
    },
    methods: {
        submit(){
            axios.put('/panel/student-schedule/' + this.globalId, this.fields).then(res=>{
                if(res.data.status === 'updated'){
                    this.$buefy.dialog.alert({
                        title: 'UPDATED!',
                        message: 'Successfully updated.',
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
            this.description = data.description;
            this.fields.test_schedule_id = data.test_schedule_id;
        },

        emitStudent: function(data){
            this.fullname = data.lname + ', ' + data.fname + ' ' + data.mname;
            this.fields.user_id = data.user_id;
        },

        initData(){
            // this.academicyears = JSON.parse(this.dataAcademics);
            this.schedule = JSON.parse(this.propStudentSchedule);
            this.fullname = this.schedule[0].lname + ', ' + this.schedule[0].fname + ' ' + this.schedule[0].mname;
            this.description = this.schedule[0].description;

            this.fields.test_schedule_id = this.schedule[0].test_schedule_id;
            this.fields.user_id = this.schedule[0].user_id;
            this.globalId = this.schedule[0].student_schedule_id;
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
