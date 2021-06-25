<template>
    <div>
        <section class="section">
            <div style="font-size: 20px; text-align: center; font-weight: bold;">LIST OF SCHEDULES</div>
            <div class="columns">
                <div class="column is-8 is-offset-2">
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
                                <b-field label="Search" label-position="on-border">
                                    <b-input type="text" placeholder="Search Description..."
                                        v-model="search.description" @keyup.native.enter="loadAsyncData" />
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
                        @page-change="onPageChange"
                        aria-next-label="Next page"
                        aria-previous-label="Previous page"
                        aria-page-label="Page"
                        aria-current-label="Current page"
                        backend-sorting
                        :default-sort-direction="defaultSortDirection"
                        @sort="onSort">

                        <b-table-column field="test_schedule_id" label="ID" v-slot="props">
                            {{ props.row.test_schedule_id }}
                        </b-table-column>

                        <b-table-column field="description" label="Description" v-slot="props">
                            {{ props.row.description }}
                        </b-table-column>

                        <b-table-column field="from" label="From" v-slot="props">
                            {{ props.row.from }}
                        </b-table-column>

                        <b-table-column field="to" label="To" v-slot="props">
                            {{ props.row.to }}
                        </b-table-column>

                        <b-table-column field="max_user" label="Max Examinee" v-slot="props">
                            {{ props.row.max_user }}
                        </b-table-column>

                        <b-table-column field="ay_id" label="Action" v-slot="props">
                            <div class="is-flex">
                                <b-button class="button is-small is-warning mr-1" tag="a" icon-right="pencil" icon-pack="fa" :href="'/panel/test-schedule/'+ props.row.test_schedule_id + '/edit'"></b-button>
                                <b-button class="button is-small is-danger mr-1" icon-pack="fa" icon-right="trash" @click="confirmDelete(props.row.test_schedule_id)"></b-button>
                            </div>
                        </b-table-column>

                    </b-table>

                    <div class="buttons mt-3">
                        <!-- <b-button tag="a" href="/cpanel-academicyear/create" class="is-primary">Create Account</b-button> -->
                        <b-button icon-pack="fa" icon-left="plus" tag="a"
                            :href="'/panel/test-schedule/create'" class="is-primary">New Schedule</b-button>
                    </div>
                </div><!--close column-->
            </div>
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
            perPage: 5,
            defaultSortDirection: 'asc',

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
                description: '',
            }

        }
    },
    methods: {
        loadAsyncData() {
            const params = [
                `sort_by=${this.sortField}.${this.sortOrder}`,
                `perpage=${this.perPage}`,
                `page=${this.page}`,
                `description=${this.search.description}`
            ].join('&')

            this.loading = true
            axios.get(`/fetch-test-schedules?${params}`)
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


        //actions here below

        deleteSubmit(delete_id){
            axios.delete('/panel/test-schedule/'+ delete_id).then(res=>{
                this.loadAsyncData();
            }).catch(err=>{
                console.log(err);
            });
        },


        //alert
        confirmDelete(delete_id) {
            this.$buefy.dialog.confirm({
                title: 'DELETE!',
                type: 'is-danger',
                message: 'Are you sure you want to delete this data?',
                cancelText: 'Cancel',
                confirmText: 'Delete',
                onConfirm: () => this.deleteSubmit(delete_id)
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
