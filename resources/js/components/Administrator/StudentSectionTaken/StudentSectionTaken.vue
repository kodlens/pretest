<template>
    <div>
        <section class="section">
            <div class="table-title">LIST OF STUDENT TAKEN</div>

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
                        <b-field label="Search Lastname" label-position="on-border">
                            <b-input type="text" placeholder="Search Lastname..."
                                     v-model="search.lname" @keyup.native.enter="loadAsyncData" />
                        </b-field>
                    </div>

                    <div class="level-item">
                        <b-field label="Search Firstname" label-position="on-border">
                            <b-input type="text" placeholder="Search Firstname..."
                                     v-model="search.fname" @keyup.native.enter="loadAsyncData" />
                        </b-field>
                    </div>
                </div>
            </div>

            <div style="display:flex; justify-content: flex-end;">
                <p style="font-weight: bold; margin-bottom: 10px;">TOTAL ROWS: {{ total }} </p>
            </div>

            <b-table
                :data="data"
                :loading="loading"
                paginated
                backend-pagination
                :total="total"
                :per-page="perPage"
                :range-before="rangeBefore"
                :range-after="rangeAfter"
                @page-change="onPageChange"
                aria-next-label="Next page"
                aria-previous-label="Previous page"
                aria-page-label="Page"
                aria-current-label="Current page"
                backend-sorting
                :default-sort-direction="defaultSortDirection"
                @sort="onSort">

                <b-table-column field="taking_test_id" label="ID" v-slot="props">
                    {{ props.row.taking_test_id }}
                </b-table-column>

                <b-table-column field="code" label="AY Code" v-slot="props">
                    {{ props.row.code }}
                </b-table-column>

                <b-table-column field="fullname" label="Fullname" v-slot="props">
                    {{ props.row.lname }}, {{ props.row.fname }} {{ props.row.mname }}
                </b-table-column>

                <b-table-column field="from" label="From/To" v-slot="props">
                    {{ props.row.from }} - {{ props.row.from }}
                </b-table-column>

                <b-table-column field="section" label="Section" v-slot="props">
                    {{ props.row.section }}
                </b-table-column>

                <b-table-column field="created_date" label="Time Taken" v-slot="props">
                    {{ props.row.created_date }} {{ props.row.created_time }}
                </b-table-column>

                <b-table-column field="ay_id" label="Action" v-slot="props">
                    <div class="is-flex">
                        <!-- <b-button class="button is-small is-warning mr-1" tag="a" icon-right="pencil" icon-pack="fa" :href="'/panel/test-schedule/'+ props.row.test_schedule_id + '/edit'"></b-button> -->
                        <b-button class="button is-small is-danger mr-1" icon-pack="fa" icon-right="trash" @click="confirmDelete(props.row)"></b-button>
                    </div>
                </b-table-column>

            </b-table>

        </section>

    </div>
</template>

<script>
export default {

    data(){
        return{
            data: [],
            total: 0,
            loading: false,
            sortField: 'test_schedule_id',
            sortOrder: 'desc',
            page: 1,
            perPage: 10,
            defaultSortDirection: 'asc',
            rangeBefore: 5,
            rangeAfter: 5,

            isModalActive: false,

            dataId: 0,

            fields: {},
            errors : {},
            globalId: 0,


            btnClass: {
                'is-success': true,
                'button': true,
                'is-loading':false,
            },

            search: {
                lname: '',
                fname: '',
            }

        }
    },
    methods: {
        loadAsyncData() {
            const params = [
                `sort_by=${this.sortField}.${this.sortOrder}`,
                `perpage=${this.perPage}`,
                `page=${this.page}`,
                `lname=${this.search.lname}`,
                `fname=${this.search.fname}`
            ].join('&')

            this.loading = true;
            axios.get(`/fetch-student-section-taken?${params}`)
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
            this.sortField = field;
            this.sortOrder = order;
            this.loadAsyncData();
        },

        setPerPage(){
            this.loadAsyncData()
        },


        //actions here below

        deleteSubmit(dataRow){
            axios.post('/delete-student-section-taken', dataRow).then(res=>{
                this.loadAsyncData();
            }).catch(err=>{
                console.log(err);
            });
        },


        //alert

        confirmDelete(dataRow) {
            this.$buefy.dialog.confirm({
                title: 'DELETE!',
                type: 'is-danger',
                message: 'Are you sure you want to delete this data? This will also delete the answers record of this section',
                cancelText: 'Cancel',
                confirmText: 'Delete',
                onConfirm: () => this.deleteSubmit(dataRow)
            });
        },

        openModal(id){
            this.fields = {};
            this.errors = {};
            this.globalId = 0;

            if(id > 0){
                this.globalId = id;
                this.getData();
            }
            this.isModalActive = true;

        },

        getData(){

        },


    },

    mounted(){
        this.loadAsyncData();
    }

}
</script>

<style scoped>

</style>
