<template>
    <div>
        <div class="section">
            <div class="container">
                <div class="columns">
                    <div class="column is-10 is-offset-1">
                        <form @submit.prevent="submit">
                            <div class="box">
                                <div class="title is-5">
                                    REGISTRATION FORM
                                </div>

                                <b-notification class="is-success is-light">
                                    Please use working and valid email address for faster verification.
                                </b-notification>

                                <div>
                                    <h2><span>ACCOUNT INFORMATION</span></h2>
                                    <div class="columns">
                                        <div class="column">
                                            <b-field label="Username" label-position="on-border"
                                                :type="this.errors.username ? 'is-danger' : ''"
                                                :message="this.errors.username ? this.errors.username : ''">
                                                <b-input type="text" placeholder="Username" v-model="fields.username"  />
                                            </b-field>
                                        </div>
                                    </div>
                                    
                                    <div class="columns">
                                        <div class="column">
                                            <b-field label="Password" label-position="on-border"
                                                :type="this.errors.password ? 'is-danger' : ''"
                                                :message="this.errors.password ? this.errors.password : ''">
                                                <b-input type="password" password-reveal placeholder="Password" v-model="fields.password"  />
                                            </b-field>
                                        </div>
                                         <div class="column">
                                            <b-field label="Re-type Password" label-position="on-border"
                                                :type="this.errors.password ? 'is-danger' : ''"
                                                :message="this.errors.password ? this.errors.password : ''">
                                                <b-input type="password" password-reveal placeholder="Re-type Password" v-model="fields.password_confirmation"  />
                                            </b-field>
                                        </div>
                                    </div>

                                    <h2><span>PERSONAL INFORMATION</span></h2>
                                   
                                    <div class="columns">
                                        <div class="column">
                                            <b-field label="Lastname" label-position="on-border"
                                                     :type="this.errors.lname ? 'is-danger' : ''"
                                                     :message="this.errors.lname ? this.errors.lname : ''">
                                                <b-input type="text" placeholder="Lastname" v-model="fields.lname" required/>
                                            </b-field>
                                        </div>
                                        <div class="column">
                                            <b-field label="Firstname" label-position="on-border"
                                                     :type="this.errors.fname ? 'is-danger' : ''"
                                                     :message="this.errors.fname ? this.errors.fname : ''">
                                                <b-input type="text" placeholder="Firstname" v-model="fields.fname" required />
                                            </b-field>
                                        </div>
                                    </div>

                                    <div class="columns">
                                        <div class="column">
                                            <b-field label="Middlename" label-position="on-border">
                                                <b-input type="text" v-model="fields.mname" placeholder="Middlename" />
                                            </b-field>
                                        </div>

                                        <div class="column">
                                            <b-field label="Sex" label-position="on-border" expanded
                                                     :type="this.errors.sex ? 'is-danger' : ''"
                                                     :message="this.errors.sex ? this.errors.sex : ''">
                                                <b-select placeholder="Sex" v-model="fields.sex" expanded required>
                                                    <option value="MALE">MALE</option>
                                                    <option value="FEMALE">FEMALE</option>
                                                </b-select>
                                            </b-field>
                                        </div>

                                        <div class="column">
                                            <b-field label="Category" label-position="on-border" expanded
                                                     :type="this.errors.status ? 'is-danger' : ''"
                                                     :message="this.errors.status ? this.errors.status : ''">
                                                <b-select placeholder="Category" v-model="fields.status" expanded required>
                                                    <option value="NEW">NEW</option>
                                                    <option value="RETURNEE">RETURNEE</option>
                                                    <option value="TRANSFEREE">TRANSFEREE</option>
                                                </b-select>
                                            </b-field>
                                        </div>
                                    </div>

                                    <div class="columns">
                                        <div class="column">
                                            <b-field label="Birthdate" label-position="on-border"
                                                     :type="this.errors.bdate ? 'is-danger' : ''"
                                                     :message="this.errors.bdate ? this.errors.bdate : ''">
                                                <b-datepicker placeholder="Birthdate" v-model="bdate"
                                                              @input="formattedDate" required trap-focus/>
                                            </b-field>
                                        </div>
                                        <div class="column">
                                            <b-field label="Birthplace" label-position="on-border">
                                                <b-input type="text" placeholder="Birthplace" v-model="fields.birthplace" required />
                                            </b-field>
                                        </div>
                                    </div>

                                    <h2><span>PROGRAM INFORMATION</span></h2>
                                    <div class="columns">
                                        <div class="column">
                                            <b-field label="1st Program Choice" label-position="on-border" 
                                                :type="this.errors.first_program_choice ? 'is-danger' : ''"
                                                :message="this.errors.first_program_choice ? this.errors.first_program_choice : ''" expanded>
                                                <b-select placeholder="1st program choice" v-model="fields.first_program_choice" required expanded>
                                                    <option :value="item.CCode" v-for="(item, index) in this.programs" :key="index">{{ item.CDesc }} ({{ item.CCode }})</option>
                                                </b-select>
                                            </b-field>
                                        </div>
                                        <div class="column">
                                            <b-field label="2nd Program Choice" label-position="on-border" expanded
                                                :type="this.errors.second_program_choice ? 'is-danger' : ''"
                                                :message="this.errors.second_program_choice ? this.errors.second_program_choice : ''">
                                                <b-select placeholder="2nd program choice" v-model="fields.second_program_choice" required expanded>
                                                    <option :value="item.CCode" v-for="(item, index) in this.programs" :key="index">{{ item.CDesc }} ({{ item.CCode }})</option>
                                                </b-select>
                                            </b-field>
                                        </div>
                                    </div>

                                    <div class="columns">
                                        <div class="column">
                                            <b-field label="Mode of Learning" label-position="on-border" expanded
                                                :type="this.errors.learning_mode ? 'is-danger' : ''"
                                                :message="this.errors.learning_mode ? this.errors.learning_mode : ''">
                                                <b-select placeholder="Mode of Learning" v-model="fields.learning_mode" required expanded>
                                                    <option :value="item.learning_mode" v-for="(item, index) in this.learningModes" :key="index">{{ item.learning_mode }} - {{ item.learning_desc }}</option>
                                                </b-select>
                                            </b-field>
                                        </div>
                                    </div>

                                    <h2><span>CONTACT INFORMATION</span></h2>

                                    <div class="columns">
                                        <div class="column">
                                            <b-field label="Contact No." label-position="on-border">
                                                <b-input type="text" placeholder="Contact No." v-model="fields.contact_no" required />
                                            </b-field>
                                        </div>
                                        <div class="column">
                                            <b-field label="Email" label-position="on-border">
                                                <b-input type="email" placeholder="Email" v-model="fields.email" required />
                                            </b-field>
                                        </div>
                                    </div>

                                    <h2><span>LAST SCHOOL INFORMATION</span></h2>

                                    <div class="columns">
                                        <div class="column">
                                            <b-field label="Last School Attended" label-position="on-border"
                                                     :type="this.errors.last_school_attended ? 'is-danger' : ''"
                                                     :message="this.errors.last_school_attended ? this.errors.last_school_attended : ''">
                                                <b-input type="text" placeholder="Last School Attended" v-model="fields.last_school_attended" required />
                                            </b-field>
                                        </div>
                                    </div>

                                    <h2><span>ADDRESS INFORMATION</span></h2>

                                    <div class="columns">
                                        <div class="column">
                                            <b-field label="Province" label-position="on-border" expanded
                                                     :type="this.errors.last_school_attended ? 'is-danger' : ''"
                                                     :message="this.errors.last_school_attended ? this.errors.last_school_attended : ''">
                                                <b-select placeholder="PROVINCE" v-model="fields.province"
                                                          @input="loadCities"
                                                          expanded required>
                                                    <option v-for="(prov, index) in this.provinces" :key="index" :value="prov.Prov_Name">{{ prov.Prov_Name }}</option>
                                                </b-select>
                                            </b-field>
                                        </div>
                                        <div class="column">
                                            <b-field label="City/Municipality" label-position="on-border" expanded>
                                                <b-select placeholder="CITY/MUNICIPALITY" v-model="fields.city"
                                                          @input="loadBarangays" expanded required>
                                                    <option v-for="(city, index) in this.cities" :key="index" :value="city.City_Name">{{ city.City_Name }}</option>
                                                </b-select>
                                            </b-field>
                                        </div>
                                    </div>

                                    <div class="columns">
                                        <div class="column">
                                            <b-field label="Barangay" label-position="on-border" expanded>
                                                <b-select placeholder="BARANGAY" v-model="fields.barangay" expanded required>
                                                    <option v-for="(brgy, index) in this.barangays" :key="index" :value="{barangay_id: brgy.Brgy_ID, barangay: brgy.Bgry_Name}">{{ brgy.Bgry_Name }}</option>
                                                </b-select>
                                            </b-field>
                                        </div>
                                        <div class="column">
                                            <b-field label="Purok/Street" label-position="on-border" expanded>
                                                <b-input type="text" placeholder="PUROK/STREET" v-model="fields.street" />
                                            </b-field>
                                        </div>
                                    </div>


                                    <div class="buttons is-right">
                                        <button :class="btnClass"><b-icon pack="fa" icon="arrow-right"></b-icon>
                                            &nbsp;&nbsp;REGISTER NOW
                                        </button>
                                    </div>
                                </div>
                            </div><!--close box-->
                        </form>
                    </div>
                </div>
            </div>


        </div>
    </div>
</template>

<script>
export default {

    props:{
        dataPrograms:{
            type: String,
            default: '',
        },
        propLearningModes: {
            type: String,
            default: '',
        }
    },

    data(){
        return{
            fields:{
                username: '',
                lname: '',
                fname: '',
                mname: '',
                sex: '',
                bdate: '',
                birthplace: '',
                contact_no: '',
                email: '',
                first_program_choice: '',
                second_program_choice: '',
                last_school_attended: '',
                province: '',
                city: '',
                barangay: '',
                barangay_id: '',
                street: '',
                password: '',
            },
            errors: {},
            bdate: null,

            btnClass:{
                'button': true,
                'is-loading': false,
                'is-primary': true,
                'is-outlined': true,
            },

            provinces: [],
            cities: [],
            barangays: [],
            programs: [],
            learningModes: [],


        }
    },
    methods:{

        loadProvinces: function(){
            axios.get('/provinces').then(res=>{
                this.provinces = res.data;
                this.loadCities()
            });
        },

        loadCities: function(){
            axios.get('/cities?province='+this.fields.province).then(res=>{
                this.cities = res.data;
            });
        },

        loadBarangays: function(){
            axios.get('/barangays?province='+this.fields.province+'&city='+this.fields.city).then(res=>{
                this.barangays = res.data;
            });
        },

        formattedDate(){
            let mydate = new Date(Date.parse(this.bdate));
            let realDate = mydate.getFullYear() + "-" + ("0" + (mydate.getMonth() + 1)).slice(-2) + "-"+ ("0" + (mydate.getDate())).slice(-2);
            this.fields.bdate = realDate;
            // let dateoptions = {year:'numeric', month:'short', day:'numeric'};
            // return dt.toLocaleDateString('en-GB', dateoptions);
        },

        submit: function(){
            this.btnClass['is-loading'] = true;

            axios.post('/register', this.fields).then(res=>{
                console.log(res);
                window.location = '/home'
                // if(res.data.status === 'saved'){
                //     this.$buefy.dialog.alert({
                //         title: 'REGISTERED!',
                //         message: 'Account successfully registered. You can login now.',
                //         type: 'is-success',
                //         onConfirm: ()=> 
                //     });
                //     this.btnClass['is-loading'] = false;
                // }
                this.btnClass['is-loading'] = false;
            }).catch(err=>{
                this.errors = err.response.data.errors;
                //console.log(err.response.data)
                 this.btnClass['is-loading'] = false;

                 if(err.response.status === 500){
                     this.btnClass['is-loading'] = false;
                 }
            })
        },

        initData: function(){
            this.programs = JSON.parse(this.dataPrograms);
            this.learningModes = JSON.parse(this.propLearningModes);
            //console.log(this.propLearningModes);
        }

    },

    mounted() {
        this.loadProvinces();
        this.initData();
    }
}

</script>

<style scoped>
    .box{
        border-top: 5px solid green;
    }

    h2 {
        width: 100%;
        text-align: center;
        border-bottom: 1px solid #000;
        line-height: 0.1em;
        margin: 10px 0 20px;
    }

    h2 span {
        background:#fff;
        padding:0 10px;
    }

</style>
