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
                                    <table class="table is-fullwidth">
                                        <thead>
                                            <th>Category</th>
                                            <th>Score</th>
                                        </thead>
                                        <tbody>
                                            <tr v-for="item in this.results" :key="item.section_id">
                                                <td>{{ item.section}}</td>
                                                <td>{{ item.total_score}}</td>
                                            </tr>
                                            <tr>
                                                <td><strong>TOTAL</strong></td>
                                                <td><strong>{{ this.totalSum }}</strong></td>
                                            </tr>
                                        </tbody>
                                    </table>
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
            results: []

        }
    },
    methods: {
        loadResult(){
            axios('/student/ajax-result-exam').then(res=>{
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
    }
</style>
