<template>
    <div>
        <div class="hero is-fullheight">
            <div class="hero-body">
                <div class="container">
                    <div class="columns">
                        <div class="column is-6-desktop is-offset-3-desktop is-8-tablet is-offset-2-tablet">
                            <div class="panel is-primary">
                                <div class="panel-heading">
                                    LOGIN HERE
                                </div>
                                <div class="panel-body">

                                    <b-field label="Username">
                                        <b-input type="text" v-model="fields.username" placeholder="Username" required></b-input>
                                    </b-field>

                                    <b-field label="Password">
                                        <b-input type="password" v-model="fields.password" password-reveal placeholder="Password" required></b-input>
                                    </b-field>

                                    <div class="buttons">
                                        <b-button class="is-primary">LOGIN</b-button>
                                    </div>
                                </div>
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
        }
    },

    methods: {

    }
}
</script>
<style scoped>
    .panel-body{
        padding: 15px;
    }
</style>
