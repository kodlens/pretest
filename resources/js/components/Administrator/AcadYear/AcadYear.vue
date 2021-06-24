<template>
    <div>
        <section class="section">
            <div style="font-size: 20px; text-align: center; font-weight: bold;">LIST OF ACADEMIC YEAR</div>
            <div class="columns">
                <div class="column is-8 is-offset-2">
                    <div class="level">
                        <div class="level-left">
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

                        <div class="level-right">
                            <div class="level-item">
                                <b-field label="Search Code">
                                    <b-input type="text" v-model="search.code" placeholder="Code..."
                                        @keyup.native.enter="loadAsyncData"></b-input>
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

                        <b-table-column field="acad_year_id" label="ID" v-slot="props">
                            {{ props.row.acad_year_id }}
                        </b-table-column>

                        <b-table-column field="code" label="Code" v-slot="props">
                            {{ props.row.code }}
                        </b-table-column>

                        <b-table-column field="description" label="Description" v-slot="props">
                            {{ props.row.description }}
                        </b-table-column>

                        <b-table-column field="descriactiveption" label="Active" v-slot="props">
                            <span v-if="props.row.active === 1" class="active">ACTIVE</span>
                            <span v-else class="inactive">NO</span>
                        </b-table-column>

                        <b-table-column field="ay_id" label="Action" v-slot="props">
                            <div class="is-flex">
                                <b-button class="button is-small is-warning mr-1" icon-right="pencil" icon-pack="fa" @click="openModal(props.row.acad_year_id)"></b-button>
                                <b-button class="button is-small is-danger mr-1" icon-pack="fa" icon-right="trash" @click="confirmDelete(props.row.acad_year_id)"></b-button>
                            </div>
                        </b-table-column>

                    </b-table>

                    <div class="buttons mt-3">
                        <!-- <b-button tag="a" href="/cpanel-academicyear/create" class="is-primary">Create Account</b-button> -->
                        <b-button icon-pack="fa" icon-left="plus" @click="openModal(0)" class="is-primary">New Acad Year</b-button>
                    </div>
                </div><!--close column-->
            </div>
        </section>

        <b-modal v-model="isModalActive" has-modal-card
                 trap-focus width="640" aria-role="dialog" aria-modal>
            <div class="modal-card">
                <form @submit.prevent="submit">
                    <header class="modal-card-head">
                        <p class="modal-card-title">Academic Year</p>
                        <button type="button" class="delete"
                                @click="isModalActive = false"/>

                    </header>

                    <section class="modal-card-body">
                        <div>

                            <b-field label="Code"
                                :type="this.errors.code ? 'is-danger': ''"
                                :message="this.errors.code ? this.errors.code[0] : ''">
                                <b-input type="text" v-model="fields.code" placeholder="Code" expanded></b-input>
                            </b-field>

                            <b-field label="Description"
                                :type="this.errors.description ? 'is-danger': ''"
                                :message="this.errors.description ? this.errors.description[0] : ''">
                                <b-input type="text" v-model="fields.description" placeholder="Description" expanded></b-input>
                            </b-field>
                            <b-field label="Active">
                                <b-checkbox v-model="fields.active">
                                    <span v-if="fields.active === true">YES</span>
                                    <span v-else>NO</span>
                                </b-checkbox>
                            </b-field>

                        </div>
                    </section>

                    <footer class="modal-card-foot">
                        <b-button
                            label="Close"
                            @click="isModalActive=false"></b-button>

                            <button class="button is-success">SAVE</button>
                    </footer>
                </form>
            </div>
        </b-modal>


    </div>
</template>

<script>
export default {

    data(){
        return{
            data: [],
            total: 0,
            loading: false,
            sortField: 'acad_year_id',
            sortOrder: 'desc',
            page: 1,
            perPage: 5,
            defaultSortDirection: 'asc',

            isModalActive: false,

            dataId: 0,

            fields: {
                active: false,
            },
            search: {
                code: ''
            },

            errors : {},
            globalId: 0,


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
                `code=${this.search.code}`,
            ].join('&')

            this.loading = true
            axios.get(`/fetch-acadyears?${params}`)
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
            axios.delete('/panel/acadyear/'+ delete_id).then(res=>{
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
                this.getData(id);
            }
            this.isModalActive = true;

        },

        getData(id){
            axios.get('/panel/acadyear/' + id).then(res=>{
                this.fields = res.data;
                this.fields.active = res.data.active === 1 ? true : false;
            })
        },

        submit(){
            if(this.globalId > 0){
                axios.put('/panel/acadyear/'+this.globalId, this.fields).then(res=>{
                    if(res.data.status === 'updated'){
                        this.isModalActive = false;
                        this.loadAsyncData()

                    }
                }).catch(err=>{
                    if(err.response.status === 422){
                        this.errors = err.response.data.errors;
                    }
                })
            }else{
                axios.post('/panel/acadyear', this.fields).then(res=>{
                    if(res.data.status === 'saved'){
                        this.isModalActive = false;

                        this.loadAsyncData()
                    }
                }).catch(err=>{
                    if(err.response.status === 422){
                        this.errors = err.response.data.errors;
                    }
                })
            }
        },


    },

    mounted(){
        this.loadAsyncData();
    }

}
</script>

<style scoped>
    .active{
        padding: 5px 15px;
        background-color: green;
        color: white;
        font-size: 12px;
        font-weight: bold;
    }

    .inactive{
        padding: 5px 15px;
        background-color: red;
        color: white;
        font-size: 12px;
        font-weight: bold;
    }
</style>
