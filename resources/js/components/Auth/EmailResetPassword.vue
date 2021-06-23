<template>
    <div><!--root-->
        <div class="section">
            <div class="columns">
                <div class="column is-6 is-offset-3">

                    <div class="box">
                        <div class="box-nav">
                            <a href="/">GO BACK</a>
                        </div>


                        <div class="title is-5">Reset Password</div>

                        <b-notification v-if="message" class="is-success is-light">
                            {{ message }}
                        </b-notification>
                        <div class="">
                            <form @submit.prevent="sendPasswordResetLink">
                                <b-field label="Email Address"
                                    :type="this.errors.email ? 'is-danger' : ''"
                                    :message="this.errors.email ? this.errors.email[0] : ''">
                                    <b-input type="email" placeholder="Your registered email address..." v-model="fields.email"></b-input>
                                </b-field>

                                <div class="buttons">
                                    <button :class="btnClass">SEND PASSWORD RESET LINK</button>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div><!--root-->
</template>

<script>
export default {
    data(){
        return{
            fields: {},
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
        sendPasswordResetLink(){
            this.btnClass['is-loading'] = true;
            axios.post('/password/email', this.fields).then(res=>{
                //console.log(res.data.message);
                this.message = res.data.message;
                this.btnClass['is-loading'] = false;
            }).catch(err=>{
                if(err.response.status === 422){
                    this.errors = err.response.data.errors;
                }
                this.btnClass['is-loading'] = false;
            });
        }
    }
}
</script>

<style scoped>
    .box{
        border-top: 3px solid green;
    }

    .box-nav{
        display: flex;
        justify-content: flex-end;
        border-bottom: 1px solid rgb(226, 226, 226);
        margin: 10px 0;
        margin-top: -15px;
        padding: 5px 0;
    }
</style>
