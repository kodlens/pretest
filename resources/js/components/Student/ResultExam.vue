<template>
    <div>
        <div class="hero is-fullheight-with-navbar">
            <div class="hero-body">
                <div class="container">
                    <div class="columns">
                        <div class="column is-6 is-offset-3">
                            <div class="panel is-primary">
                                <div class="panel-heading">
                                    TEST RESULT
                                </div>
                                <div class="panel-body">
                                    <p class="title">TOTAL SCORE</p>
                                   <p class="score">{{ this.results }}</p>
                                </div>
                            </div>
                        </div><!--col-->
                    </div><!--columns-->
                </div><!--container-->
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data(){
        return{
            results: 0

        }
    },
    methods: {
        loadResult(){
            axios('/fetch-result-exam').then(res=>{
                this.results = res.data;
            });
        }
    },
    mounted(){
        this.loadResult();
    },
    computed: {
        totalSum: function(){
            let total = 0;
            this.results.forEach( element => {
                total += parseInt(element.total_score);
            });
            return total;
        }
    }
}
</script>

<style scoped>
    .panel-body{
        padding: 15px;
        text-align: center;
    }

    .score{
        font-weight: bold;
        font-size: 3em;
    }
</style>
