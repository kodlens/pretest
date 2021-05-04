<template>
    <div>
        <div class="section">
            <div class="container">
                <form @submit.prevent="submit">
                    <div class="columns">
                        <div class="column is-8 is-offset-2">
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
                                                :native-value="option.option_id" required>
                                                {{option.letter}} - {{ option.content }}
                                            </b-radio>
                                        </b-field>
                                    </div>

                                    <!--if question is img-->
                                    <div v-else>
                                        <b-field>
                                            <b-radio
                                                v-model="answers[i]" required
                                                :native-value="option.option_id" required>
                                                <div class="question-img">{{option.letter}}. </div>
                                                <img :src="`/storage/q/`+option.img_path" alt="...">
                                            </b-radio>
                                        </b-field>
                                    </div>

                                </div>
                                <!--option content-->

                            </div><!--question-box-->

                            <div class="buttons is-right">
                                <button :class="btnClass">SUBMIT ANSWER</button>
                            </div>

                        </div>
                    </div> <!--columns-->
                </form>
            </div>
        </div>
    </div><!--root div-->
</template>

<script>
export default {

    data(){
        return{
            questions: [],

            errors: {},

            answers:[],

            btnClass:{
                'button': true,
                'is-success': true,
                'is-loading': false
            }


        }
    },
    methods: {
        loadQuestion: async function(){

            await axios.get('/student/taking-exam-question').then(res=>{
                //5pxconsole.log(res.data);
                this.questions = res.data;
            });
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
        this.loadQuestion();
    },
}
</script>

<style scoped>
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
</style>
