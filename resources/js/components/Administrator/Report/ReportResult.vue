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
                                    v-model="search.student_id" @keyup.native.enter="loadAsyncData"/>
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

                         <b-table-column field="student_id" label="Student No" v-slot="props">
                            {{ props.row.student_id }}
                        </b-table-column>

                        <b-table-column field="student_name" label="Student Name" v-slot="props">
                            {{ props.row.student.StudLName }}, {{ props.row.student.StudFName }} {{ props.row.student.StudMName }}
                        </b-table-column>

                        <b-table-column field="code" label="A.Y. Code" v-slot="props">
                            {{ props.row.code }}
                        </b-table-column>

                        <b-table-column field="" label="Action" v-slot="props">
                            <div class="is-flex">
                                <b-button outlined class="button is-small is-danger mr-1" icon-pack="fa" icon-right="trash" @click="confirmDelete(props.row.answer_sheet_id)">DELETE</b-button>
                            </div>
                        </b-table-column>

                        
                    </b-table>
                </div><!--close column-->
            </div>
        </div><!--section-->

    </div><!--root div-->
</template>

<script>
export default {
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
    }
}
</script>