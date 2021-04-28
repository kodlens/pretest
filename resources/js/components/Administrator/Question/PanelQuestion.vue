<template>
    <div>
        <div class="section">
            <div style="font-size: 20px; text-align: center; font-weight: bold; margin-bottom: 20px;">LIST OF QUESTIONS</div>
            <div class="columns">
                <div class="column is-10 is-offset-1">

                    <div class="level">
                        <div class="level-left">

                            <div class="level-item">
                                <b-select v-model="perPage" @input="setPerPage">
                                    <option value="5">5 per page</option>
                                    <option value="10">10 per page</option>
                                    <option value="15">15 per page</option>
                                    <option value="20">20 per page</option>
                                </b-select>
                            </div>

                            <div class="level-item">
                                <div class="buttons">
                                    <!-- <b-button tag="a" href="/cpanel-academicyear/create" class="is-primary">Create Account</b-button> -->
                                    <b-button @click="openModal" class="is-primary">Create Question</b-button>
                                </div>
                            </div>
                        </div>

                        <div class="level-right">
                            <div class="level-item">
                                <b-field>
                                    <b-input type="text" placeholder="Search Section..." 
                                    v-model="search.section" @keyup.native.enter="loadAsyncData"/>
                                </b-field>
                            </div>
                        </div>
                    </div>

                    

                    <b-table
                        :data="data"
                        :loading="loading"
                        paginated
                        backend-pagination
                        :total="total"
                        :per-page="perPage"
                        @page-change="onPageChange"
                        detailed
                        detail-transition = ""
                        aria-next-label="Next page"
                        aria-previous-label="Previous page"
                        aria-page-label="Page"
                        :show-detail-icon=true
                        aria-current-label="Current page"
                        backend-sorting
                        :default-sort-direction="defaultSortDirection"
                        @sort="onSort">

                        <b-table-column field="category_id" label="ID" v-slot="props">
                            {{ props.row.question_id }}
                        </b-table-column>

                        <b-table-column field="question" label="Question" v-slot="props">
                            <template>
                                {{ props.row.question }}
                            </template>
                        </b-table-column>

                        <b-table-column field="section" label="Section" v-slot="props">
                            {{ props.row.section.section }}
                        </b-table-column>

                        <b-table-column field="score" label="Score" v-slot="props">
                            {{ props.row.score }}
                        </b-table-column>

                        <b-table-column field="" label="Action" v-slot="props">
                            <div class="is-flex">
                                <b-button outlined class="button is-small is-warning mr-1" tag="a" icon-right="pencil" icon-pack="fa" @click="getData(props.row.question_id)">EDIT</b-button>
                                <b-button outlined class="button is-small is-danger mr-1" icon-pack="fa" icon-right="trash" @click="confirmDelete(props.row.question_id)">DELETE</b-button>
                            </div>
                        </b-table-column>

                        <template slot="detail" slot-scope="props">
                            <div class="title is-5">OPTIONS</div>
                            <table>
                                <thead>
                                    <th>Letter</th>
                                    <th>Content</th>
                                    <th>Answer</th>
                                </thead>
                                <tbody>
                                    <tr v-for="item in props.row.options" :key="item.option_id">
                                        <td>{{ item.letter }}</td>
                                        <td>{{ item.content }}</td>
                                        <td>
                                            <b-icon v-if="item.is_answer === 1"
                                                    pack="fa"
                                                    icon="check"
                                                    size="is-small" type="is-success">
                                            </b-icon>
                                            <b-icon v-else
                                                    pack="fa"
                                                    icon="times"
                                                    size="is-small" type="is-danger">
                                            </b-icon>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                        </template>
                    </b-table>
                </div><!--close column-->
            </div>
        </div>

        <!--modal create-->
        <b-modal v-model="isModalCreate" has-modal-card
                    trap-focus
                    width="640"
                    aria-role="dialog"
                    aria-modal>

            <form @submit.prevent="submit">
                <div class="modal-card">
                    <header class="modal-card-head">
                        <p class="modal-card-title">Question</p>
                        <button
                            type="button"
                            class="delete"
                            @click="isModalCreate = false"/>
                    </header>
                    <section class="modal-card-body">
                        <div class="question-panel">

                            <div class="columns">
                                <div class="column">
                                    <b-field label="Order No." expanded>
                                        <b-numberinput v-model="order_no" controls-position="compact" expanded min="0" max="9999"></b-numberinput>
                                    </b-field>
                                </div>

                                <div class="column">
                                    <b-field label="Section" expanded>
                                        <b-select v-model="section" expanded>
                                            <option v-for="(item, i) in this.sections" :value="item.section_id" :key="i">{{ item.section }}</option>
                                        </b-select>
                                    </b-field>
                                </div>

                                <div class="column">
                                    <b-field label="Score" expanded>
                                        <b-numberinput v-model="score" controls-position="compact" expanded min="0" max="100"></b-numberinput>
                                    </b-field>
                                </div>
                            </div><!-- class columns-->

                            <b-field v-if="this.radioInputOption === 'TEXT'" label="Question">
                                <b-input type="textarea" v-model="question" placeholder="Question" />
                            </b-field>

                            <b-field v-if="this.radioInputOption === 'IMG'" label="Question">
                                <b-field grouped class="file is-primary" :class="{'has-name': !!questionImg}">
                                    <b-upload v-model="questionImg" class="file-label">
                                        <span class="file-cta">
                                            <b-icon class="file-icon" icon="upload"></b-icon>
                                            <span class="file-label">Click to upload</span>
                                        </span>
                                        <span class="file-name" v-if="questionImg">
                                            {{ questionImg.name }}
                                        </span>
                                    </b-upload>
                                </b-field>
                            </b-field>

                            <b-field>
                                <b-radio-button v-model="radioInputOption"
                                        native-value="TEXT"
                                        @input="radioClick"
                                        type="is-success is-light is-outlined">
                                    <b-icon pack="fa" icon="file-text-o"></b-icon>
                                    <span>TEXT</span>
                                </b-radio-button>

                                <b-radio-button v-model="radioInputOption"
                                                native-value="IMG"
                                                @input="radioClick"
                                                type="is-success is-light is-outlined">
                                    <b-icon pack="fa" icon="picture-o"></b-icon>
                                    <span>IMG</span>
                                </b-radio-button>
                            </b-field>

                            <hr>

                            <!--LOOP -->
                            <div class="option-panel" v-for="(option, k) in this.options" :key="k">
                                <b-field :label="`Option ` + letters[k]">
                                    <b-input v-if="option.is_img === 0" type="text" v-model="option.content" placeholder="Option here..."/>


                                    <div v-if="option.is_img === 1">
                                        <b-field grouped class="file is-primary" :class="{'has-name': !!option.img_path}">
                                            <b-upload v-model="option.img_path" class="file-label">
                                                <span class="file-cta">
                                                    <b-icon class="file-icon" icon="upload"></b-icon>
                                                    <span class="file-label">Click to upload</span>
                                                </span>
                                                <span class="file-name" v-if="option.img_path">
                                                    {{ option.img_path.name }}
                                                </span>
                                            </b-upload>
                                        </b-field>
                                    </div>

                                    <b-button class="qo-btn ml-1" style="color: red;"
                                            @click="remove(k)"
                                            v-show="k || ( !k && options.length > 0)">
                                        <i class="fa fa-trash-o fa-lg"></i>
                                    </b-button>
                                    <b-button class="qo-btn"
                                              @click="toogleClickCheck(k)"
                                              v-show="k || ( !k && options.length > 0)">
                                        <i v-if="option.is_answer === 1" class="fa fa-check fa-lg" style="color: green;"></i>
                                        <i v-else class="fa fa-times fa-lg" style="color:red;"></i>
                                    </b-button>
                                </b-field>

                            </div><!--options loop -->

                            <div style="margin-top: 20px;">
                                <!--HOVER BUTTON SO THAT USER WILL SELECT IF OPTION IS IMAGE OR TEXT-->
                                <b-dropdown position="is-top-right" v-show="this.options.length < 5" :triggers="['hover']" aria-role="list">
                                    <template #trigger>
                                        <b-button
                                            label="Add Option"
                                            type="is-info"
                                            icon-right="menu-down" />
                                    </template>

                                    <b-dropdown-item @click="add('text')" aria-role="listitem"><i class="fa fa-plus"></i>&nbsp;Text</b-dropdown-item>
                                    <b-dropdown-item @click="add('img')" aria-role="listitem"><i class="fa fa-picture-o"></i>&nbsp;Image</b-dropdown-item>
                                </b-dropdown>
                            </div>

                            <div class="mt-3">
                                <ul>
                                    <li v-for="(err,i) in this.errors" :key="i">
                                        <span style="color: red; font-style: italic;"><b-icon pack="fa" icon="exclamation" />{{err[0]}}</span>
                                    </li>
                                </ul>
                            </div>

                        </div><!-- question panel -->
                    </section>
                    <footer class="modal-card-foot">
                        <b-button
                            label="Close"
                            @click="isModalCreate=false"/>
                        <button
                            :class="btnClass"
                            label="Save"
                            type="is-success">SAVE</button>
                    </footer>
                </div>
            </form><!--close form-->
        </b-modal>


    </div>
</template>

<script>
export default {
    name: "PanelQuestion.vue",
    data(){
        return{
            data: [],
            total: 0,
            loading: false,
            sortField: 'question_id',
            sortOrder: 'desc',
            page: 1,
            perPage: 20,
            defaultSortDirection: 'asc',

            //modal
            isModalCreate: false,
            modalEditOption: false,

            //for update or data insert
            globalId: 0,


            errors : {},

            btnClass: {
                'is-success': true,
                'button': true,
                'is-loading':false,
            },

            radioInputOption: '',
            sections: null,

            order_no: 0,
            section: '',
            question: '',
            questionImg: null,
            score: 0,

            options: [],
            letters: ['A', 'B', 'C', 'D', 'E'],

            search: {
                section: '',
            },



            //optionsssss


           // activeColors: ['red'],
        }
    },

    methods: {

        loadAsyncData() {
            const params = [
                `sort_by=${this.sortField}.${this.sortOrder}`,
                `perpage=${this.perPage}`,
                `section=${this.search.section}`,
                `page=${this.page}`
            ].join('&')

            this.loading = true
            axios.get(`/ajax/question?${params}`)
                .then(({ data }) => {
                    this.data = []
                    let currentTotal = data.total
                    if (data.total / this.perPage > 1000) {
                        currentTotal = this.perPage * 1000
                    }

                    this.total = currentTotal
                    data.data.forEach((item) => {
                        //item.release_date = item.release_date ? item.release_date.replace(/-/g, '/') : null
                        this.data.push(item)
                    })
                    this.loading = false
                })
                .catch((error) => {
                    this.data = []
                    this.total = 0
                    this.loading = false
                    throw error
                })
        },

        /*
        * Handle page-change event
        */
        onPageChange(page) {
            this.page = page
            this.loadAsyncData()
        },

        onSort(field, order) {
            this.sortField = field
            this.sortOrder = order
            this.loadAsyncData()
        },

        setPerPage(){
            this.loadAsyncData()
        },

        openModal(){
            this.isModalCreate=true;
            this.fields = {};
            this.errors = {};


            this.order_no = 0;
            this.section = '';
            this.question = '';
            this.questionImg = null;
            this.score = 0;
            this.options = [];

            this.globalId = 0;

        },

        add(inputType){
            //shorthand
            //console.log(this.letters[this.options.length]);
            this.options.push({
                optionLetter: this.letters[this.options.length],
                content: '',
                is_answer: 0,
                is_img: inputType === 'text' ? 0 : 1,
                img_path:null,
                checkColor: 'red',
            });
        },

        remove(index){
            this.options.splice(index, 1);

            //this loop will re assign option letter to maintain in order
            this.options.forEach((element, index) => {
                element.optionLetter = this.letters[index];
            });
        },

        getSections(){
            axios.get('/ajax/question/sections').then(res=>{
                this.sections = res.data;
            })
        },

        toogleClickCheck(index){
            //
    
            if(this.options[index].is_answer == 1){
                this.options[index].is_answer = 0;
            }else{
                //this.options[index].is_answer = 0;
                this.options[index].is_answer = 1;
            }
        },

        radioClick(){
            //this.section = '';
            this.question = '';
            this.questionImg = null;
            //this.score = 0;

        },

        submit(){
            if(this.globalId > 0){
                //update
                this.updateData();
            }else{
                //insert
                this.insertData();
            }
        },

        insertData(){

            axios.post('/panel/question',{
                order_no: this.order_no,
                question: this.question,
                question_img: this.questionImg,
                section: this.section,
                score: this.score,
                options: this.options,
            }).then(res=>{
                console.log(res.data[0].status);
                if(res.data[0].status === 'saved'){
                    alert('Question saved.');
                    //close the modal
                    this.isModalCreate = false;

                    //re initialize variables...
                    this.order_no = 0;
                    this.section = '';
                    this.question = '';
                    this.questionImg = null;
                    this.score = 0;
                    this.options = [];
                    this.loadAsyncData();
                }
            }).catch(error=>{
                if (error.response) {
                    this.errors = error.response.data.errors;
                    // console.log(error.response.data);
                    // console.log(error.response.status);
                    // console.log(error.response.headers);
                }

            })
        },

        updateData(){
            axios.put('/panel/question/'+this.globalId,{
                order_no: this.order_no,
                question: this.question,
                question_img: this.questionImg,
                section: this.section,
                score: this.score,
                options: this.options,
            }).then(res=>{
                console.log(res.data[0].status);
                if(res.data[0].status === 'updated'){
                    this.globalId = 0;
                    alert('Question updated.');
                    //close the modal
                    this.isModalCreate = false;

                    //re initialize variables...
                    this.order_no = 0,
                        this.section = '';
                    this.question = '';
                    this.questionImg = null;
                    this.score = 0;
                    this.options = [];
                    this.loadAsyncData();
                }
            }).catch(error=>{
                if (error.response) {
                    this.errors = error.response.data.errors;
                    // console.log(error.response.data);
                    // console.log(error.response.status);
                    // console.log(error.response.headers);
                }
            })
        },

        assignLetter(index){
            alert('new row added');
            options.forEach(element => {
                console.log('element'+ element);
            });
            //this.options.optionLetter[k] = this.letters[k];
        },

        confirmDelete(dataId){
            this.$buefy.dialog.confirm({
                title: 'DELETE',
                type: 'is-danger',
                message: 'Are you sure you want to delete this question permanently? It will also delete the options added in this question.',
                cancelText: 'Cancel',
                confirmText: 'Delete',
                onConfirm: ()=> this.deleteSubmit(dataId)
            });
        },
        deleteSubmit(dataId){
            axios.delete('/panel/question/'+dataId).then(res=>{
                this.loadAsyncData();
            });
        },


        getData(dataId){
            this.isModalCreate = true;
            this.errors = {};


            axios.get('/panel/question/'+ dataId).then(res=>{
                //if axios response, it will set the global Id
                this.globalId = dataId;

                this.order_no = res.data.order_no;
                this.section = res.data.section_id;

                this.question = res.data.question;
                this.questionImg = res.data.question_img_path;
                res.data.question != '' || res.data.question != null ? this.radioInputOption = 'TEXT' : this.radioInputOption = 'IMG';

                this.questionImg = res.data.questionImg;
                this.score = res.data.score;

                this.options = res.data.options;
            });
        },

    },

    mounted() {
        this.loadAsyncData();
        this.getSections();
    }

}
</script>

<style scoped>

/*qo mean question options button remove*/
.qo-btn{
    margin-left: 5px;
    border: none;
}

.qo-btn > i:hover{
    color:red;
    text-decoration: underline;
}

.qo-btn-check{
    border: none;
    color: red;
}

.qo-btn-check-active{
    border: none;
    color: green;
}
.red-x{
    color: red;
}
.green-check{
    color: green;
}

.option-panel{
    margin-left: 30px;
}

</style>
