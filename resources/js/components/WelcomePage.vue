<template>
    <div>
        <div class="hero is-fullheight-with-navbar">
            <div class="hero-body">
                <div class="container">

                    <div style="display: flex; justify-content: center;">
                        <img src="/img/logo_small.png" alt="..." style="height: 150px;"/>
                    </div>
                    <div class="title is-4 text-center">
                        WELCOME TO GADTest <br>(Online Test for Gov Alfonso D. Tan College Students)
                    </div>

                    <div class="buttons is-centered">
                        <a class="button is-outlined is-primary" href="/login">
                            <b-icon pack="fa" icon="arrow-right"></b-icon>
                            &nbsp; &nbsp;LOGIN NOW
                        </a>&nbsp; OR &nbsp;
                        <a class="button is-outlined is-primary" href="/register">
                            <b-icon pack="fa" icon="user"></b-icon>
                            &nbsp; &nbsp;REGISTER NOW
                        </a>
                    </div>

                    <b-notification class="is-danger" v-if="isReg === false">
                        REGISTRATION IS CLOSED!
                    </b-notification>
                </div>
            </div>
        </div>



    </div><!--root navbar-->

</template>

<script>
export default {
    props: {
        isReg: {
            type: Boolean,
            default: 1,
        }
    }

}

</script>

<style scoped>
    .text-center{
        text-align: center;
    }
</style>

