<template>
    <div>
        <div class="section">
            <div class="columns">
                <div class="column is-8 is-offset-2">
                    <div class="question-panel" v-for="(question,i) in this.questions" :key="i">
                        <div class="question-tool">
                            <div class="q-tool">
                                <b-button class="button is-small is-danger" icon-pack="fa" icon-left="minus-circle"
                                          @click="removeQuestion(i)"
                                          v-show="i || ( !i && questions.length > 1)">
                                    Remove
                                </b-button>
                            </div>
                        </div>

                        <div class="question-content">
                            <b-field :label="(i+1) + `. Question`">
                                <b-input type="input" v-model="question.content" placeholder="Question here"></b-input>
                            </b-field>

                            <div style="margin-left: 30px;" v-for="(option,k) in question.options" :key="k">
                                <b-field label="Option" grouped>
                                    <b-input type="input" v-model="option.content" placeholder="Option here..." expanded />
                                    <button class="qo-btn ml-1"
                                            @click="remove(i, k)"
                                            v-show="k || ( !k && question.options.length > 1)">
                                        <i class="fa fa-trash-o fa-lg"></i>
                                    </button>
                                    <button class="qo-btn ml-1" @click="toogleCheckAnswer(option)">
                                        <i class="fa fa-check fa-lg"></i>
                                    </button>
                                    <div class="" style="margin:auto;" v-show="option.is_ans === 1">
                                        <span>Correct Answer</span>
                                    </div>
                                </b-field>

                                <div>
                                    <button @click="add(i)" v-show="question.options.length < 5 && k === question.options.length - 1">
                                        <i class="fa fa-plus"></i>&nbsp;Add Option
                                    </button>
                                </div>
                            </div>
                        </div>

                        <hr>
                        <div class="buttons">
                            <b-button class="button is-success" icon-pack="fa"
                                      icon-left="plus-circle" @click="addQuestion"
                                      v-show="i === questions.length - 1">
                                Add New
                            </b-button>
                        </div>

                    </div><!--question panel-->

                    <div class="buttons is-right">
                        <b-button class="button is-success" icon-pack="fa"
                                  icon-left="plus-circle">
                            Save Questions
                        </b-button>
                    </div>

                </div><!--col-8-->
            </div>
        </div>
    </div>
</template>

<script>
export default {

    data(){
        return{

            questions: [{
                content: '',
                options: [{
                    content: '',
                    is_ans: 0,
                    is_img: 0,
                    img:'',
                }],
            }],
        }
    },
    methods: {

        add (k) {
            this.questions[k].options.push({
                content: '',
                is_ans: 0,
                is_img: 0,
                img:'',
            })
        },
        remove (i, k) {
            this.questions[i].options.splice(k, 1)
        },


        addQuestion (i) {
            this.questions.push({
                content: '',
                options: [{
                    content: '',
                    is_ans: 0,
                    is_img: 0,
                    img:'',
                }],
            })
        },
        removeQuestion (index) {
            this.questions.splice(index, 1)
        },

        toogleCheckAnswer(option){
            option.forEach(function(){
                option.is_ans = 0;
            });
            option.is_ans = 1;
            //option.is_ans === 1 ? option.is_ans = 0 : option.is_ans = 1
        }



    }

}
</script>

<style scoped>
/*qo mean question options button remove*/
.qo-btn{
    border: none;
    color: green;
}

.qo-btn > i:hover{
    color:red;
    text-decoration: underline;
}



</style>
