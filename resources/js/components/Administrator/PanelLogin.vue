<template>
    <div>
        <div class="hero is-fullheight">
            <div class="hero-body">
                <div class="container">
                    <div class="columns">
                        <div class="column is-6-desktop is-offset-3-desktop is-8-tablet is-offset-2-tablet">
                            <div class="panel is-primary">
                                <div class="panel-heading">
                                    PANEL LOGIN HERE
                                </div>
                                <form @submit.prevent="submit">
                                    <div class="panel-body">
                                        <b-field label="Username">
                                            <b-input type="text" v-model="fields.username" placeholder="Username" required></b-input>
                                        </b-field>

                                        <b-field label="Password">
                                            <b-input type="password" v-model="fields.password" password-reveal placeholder="Password" required></b-input>
                                        </b-field>

                                        <div v-if="this.errors.username" style="margin-bottom: 10px;">
                                            <span style="color:red; font-weight: bold;">{{this.errors.username[0]}}</span>
                                        </div>


                                        <div :class="btnClass">
                                            <button class="button is-primary">LOGIN</button>
                                        </div>

                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div><!--container-->
            </div>
        </div>
    </div><!--root div-->
</template>

<script>
export default{
    data(){
        return{
            fields: {},
            errors: {},

            btnClass: {
                'button': true,
                'is-primary': true,
                'is-loading': false,
            }
        }
    },

    methods: {
        submit(){
            this.btnClass['is-loading'] = true;

            axios.post('/panel/login', this.fields).then(res=>{
                this.fields = {};
                this.btnClass['is-loading'] = false;
                window.location = '/panel/home';

            }).catch(error=>{
                this.btnClass['is-loading'] = false;
                if(error.response.status === 422){
                    this.errors = error.response.data.errors;
                }
            });
        }
    }
}
</script>
<style scoped>
.panel-body{
    padding: 15px;
}
</style>
