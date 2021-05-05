<template>
    <div>
        <div class="section">
            <div style="font-size: 20px; text-align: center; font-weight: bold; margin-bottom: 20px;">LIST OF STUDENT ANSWERS</div>
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
                                    <!-- <b-button @click="openModal" class="is-primary"></b-button> -->
                                </div>
                            </div>
                        </div>

                        <div class="level-right">
                            <div class="level-item">
                                <b-field>
                                    <b-input type="text" placeholder="Search Student ID..."
                                    v-model="search.stduent_id" @keyup.native.enter="loadAsyncData"/>
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

                        <b-table-column field="answer_sheet_id" label="ID" v-slot="props">
                            {{ props.row.answer_sheet_id }}
                        </b-table-column>

                        <b-table-column field="student_name" label="Student Name" v-slot="props">
                            {{ props.row.student.StudLName }}, {{ props.row.student.StudFName }} {{ props.row.student.StudMName }}
                        </b-table-column>

                        <b-table-column field="code" label="A.Y. Code" v-slot="props">
                            {{ props.row.code }}
                        </b-table-column>

                        <b-table-column field="" label="Action" v-slot="props">
                            <div class="is-flex">
                                <b-button outlined class="button is-small is-danger mr-1" icon-pack="fa" icon-right="tras<h" @click="confirmDelete(props.row.question_id)">DELETE</b-button>
                            </div>
                        </b-table-column>

                        <template slot="detail" slot-scope="props">
                            <div class="title is-5">ANSWERS</div>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Letter</th>
                                        <th>Answer</th>
                                        <th>Question</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="item in props.row.answers" :key="item.answer_id">
                                        <td>{{ item.letter }}</td>
                                        <td style="width: 300px;" v-if="item.content != ''">{{ item.content }}</td>
                                        <td v-else><a @click="showImg(item.img_path)">{{ item.img_path }}</a></td>
                                        <td>
                                            {{ item.question }}
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                        </template>
                    </b-table>
                </div><!--close column-->
            </div>
        </div>


        <!--modal show image-->
        <!--MODAL FOR IMAGE, CONTAINER-->
        <b-modal v-model="modalImage" has-modal-card
                 trap-focus
                 width="640"
                 aria-role="dialog"
                 aria-modal>


            <div class="modal-card">
                <header class="modal-card-head">
                    <p class="modal-card-title">Image</p>
                    <button
                        type="button"
                        class="delete"
                        @click="modalImage = false"/>
                </header>
                <section class="modal-card-body">
                    <div>
                        <img :src="path" alt="...">
                    </div>
                </section>
                <footer class="modal-card-foot">
                    <b-button
                        label="Close"
                        @click="modalImage=false"/>
<!--                    <button-->
<!--                        :class="btnClass"-->
<!--                        label="Save"-->
<!--                        @click="submit"-->
<!--                        type="is-success">SAVE</button>-->
                </footer>
            </div>

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
            sortField: 'answer_sheet_id',
            sortOrder: 'desc',
            page: 1,
            perPage: 20,
            defaultSortDirection: 'asc',

            //modal
            modalImage: false,



            btnClass: {
                'is-success': true,
                'button': true,
                'is-loading':false,
            },

            search: {
                student_id: '',
            },

            path:'', //path if image retirieve using modal

            //optionsssss

           // activeColors: ['red'],
        }
    },

    methods: {

        loadAsyncData() {
            const params = [
                `sort_by=${this.sortField}.${this.sortOrder}`,
                `perpage=${this.perPage}`,
                `idno=${this.search.student_id}`,
                `page=${this.page}`
            ].join('&')

            this.loading = true
            axios.get(`/panel/ajax-answer?${params}`)
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

        

        showImg(path){
            this.modalImage = true;
            this.path = '/storage/q/'+path;
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


        

    },

    mounted() {
        this.loadAsyncData();
        
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
