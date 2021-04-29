<template>
    <div>
        <div class="section">
            <div class="container">
                <div class="columns">
                    <div class="column is-8 is-offset-2">

                        <div class="question-box" v-for="(item, i) in questions" :key="i">
                            
                            <!--question content-->
                            <div class="question-content">{{ i + 1 }}.) 
                                <span v-if="item.is_question_img == 0">{{item.question}}</span>

                                <div v-else>IMAGE QUESTION</div>
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
                                    IMG
                                </div>

                            </div>
                             <!--option content-->
                            
                        </div><!--question-box-->

                    </div>
                </div>
            </div>
        </div>
    </div><!--root div-->
</template>

<script>
export default {
    data(){
        return{
            questions: [],
            
            answers:[],
            

        }
    },
    methods: {
        loadQuestion: async function(){
            
            await axios.get('/student/taking-exam-question').then(res=>{
                console.log(res.data);
                this.questions = res.data;
            });
        }
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

    .option-content{
        margin-left: 30px;
        padding: 5px 5px;
        
    }
</style>
