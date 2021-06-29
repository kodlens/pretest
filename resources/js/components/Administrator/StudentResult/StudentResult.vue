<template>
    <div>
        <div class="section">
            <div style="font-size: 20px; text-align: center; font-weight: bold; margin-bottom: 20px;">LIST OF STUDENT RESULTS</div>
            <div class="columns">
                <div class="column is-10 is-offset-1">

                    <div class="level">
                        <div class="level-left">
                            <div class="level-item">
                                <b-field label="Page" label-position="on-border">
                                    <b-select v-model="perPage" @input="setPerPage">
                                        <option value="5">5 per page</option>
                                        <option value="10">10 per page</option>
                                        <option value="15">15 per page</option>
                                        <option value="20">20 per page</option>
                                    </b-select>
                                </b-field>
                            </div>
                        </div>

                        <div class="level-right">
                            <div class="level-item">
                                <b-field label-position="on-border" label="Search User ID">
                                    <b-input type="text" placeholder="Search User ID..."
                                             v-model="search.user_id" @keyup.native.enter="loadAsyncData"/>
                                </b-field>
                            </div>
                        </div>
                    </div>

                    <div class="level">

                        <div class="level-left">
                            <div class="level-item">
                                <b-field label-position="on-border" label="Search Program">
                                    <b-select placeholder="Search Program"
                                              v-model="search.first_program_choice" @input="loadAsyncData">
                                        <option value="">ALL</option>
                                        <option v-for="(item, index) in this.programs" :key="index" :value="item.CCode">{{ item.CCode }}</option>
                                    </b-select>
                                </b-field>
                            </div>
                        </div>

                        <div class="level-right">
                            <div class="level-item">
                                <b-field label-position="on-border" label="Search Lastname">
                                    <b-input type="text" placeholder="Search Student Lastname..."
                                             v-model="search.lname" @keyup.native.enter="loadAsyncData" />
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

                        <b-table-column field="code" label="A.Y. Code" v-slot="props">
                            {{ props.row.code }}
                        </b-table-column>

                        <b-table-column field="user_id" label="User ID" v-slot="props">
                            {{ props.row.user_id }}
                        </b-table-column>

                        <b-table-column field="fullname" label="Student Name" v-slot="props">
                            {{ props.row.lname }}, {{ props.row.fname }} {{ props.row.mname }}
                        </b-table-column>

                        <b-table-column field="first_program_choice" label="1st Program" v-slot="props">
                            {{ props.row.first_program_choice }}
                        </b-table-column>

                        <b-table-column field="first_program_choice" label="2nd Program" v-slot="props">
                            {{ props.row.second_program_choice }}
                        </b-table-column>

                        <b-table-column field="section" label="Section" v-slot="props">
                            {{ props.row.section }}
                        </b-table-column>

                        <b-table-column field="score" label="Score" v-slot="props">
                            {{ props.row.score }}
                        </b-table-column>

                        <b-table-column field="created_at" label="Created At" v-slot="props">
                            {{ props.row.created_at }}
                        </b-table-column>

                        <!--                        <b-table-column field="" label="Action" v-slot="props">-->
                        <!--                            <div class="is-flex">-->
                        <!--                                <b-button outlined class="button is-small is-danger mr-1" icon-pack="fa" icon-right="trash" @click="confirmDelete(props.row.answer_sheet_id)">DELETE</b-button>-->
                        <!--                            </div>-->
                        <!--                        </b-table-column>-->

                    </b-table>
                </div><!--close column-->
            </div>
        </div>

    </div>
</template>

<script>
export default {

    props: {
        propPrograms: {
            type: String,
            default: '',
        }
    },

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
                user_id: '',
                lname: '',
                first_program_choice: '',
            },

            programs: [],
        }
    },

    methods: {

        loadAsyncData() {
            const params = [
                `sort_by=${this.sortField}.${this.sortOrder}`,
                `perpage=${this.perPage}`,
                `page=${this.page}`,
                `user_id=${this.search.user_id}`,
                `lname=${this.search.lname}`,
                `first_program_choice=${this.search.first_program_choice}`

            ].join('&');

            this.loading = true
            axios.get(`/fetch-student-result?${params}`)
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
                    });
                    this.loading = false
                })
                .catch((error) => {
                    this.data = [];
                    this.total = 0;
                    this.loading = false;
                    throw error;
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


        confirmDelete(dataId){
            this.$buefy.dialog.confirm({
                title: 'DELETE',
                type: 'is-danger',
                message: 'Are you sure you want to delete this answer of the student permanently? It will also delete his/her answers.',
                cancelText: 'Cancel',
                confirmText: 'Delete',
                onConfirm: ()=> this.deleteSubmit(dataId)
            });
        },
        deleteSubmit(dataId){
            axios.delete('/panel/answer/'+dataId).then(res=>{
                this.loadAsyncData();
            });
        },

        initData: function(){
            this.programs = JSON.parse(this.propPrograms);
        }
    },

    mounted() {
        this.initData();
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
