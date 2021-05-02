<template>
    <div>
        <div class="section">
            <div class="columns">
                <div class="column is-8 is-offset-2">
                    <form @submit.prevent="submit">
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
                                <b-field :label="(i+1) + `. Question`" expanded>
                                    <b-input type="input" v-model="question.content" placeholder="Question here"></b-input>
                                </b-field>

                                <div style="margin-left: 30px;" v-for="(option,k) in question.options" :key="k">

                                    <!--if text option-->
                                    <div v-if="option.is_img === 0">
                                        <b-field label="Option" grouped>
                                            <b-input  type="input" v-model="option.content" placeholder="Option here..." expanded />
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
                                    </div>

                                    <!--if img option-->
                                    <div v-if="option.is_img === 1">
                                        <b-field grouped class="file is-primary" :class="{'has-name': !!option.img}">
                                            <b-upload v-model="option.img" class="file-label">
                                            <span class="file-cta">
                                                <b-icon class="file-icon" icon="upload"></b-icon>
                                                <span class="file-label">Click to upload</span>
                                            </span>
                                                <span class="file-name" v-if="option.img">
                                                {{ option.img.name }}
                                            </span>
                                            </b-upload>

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
                                    </div>
                                    <!--if img option-->


                                    <div style="margin-top: 20px;">
                                        <!--HOVER BUTTON SO THAT USER WILL SELECT IF OPTION IS IMAGE OR TEXT-->
                                        <b-dropdown v-show="question.options.length < 5 && k === question.options.length - 1" :triggers="['hover']" aria-role="list">
                                            <template #trigger>
                                                <b-button
                                                    label="Add Option"
                                                    type="is-info"
                                                    icon-right="menu-down" />
                                            </template>

                                            <b-dropdown-item @click="add(i, 'text')" aria-role="listitem"><i class="fa fa-plus"></i>&nbsp;Text</b-dropdown-item>
                                            <b-dropdown-item @click="add(i, 'img')" aria-role="listitem"><i class="fa fa-picture-o"></i>&nbsp;Image</b-dropdown-item>
                                        </b-dropdown>
                                    </div>
                                </div>
                            </div>


                            <b-field label="Points">
                                <b-numberinput controls-alignment="right" min="0"
                                               controls-position="compact"
                                               v-model="question.points" placeholder="Points">
                                </b-numberinput>
                            </b-field>
                            <hr>

                            <div class="buttons">
                                <b-button class="button is-success" icon-pack="fa"
                                          icon-left="plus-circle" @click="addQuestion"
                                          v-show="i === questions.length - 1">
                                    Add New Question
                                </b-button>
                            </div>

                        </div><!--question panel-->

                        <div class="buttons is-right">
                            <button class="button is-success">
                                <i class="fa fa-plus-circle"></i>
                                &nbsp;
                                Save Questions
                            </button>
                        </div>
                    </form>
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
                points: 0,
                options: [{
                    content: '',
                    is_ans: 0,
                    is_img: 0,
                    img:null,
                }],
            }],
        }
    },
    methods: {

        add (k, optType) {
            //if option is text
            if(optType === 'text'){
                this.questions[k].options.push({
                    content: '',
                    is_ans: 0,
                    is_img: 0,
                    img:null,
                })
            }
            //if option is an img
            if(optType === 'img'){
                this.questions[k].options.push({
                    content: '',
                    is_ans: 0,
                    is_img: 1,
                    img:null,
                })
            }
        },
        remove (i, k) {
            this.questions[i].options.splice(k, 1)
        },


        addQuestion (i) {
            this.questions.push({
                content: '',
                points: 0,
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
        },

        submit(){
            axios.post('/panel/question', this.questions).then(res=>{
                console.log(res.data);
            })
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
