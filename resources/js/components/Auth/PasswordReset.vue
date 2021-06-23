<template>
    <div>
        <div class="section">
            <div class="columns">
                <div class="column is-6 is-offset-3">
                    <div class="box">

                        <div class="title is-5">Reset Password</div>

                        <b-notification v-if="message" class="is-success is-light">
                            {{ message }}
                        </b-notification>

                        <div class="card-body">
                            <form @submit.prevent="resetPassword">

                                <b-field label="Email Address"
                                    :type="this.errors.email ? 'is-danger' : ''"
                                    :message="this.errors.email ? this.errors.email[0] : ''">
                                    <b-input type="email" placeholder="Email Address" v-model="fields.email" required autocomplete="email" autofocus />
                                </b-field>

                                <b-field label="New Password"
                                    :type="this.errors.password ? 'is-danger' : ''"
                                    :message="this.errors.password ? this.errors.password[0] : ''">
                                    <b-input type="password" password-reveal v-model="fields.password" placeholder="New Password"/>
                                </b-field>

                                <b-field label="Confirm Password"
                                    :type="this.errors.password_confirmation ? 'is-danger' : ''"
                                    :message="this.errors.password_confirmation ? this.errors.password_confirmation[0] : ''">
                                    <b-input type="password" password-reveal v-model="fields.password_confirmation" placeholder="Confirm Password"/>
                                </b-field>

                                <div class="buttons">
                                    <button :class="btnClass">RESET PASSWORD</button>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div><!--root div-->
</template>

<script>
export default {
    props:{
        dataEmail: {
            type: String,
            default: '',
        },
        dataToken: {
            type: String,
            default: '',
        }
    },
    data() {
        return{
            fields: {
                token: '',
                email: '',
                password: '',
            },
            errors: {},

            btnClass: {
                'button': true,
                'is-primary': true,
                'is-loading': false,
            },

            message: '',

        }
    },

    methods: {
        resetPassword: function(){
            this.btnClass['is-loading'] = true;

            axios.post('/password/reset', this.fields).then(res=>{
                if(res.data.message === 'Your password has been reset!'){
                    this.$buefy.dialog.alert({
                        title: 'Success!',
                        message: res.data.message,
                        type: 'is-success',
                        onConfirm: ()=> window.location = '/home'
                    });
                }
                this.btnClass['is-loading'] = false;
            }).catch(err=>{
                if(err.response.status === 422){
                    this.errors = err.response.data.errors;
                }
                this.btnClass['is-loading'] = false;
            });
        },

        initData: function(){
            this.fields.token = this.dataToken;
            this.fields.email = this.dataEmail;
        }
    },

    mounted(){
        this.initData();
    }
}
</script>

<style scoped>
    .box{
        border-top: 3px solid green;
    }
</style>
