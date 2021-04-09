
<template>
    <b-navbar class="is-primary">
        <template #brand>
            <b-navbar-item>
                <img
                    src="/img/logo_small.png"
                    alt="Gov. Alfonso D. Tan College"
                >
                <div>
                    <div class="brand-title-desktop">GOV. ALFONSO D. TAN COLLEGE</div>
                    <div class="brand-subtitle-desktop">PRE TEST</div>

                    <div class="brand-title-mobile">GADTC</div>
                    <div class="brand-subtitle-mobile">PRE TEST</div>
                </div>

            </b-navbar-item>
        </template>
        <template #start>

        </template>

        <template #end>
            <b-navbar-item href="/home">
                Home
            </b-navbar-item>

            <b-navbar-item tag="div">
                <div class="buttons">
                    <a v-if="isAuth == 1" class="button is-light" @click="logout">
                        <i class="fa fa-sign-out"></i>&nbsp;<strong>Logout</strong>
                    </a>
                    <a v-else class="button is-light" href="/login">
                        <i class="fa fa-sign-out"></i>&nbsp;<strong>Login</strong>
                    </a>
                </div>
            </b-navbar-item>
        </template>

    </b-navbar>
</template>


<script>
export default {
    props: ['isAuth'],
    data(){
        return{

        }
    },
    methods: {
        logout(){

            axios.post('/logout').then(res=>{
                window.location = '/';
            });
    }
    },

}
</script>

<style scoped>
.brand-title-desktop{
    font-weight: bold;
    display: block;
}
.brand-subtitle-desktop{
    font-size: 14px;
    display: block;
}

.brand-title-mobile{
    font-weight: bold;
    display: none;
}
.brand-subtitle-mobile{
    font-size: 14px;
    display: none;
}

@media only screen and (max-width: 768px) {
    .brand-title-desktop{
        font-weight: bold;
        display: none;
    }
    .brand-subtitle-desktop{
        font-size: 14px;
        display: none;
    }

    .brand-title-mobile{
        font-weight: bold;
        display: block;
    }
    .brand-subtitle-mobile{
        font-size: 14px;
        display: block;
    }
}

</style>
