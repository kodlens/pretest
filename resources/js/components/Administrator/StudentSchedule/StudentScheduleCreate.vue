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
                                    <modal-schedule></modal-schedule>
                                </div>
                            </div>

                            <div class="columns">
                                <div class="column">
                                    <b-field label="Browse Student"
                                             :type="this.errors.user_id ? 'is-danger' : ''"
                                             :message="this.errors.user_id ? this.errors.user_id[0] : ''">
                                        <b-input type="text" v-model="fields.user_id" placeholder="Browse Schedule" expanded />
                                        <p class="control">
                                            <b-button class="is-primary" @click="isModalUser=true">...</b-button>
                                        </p>
                                    </b-field>
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

    props:{
        dataAcademics:{
            type: String,
            default: '',
        }
    },

    data(){
        return{
            fields: {
                max_user: 30,
            },
            errors: {},

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
            axios.post('/panel/test-schedule', this.fields).then(res=>{
                if(res.data.status === 'saved'){
                    this.$buefy.dialog.alert({
                        title: 'SAVED!',
                        message: 'Successfully saved.',
                        type: 'is-success',
                        onConfirm: ()=> window.location = '/panel/test-schedule'
                    });
                }
            }).catch(err=>{
                if(err.response.status === 422){
                    this.errors = err.response.data.errors;
                }
            })
        },

        formattedFromDate(){
            let ndate = new Date(Date.parse(this.sched_from));
            let realDateTime = ndate.getFullYear() + "-" + ("0" + (ndate.getMonth() + 1)).slice(-2) + "-"+ ("0" + (ndate.getDate())).slice(-2)
                +' ' +("0" + ndate.getHours()).slice(-2) + ':'+ ("0" + ndate.getMinutes()).slice(-2) + ':00';
            console.log(realDateTime);
            this.fields.from = realDateTime;
        },
        formattedToDate(){
            let ndate = new Date(Date.parse(this.sched_to));
            let realDateTime = ndate.getFullYear() + "-" + ("0" + (ndate.getMonth() + 1)).slice(-2) + "-"+ ("0" + (ndate.getDate())).slice(-2)
                +' ' +("0" + ndate.getHours()).slice(-2) + ':'+ ("0" + ndate.getMinutes()).slice(-2) + ':00';
            console.log(realDateTime);
            this.fields.to = realDateTime;
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
            this.academicyears = JSON.parse(this.dataAcademics);

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
