<template>
    <div>
        <div class="section">
            <div style="font-size: 20px; text-align: center; font-weight: bold; margin-bottom: 20px;">LIST OF STUDENT AND RESULT</div>
            <div class="columns">
                <div class="column is-12">

                    <div class="level">
                        

                        <div class="level-right">
                            <div class="level-item">
                                <b-field>
                                    <b-input type="text" placeholder="Search"
                                    v-model="search" @keyup.native.enter="loadAsyncData"/>
                                </b-field>
                            </div>
                        </div>
                    </div>


                    <b-table
                        :data="data"
                        :loading="loading"
                        
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


                        <b-table-column field="student_id" label="Student No" v-slot="props">
                            {{ props.row.student_id }}
                        </b-table-column>

                        <b-table-column field="StudLName" label="Lastname" v-slot="props">
                            {{ props.row.StudLName }}, {{ props.row.StudFName }} {{ props.row.StudMName }}
                        </b-table-column>

                        <b-table-column field="EnrCourse" label="Program/Year" v-slot="props">
                            {{ props.row.EnrCourse }}/ {{ props.row.EnrYear }}
                        </b-table-column>

                        <b-table-column field="abstraction" label="ABSTRACTION" centered numeric v-slot="props">
                            {{ props.row.abstraction }}
                        </b-table-column>

                        <b-table-column field="abstraction" label="LOGICAL" centered numeric v-slot="props">
                            {{ props.row.logical }}
                        </b-table-column>

                        <b-table-column field="english" label="ENGLISH" centered numeric v-slot="props">
                            {{ props.row.english }}
                        </b-table-column>

                        <b-table-column field="numerical" label="NUMERICAL" centered numeric v-slot="props">
                            {{ props.row.numerical }}
                        </b-table-column>

                        <b-table-column field="general" label="GENERAL" centered numeric v-slot="props">
                            {{ props.row.general }}
                        </b-table-column>

                        <b-table-column field="total" label="TOTAL" centered numeric v-slot="props">
                            {{ Number(props.row.general) + Number(props.row.numerical) + Number(props.row.english)
                            + Number(props.row.logical) + Number(props.row.abstraction) }}
                        </b-table-column>

                        <!-- <b-table-column field="" label="Action" v-slot="props">
                            <div class="is-flex">
                                <b-button outlined class="button is-small is-danger mr-1" icon-pack="fa" icon-right="trash" @click="confirmDelete(props.row.answer_sheet_id)">DELETE</b-button>
                            </div>
                        </b-table-column> -->

                        
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
            sortField: 'student_id',
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

            search:'',

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
                `searchkey=${this.search}`,
                `page=${this.page}`
            ].join('&')

            this.loading = true
            axios.get(`/panel/ajax-studentlist-result?${params}`)
                .then(({ data }) => {
                    this.data = []
                    let currentTotal = data.total
                    if (data.total / this.perPage > 1000) {
                        currentTotal = this.perPage * 1000
                    }

                    this.total = currentTotal
                    data.forEach((item) => {
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
    },

    mounted(){
        this.loadAsyncData();
    }
        

}
</script>