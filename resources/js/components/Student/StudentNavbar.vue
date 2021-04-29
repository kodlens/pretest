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
            <b-navbar-item href="/student/home">
                Home
            </b-navbar-item>

             <b-navbar-item href="/student/taking-exam">
                Quiz
            </b-navbar-item>

            <b-navbar-item tag="div">
                <div v-if="isAuth == 1" class="buttons">
                    <b-dropdown aria-role="list">
                        <template #trigger="{ active }">
                            <b-button
                                :label="firstname"
                                type="is-primary"
                                :icon-right="active ? 'menu-up' : 'menu-down'" />
                        </template>


                        <b-dropdown-item aria-role="listitem" @click="logout">
                            <b-icon pack="fa" icon="sign-out"></b-icon>
                            Logout
                        </b-dropdown-item>
                        <!-- <b-dropdown-item aria-role="listitem">Another action</b-dropdown-item>
                        <b-dropdown-item aria-role="listitem">Something else</b-dropdown-item> -->
                    </b-dropdown>
                </div>

                <div v-else class="buttons">
                    <b-button class="button is-light" href="/login">
                        <i class="fa fa-sign-out"></i>&nbsp;<strong>Login</strong>
                    </b-button>
                </div>
            </b-navbar-item>
        </template>

    </b-navbar>
</template>


<script>
export default {
    props: ['isAuth','firstname'],
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
