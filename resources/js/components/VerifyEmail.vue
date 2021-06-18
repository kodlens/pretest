<template>
    <div>
        <div class="section">
            <div class="columns">
                <div class="column is-6 is-offset-3">
                    <div class="box" style="border-top: 3px solid green;">
                        <div class="title is-5">Verify Your Email Address</div>
                        <div>
                
                                <b-notification v-if="resend" class="is-success">
                                    A fresh verification link has been sent to your email address.
                                </b-notification>
                    

                            <div>Before proceeding, please check your email for a verification link. If you did not receive the email, click button below.</div>
                            <hr>
                            <form @submit.prevent="verificationResend">
                                <div class="buttons is-right mt-3">
                                    <button :class="btnClass">RESEND VERIFICATION LINK</button>.
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            
    </div>
</template>

<script>
export default {    
    data(){
        return{
            resend: false,

            btnClass:{
                'is-loading': false,
                'button': true,
                'is-success': true,
            }
        }
    },

    methods: {
        verificationResend: function(){
            this.btnClass['is-loading'] = true;
            axios.post('/email/resend').then(res=>{
                this.resend = true;
                this.btnClass['is-loading'] = false;
            })
            this.btnClass['is-loading'] = false;
        }
    }
}
</script>