<template>

    <div>
        <div class="section">

            <div class="columns">
                <div class="column is-8 is-offset-2">
                    <div class="box">
                        <form @submit.prevent="submit">

                            <h1 class="title is-5">CREATE SCHEDULE</h1>

                            <div class="columns">
                                <div class="column">
                                    <b-field label="Academic Year"
                                        :type="this.errors.acad_year_id ? 'is-danger' : ''"
                                        :message="this.errors.acad_year_id ? this.errors.acad_year_id[0] : ''">
                                        <b-select v-model="fields.acad_year_id" placeholder="Academic Year">
                                            <option :value="item.acad_year_id" v-for="(item, index) in this.academicyears" :key="index">{{ item.code }} - {{ item.description }}</option>
                                        </b-select>
                                    </b-field>
                                </div>

                                <div class="column">
                                    <b-field label="Max per schedule"
                                        :type="this.errors.max_user ? 'is-danger' : ''"
                                        :message="this.errors.max_user ? this.errors.max_user[0] : ''">
                                        <b-input type="number" v-model="fields.max_user"
                                             oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" maxlength="4"></b-input>
                                    </b-field>
                                </div>
                            </div>

                            <div class="columns">
                                <div class="column">
                                    <b-field label="Description"
                                        :type="this.errors.description ? 'is-danger' : ''"
                                        :message="this.errors.description ? this.errors.description[0] : ''">
                                        <b-input type="text" v-model="fields.description" placeholder="Description" required>
                                        </b-input>
                                    </b-field>
                                </div>
                            </div>

                            <div class="columns">
                                <div class="column">
                                    <b-field label="Schedule From"
                                        :type="this.errors.from ? 'is-danger' : ''"
                                        :message="this.errors.from ? this.errors.from[0] : ''">
                                        <b-datetimepicker 
                                            placeholder="Click to select..."
                                            icon="calendar-today"
                                            v-model="sched_from" 
                                            @input="formattedFromDate"
                                            :timepicker="{ hourFormat }"></b-datetimepicker>
                                    </b-field>

                                    <b-field label="Schedule To"
                                        :type="this.errors.to ? 'is-danger' : ''"
                                        :message="this.errors.to ? this.errors.to[0] : ''">
                                        <b-datetimepicker 
                                            placeholder="Click to select..."
                                            icon="calendar-today"
                                            v-model="sched_to" 
                                            @input="formattedToDate"
                                            :timepicker="{ hourFormat }"></b-datetimepicker>
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
        },
        edit:{
            type: String,
            default: '',
        },
        

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

            editData: null,
        
        }
    },
    methods: {
        submit(){
            axios.put('/panel/test-schedule/' + this.fields.test_schedule_id, this.fields).then(res=>{
                if(res.data.status === 'updated'){
                    this.$buefy.dialog.alert({
                        title: 'UPDATED!',
                        message: 'Successfully updated.',
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

        


        initData(){
            this.academicyears = JSON.parse(this.dataAcademics);
            this.fields = JSON.parse(this.edit);
            //this.editData = JSON.parse(this.edit);
            this.sched_from = new Date(this.fields.from);
            this.sched_to = new Date(this.fields.to);

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