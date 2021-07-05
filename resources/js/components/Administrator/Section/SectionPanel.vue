<template>
    <div>
        <section class="section">
        <div style="font-size: 20px; text-align: center; font-weight: bold;">LIST OF SECTION</div>
        <div class="columns">
            <div class="column is-8 is-offset-2">
                <div class="level">
                    <div class="level-right">
                        <div class="level-item">
                            <b-field label="Page">
                                <b-select v-model="perPage" @input="setPerPage">
                                    <option value="5">5 per page</option>
                                    <option value="10">10 per page</option>
                                    <option value="15">15 per page</option>
                                    <option value="20">20 per page</option>
                                </b-select>
                            </b-field>
                        </div>
                    </div>

                    <div class="level-left">
                        <div class="level-item">
                            <b-field label="Search Section">
                                <b-input type="text" v-model="search.section" placeholder="Search section..." @keyup.native.enter="loadAsyncData"/>
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
                    aria-next-label="Next page"
                    aria-previous-label="Previous page"
                    aria-page-label="Page"
                    aria-current-label="Current page"
                    backend-sorting
                    :default-sort-direction="defaultSortDirection"
                    @sort="onSort">

                    <b-table-column field="category_id" label="ID" v-slot="props">
                        {{ props.row.section_id }}
                    </b-table-column>

                    <b-table-column field="category" label="Category" searchable v-slot="props">
                        {{ props.row.section }}
                    </b-table-column>

                    <b-table-column field="ay_id" label="Action" v-slot="props">
                        <div class="is-flex">
                            <b-button outlined class="button is-small is-warning mr-1" tag="a" icon-right="pencil" icon-pack="fa" @click="getData(props.row.category_id)">EDIT</b-button>
                            <b-button outlined class="button is-small is-danger mr-1" icon-pack="fa" icon-right="trash" @click="confirmDelete(props.row.category_id)">DELETE</b-button>
                        </div>
                    </b-table-column>

                </b-table>

                <div class="buttons mt-3">
                    <!-- <b-button tag="a" href="/cpanel-academicyear/create" class="is-primary">Create Account</b-button> -->
                    <b-button @click="openModal" class="is-primary is-fullwidth">Create Section</b-button>
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
            sortField: 'section_id',
            sortOrder: 'desc',
            page: 1,
            perPage: 5,
            defaultSortDirection: 'asc',

            isModalCreate: false,

            dataId: 0,


            fields: {},
            errors : {},

            search: {
                section: '',
            },

            btnClass: {
                'is-success': true,
                'button': true,
                'is-loading':false,
            },

        }
    },
    methods: {
        loadAsyncData() {
            const params = [
                `sort_by=${this.sortField}.${this.sortOrder}`,
                `perpage=${this.perPage}`,
                `page=${this.page}`,
                `section=${this.search.section}`
            ].join('&')

            this.loading = true
            axios.get(`/fetch-sections?${params}`)
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
            axios.delete('/api/category/'+ delete_id).then(res=>{
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


        //save data
        submit(){
            this.btnClass['is-loading'] = true;

            if(this.dataId > 0){
                //update
                axios.post('/api/category/'+this.dataId, this.fields).then(res=>{
                    this.fields = {};
                    this.errors = {};
                    this.loadAsyncData()
                    this.btnClass['is-loading'] = false;
                    this.isModalCreate = false;


                }).catch(err=>{
                    if(err.response.status===422){
                        this.errors = err.response.data.errors;
                    }
                    //console.log(err.response.status);
                    this.btnClass['is-loading'] = false;
                })
            }else{
                //insert
                axios.post('/api/category', this.fields).then(res=>{
                    this.fields = {};
                    this.errors = {};
                    this.loadAsyncData()
                    this.btnClass['is-loading'] = false;
                    this.isModalCreate = false;
                }).catch(err=>{
                    if(err.response.status===422){
                        this.errors = err.response.data.errors;
                    }

                    //console.log(err.response.status);
                    this.btnClass['is-loading'] = false;
                })
            }

        },

        //getData
        getData(data_id){
            this.fields = {};
            this.isModalCreate = true;
            this.dataId = data_id;

            axios.get('/api/category/' + data_id).then(res=>{
                this.fields = res.data[0];
                console.log(res.data);
            })
        },

        openModal(){
            this.isModalCreate = true;
            this.dataId = 0;

            this.fields ={};
            this.errors = {};

        },


    },

    mounted(){
        this.loadAsyncData();
    }

}
</script>

<style scoped>

</style>
