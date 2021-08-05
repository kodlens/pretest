<template>
    <div>
        <div class="hero is-fullheight-with-navbar">
            <div class="hero-body">
                <div class="container">
                    <div class="columns">
                        <div v-if="this.results.is_submitted === 0" class="column is-6 is-offset-3">
                            <div class="panel is-primary">
                                <div class="panel-heading">
                                    TEST RESULT
                                </div>
                                <div class="panel-body">
                                    <p class="title">TOTAL SCORE</p>
                                   <p class="score">{{ this.results.score }}</p>
                                </div>
                            </div>
                        </div><!--col-->

                        <!--LETTER-->
                        <div v-if="this.results.is_submitted === 1" class="column is-8 is-offset-2">

                            <!-- ACCEPTANCE LETTER -->
                            <div v-if="this.results.remark === 'ACCEPT'" class="panel mypanel">
                                <div>Guidance and Admission Office</div>
                                <div>Gov. Alfonso D. Tan College</div>
                                <div>Maloro, Tangub City, Misamis Occidental</div>
                                <br>
                                
                                <div>Dear Mr./Ms. {{this.results.lname}}, {{this.results.fname}} {{this.results.mname}},</div>
                                <br>
                                <h2 style="font-weight: bold;">CONGRATULATIONS</h2>
                                <br>
                                <p>
                                    Thank you for your active participation in the GADTC Admission 2021-2022. 
                                    We would like to inform you that after carefully examining your scores, 
                                    your application has complied all necessary requirements of your chosen program.
                                </p>
                                <br>
                                <p>We are pleased to offer you admission as a Freshman to the following program(s):</p>
                                <ul>
                                    <li style="margin-left: 15px;" v-for="(item, index) in this.programs" :key="index"> - {{item.CCode}}</li>
                                </ul>
                                <br>
                                <p>
                                    To be part of the dynamic community of GADTC,  enroll via our student portal and use the admission code 
                                    <strong>{{this.results.admission_code}}</strong> starting August 2, 2020 until August 13, 2020. 
                                    Please click the BUTTON below to accept this offer.
                                </p>
                                <div class="buttons is-centered" style="margin: 15px 0;">
                                    <a class="button is-link" href="http://admission.gadtc.edu.ph/login">CLICK HERE TO APPLY</a>
                                </div>
                                <br>
                                <p>Please Note:</p><br>
                                <p>Enrollment period for Freshmen is on August 2-13, 2021 only. 
                                    Failure to reply within those dates will mean forfeiture of your slot.
                                </p><br>
                                <p>
                                    Starting A.Y. 2021 - 2022. Governor Alfonso D. Tan College will adopt the Flexible Learning (FL) 
                                    (i.e modular and digital learning) for incoming freshmen.
                                </p><br>
                                <p>
                                    We look forward to welcoming you to GADTC this coming school year.
                                </p><br><br><br>

                                <p>Thanks,</p>
                                <p>GADTC Guidance and Admission Office</p>
                            </div>
                            <!-- ACCEPTANCE LETTER -->

                            <!-- REJECTON LETTER -->
                            <div v-if="this.results.remark === 'REJECT'" class="panel mypanel">
                               
                                <div>Guidance and Admission Office</div>
                                <div>Gov. Alfonso D. Tan College</div>
                                <div>Maloro, Tangub City, Misamis Occidental</div>
                                <br>
                                
                                <div>Dear Mr./Ms. {{this.results.lname}}, {{this.results.fname}} {{this.results.mname}},</div>
                                <br>

                                <p>
                                    The Gov. Alfonso D. Tan College appreciates your interest in applying for admission through the GADTEST.
                                </p>
                                <br>
                                <p>
                                    Due to limited slots available, we regret to inform you that the results of 
                                    your test (SCORE: {{this.results.score}}) did not meet the required passing rate to make your eligible for admission.
                                </p>
                                <br>
                                <p>
                                    Thank you for your time and effort. We wish you success in your future academic endeavor.
                                </p>
                                <br><br>
                                <p>
                                    Best Regards,<br>
                                    GADTC Guidance and Admission Office
                                </p>


                            </div>
                        </div><!--col--><!--LETTER-->

                        

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
            results: 0,
            programs: {},
        }
    },
    methods: {
        loadResult(){
            axios('/fetch-result-exam').then(res=>{
                this.results = res.data[0];
                this.programs = JSON.parse(this.results.accepted_program);
                //console.log(this.programs);
                
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

    .mypanel{
        padding: 25px;
    }

    
</style>
