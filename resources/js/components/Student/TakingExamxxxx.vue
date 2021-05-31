<template>
    <div>
        <div class="section">
            <div class="container">
                <form @submit.prevent="submit">
                    <div class="columns">
                        <div class="column is-8 is-offset-2">

                            <div class="instruction-container">
                                <div>
                                    Instruction: Click the letter of your answer.
                                    <br>
                                    <strong><span style="color:red;">Reminder: Please refrain taking screenshots and posting any of the questions of the test.</span></strong>
                                </div>
                            </div>

                            <div class="question-box" v-for="(item, i) in questions" :key="i">
                                <!--question content-->
                                <div class="question-content">{{ i + 1 }}.)
                                    <span v-if="item.is_question_img == 0">{{item.question}}</span>

                                    <div v-else class="question-img">
                                        <img :src="`/storage/q/`+item.question_img" alt="...">
                                    </div>
                                </div>
                                <!--question content-->

                                <!--option content-->
                                <div class="option-content" v-for="(option, k) in item.options" :key="k">
                                    <!--if question is text-->
                                    <div v-if="option.is_img == 0">
                                        <b-field>
                                            <b-radio
                                                v-model="answers[i]"
                                                :native-value="option.option_id">
                                                {{option.letter}} - {{ option.content }}
                                            </b-radio>
                                        </b-field>
                                    </div>

                                    <!--if question is img-->
                                    <div v-else>
                                        <b-field>
                                            <b-radio
                                                v-model="answers[i]" required
                                                :native-value="option.option_id">
                                                <div class="question-img">{{option.letter}}. </div>
                                                <img :src="`/storage/q/`+option.img_path" alt="...">
                                            </b-radio>
                                        </b-field>
                                    </div>

                                </div>
                                <!--option content-->

                            </div><!--question-box-->

                            <div class="buttons is-right mb-5">
                                <button :class="btnClass">SUBMIT ANSWER</button>
                            </div>

                        </div>
                    </div> <!--columns-->
                </form>
            </div><!--container-->
        </div><!--section-->

        <div class="timer-container">
            <b-icon pack="fa" icon="clock-o"></b-icon> &nbsp;
            <div>{{ nTime }}</div>
        </div>

    </div><!--root div-->
</template>

<script>
export default {
    props: ['sectionId'],
    data(){
        return{
            questions: [],
            errors: {},
            answers:[],
            btnClass:{
                'button': true,
                'is-success': true,
                'is-loading': false
            },

            nTime: '',
        }
    },
    methods: {
        loadQuestion: async function(){
            await axios.get('/section-question?section='+this.sectionId).then(res=>{
                //5pxconsole.log(res.data);
                this.questions = res.data;
            });
        },

        startTimer(duration) {

            duration = duration * 60;
            var timer = duration, minutes, seconds;

            setInterval( ()=> {
                //use arrow function so this keyword will refer to window.variable
                minutes = parseInt(timer / 60, 10);
                seconds = parseInt(timer % 60, 10);

                minutes = minutes < 10 ? "0" + minutes : minutes;
                seconds = seconds < 10 ? "0" + seconds : seconds;

                this.nTime = minutes + ':' + seconds;

                if (--timer < 0) {
                    timer = duration;
                    //alert('done');
                    this.submit();
                }
            }, 1000);


        },

        submit(){
            this.btnClass["is-loading"] = true;
            axios.post('/student/taking-exam', this.answers).then(res=>{
                this.btnClass["is-loading"] = false;
                if(res.data.status === 'saved'){
                    this.$buefy.dialog.alert({
                        title: 'SAVED.',
                        message: 'Your test successfully saved.',
                        confirmText: 'OK',
                        onConfirm: ()=> window.location = '/student/result-exam'
                    });
                }
                if(res.data.status === 'exist'){
                    this.$buefy.dialog.alert({
                        title: 'NOT ALLOWED!',
                        type: 'is-danger',
                        message: 'You already took the exam. Thank you.',
                        confirmText: 'OK',
                        onConfirm: ()=> window.location = '/student/home'
                    });
                }
            }).catch(err=>{
                this.btnClass["is-loading"] = false;
                if(err.response.status===422){
                    this.errors = err.response.data.errors;
                    console.log(this.errors[0]);
                }else{
                    this.$buefy.dialog.alert({
                        title: 'ERROR!',
                        type: 'is-danger',
                        message: 'An error occured during submitting your answer. Please check internet connectivity. \n ' + err.response.data.errors[0],
                        confirmText: 'OK',
                    });
                }
            });
        },

    },
    mounted(){
        this.loadQuestion().then(()=>{
            this.startTimer(45);
        });

    },
}
</script>

<style scoped>

    .instruction-container{
        background-color: #c1fad1;
        padding: 15px;
        margin-bottom: 5px;
    }

    .question-box{
        border-radius: 5px;
        background-color: rgb(238, 238, 238);
        padding: 20px;
        margin-bottom: 10px;
    }

    .question-content{
        font-weight: bold;
    }

    .question-img{
        padding: 10px;
        display: flex;
    }

    .option-content{
        margin-left: 30px;
        padding: 5px 5px;
    }

    .timer-container{
        height: 55px;
        background-color: rgb(20, 83, 31);
        color: white;
        position: fixed;
        bottom: 50px;
        right: 0;
        width: 150px;
        padding: 15px;
        border-radius: 5px;
        transition: all 0.5s ease;
        display: flex;
        justify-content: center;
        font-size: 20px;
        align-items: center;
    }

    @media screen and (max-width: 992px) {
        .timer-container {
            width: 100%;
            bottom: 0;
            border-radius: 0;
            display: flex;
            justify-content: center;
        }
    }

</style>
