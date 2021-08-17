<template>
    <div>
        <div class="section">
           <div class="h-box">
               <div class="h-box-header">
                   DASHBOARD
               </div>

               <div class="h-box-body">

                   <div class="h-entity">
                        <div class="h-title">
                            NEW STUDENTS :
                        </div>
                        <div class="h-count">
                            {{ this.reportData.new_students }} &nbsp; <small><i>(multiple account)</i></small>
                        </div>
                   </div>

                   <div class="h-entity">
                        <div class="h-title">
                            ACCEPTED STUDENTS :
                        </div>
                        <div class="h-count">
                            {{ this.reportData.accepted }}
                        </div>
                   </div>

                   <div class="h-entity">
                        <div class="h-title">
                            REJECTED STUDENTS :
                        </div>
                        <div class="h-count">
                            {{ this.reportData.rejected }}
                        </div>
                   </div>

                   <div class="h-entity">
                        <div class="h-title">
                            NO OF TRANSFEREES :
                        </div>
                        <div class="h-count">
                            {{ this.reportData.no_transferees }}
                        </div>
                   </div>
                   <div class="h-entity">
                        <div class="h-title">
                            NO OF RETURNEES :
                        </div>
                        <div class="h-count">
                            {{ this.reportData.no_returnees }}
                        </div>
                   </div>

                   <div class="h-entity">
                        <div class="h-title">
                            NO. OF TAKERS :
                        </div>
                        <div class="h-count">
                            {{ this.reportData.no_takers }}
                        </div>
                   </div>


               </div>
           </div>
        </div>
    </div>
</template>

<script>
export default {

    data() {
        return {
            reportData: {
                accepted: 0,
                rejected: 0,
                no_takers: 0,
                no_transferees: 0,
                no_returnees: 0,
                new_students: 0,
            },
        }
    },

    methods: {
        getDashboardReport: function(){
            axios.get('/dashboard-report').then(res=>{
                this.reportData = res.data;
            });
        }
    },


    mounted() {
        this.getDashboardReport();
    }

}
</script>

<style scoped>

    .h-box{
        border: 1px solid gray;
        border-radius: 4px;
        
    }

    .h-box .h-box-header{
        height: 50px;
        background: rgb(238, 238, 238);
        font-weight: bold;
        padding: 10px;
    }

    .h-box .h-box-body{
        padding: 10px;
    }


    .h-box .h-box-body .h-entity{
        display: flex;
        margin: 10px 0;
    }

    .h-title{
        font-weight: bold;
        padding-right: 10px;
    }

    .h-count{
        font-weight: bold;
    }
</style>
