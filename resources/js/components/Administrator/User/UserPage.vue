<template>
    <div>
        <div class="section">
            <div class="table-title">LIST OF USER</div>

            <div class="level">
                <div class="level-left">
                    <div class="level-item">
                        <b-field label="PAGE" label-position="on-border">
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
                        <b-field label="SEARCH" label-position="on-border">
                            <b-input type="input" v-model="search.lname" placeholder="Search Lastname..." @keyup.native.enter="loadAsyncData" />
                            <b-input type="input" v-model="search.fname" placeholder="Search Firstname..." @keyup.native.enter="loadAsyncData" />
                        </b-field>

                    </div>
                </div>
            </div>

            <div class="level">
                <div class="level-left">
                    <div class="level-right">
                        <div class="level-item">
                            <b-field label="SEARCH" label-position="on-border">
                                <b-input type="input" v-model="search.user_id" placeholder="Search User ID..." @keyup.native.enter="loadAsyncData" />
                            </b-field>
                        </div>
                    </div>
                </div>
            </div>

            <div style="display:flex; justify-content: flex-end;">
                <p style="font-weight: bold; margin-bottom: 10px;">TOTAL ROWS: {{ total }} </p>
            </div>

            <div class="table-container">
                <b-table
                    :data="data"
                    :loading="loading"
                    paginated
                    backend-pagination
                    :total="total"
                    narrowed
                    :per-page="perPage"
                    @page-change="onPageChange"
                    aria-next-label="Next page"
                    aria-previous-label="Previous page"
                    aria-page-label="Page"
                    aria-current-label="Current page"
                    backend-sorting
                    :default-sort-direction="defaultSortDirection"
                    @sort="onSort">

                    <b-table-column field="user_id" label="ID" v-slot="props">
                        {{ props.row.user_id }}
                    </b-table-column>

                    <b-table-column field="username" label="Username" v-slot="props">
                        {{ props.row.username }}
                    </b-table-column>

                    <b-table-column field="lname" label="Lastname" v-slot="props">
                        {{ props.row.lname }}
                    </b-table-column>

                    <b-table-column field="fname" label="Firstname" v-slot="props">
                        {{ props.row.fname }}
                    </b-table-column>

                    <b-table-column field="mname" label="Middlename" v-slot="props">
                        {{ props.row.mname }}
                    </b-table-column>

                    <b-table-column field="mname" label="Email" v-slot="props">
                        {{ props.row.email }}
                    </b-table-column>

                    <b-table-column field="email_verified_at" label="Verified At" v-slot="props">
                        {{ props.row.email_verified_at }}
                    </b-table-column>

                    <b-table-column field="role" label="Role" v-slot="props">
                        {{ props.row.role }}
                    </b-table-column>

                    <b-table-column field="" label="Action" v-slot="props">
                        <div class="buttons" style="width: 120px;">
                            <b-button class="button is-small is-success is-outlined mr-1" tag="a" icon-right="envelope-o" icon-pack="fa" @click="verifyEmail(props.row)"></b-button>
                            <b-button class="button is-small is-warning mr-1" tag="a" icon-right="pencil" icon-pack="fa" :href="'/panel/user/'+ props.row.user_id + '/edit'"></b-button>
                            <b-button class="button is-small is-danger mr-1" icon-pack="fa" icon-right="trash" @click="confirmDelete(props.row.user_id)"></b-button>
                        </div>
                    </b-table-column>
                </b-table>
            </div>
            

             <div class="buttons mt-3">
                <!-- <b-button tag="a" href="/cpanel-academicyear/create" class="is-primary">Create Account</b-button> -->
                <b-button icon-pack="fa" icon-left="plus" tag="a" href="/panel/user/create" class="is-primary">New User</b-button>
            </div>


        </div><!--section-->
    </div>
</template>

<script>
export default {

    data(){
        return{
            data: [],
            total: 0,
            loading: false,
            sortField: 'user_id',
            sortOrder: 'desc',
            page: 1,
            perPage: 10,
            defaultSortDirection: 'asc',

            isModalCreate: false,

            dataId: 0,


            fields: {},
            errors : {},

            btnClass: {
                'is-success': true,
                'button': true,
                'is-loading':false,
            },

            search: {
                lname: '',
                fname: '',
                user_id: '',
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
                `fname=${this.search.fname}`,
                `user_id=${this.search.user_id}`
            ].join('&')

            this.loading = true
            axios.get(`/axios-users?${params}`)
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
            axios.delete('/panel/user/'+ delete_id).then(res=>{
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

        verifyEmail: function(dataRow){
            axios.post('/verify-email-students/' + dataRow.user_id).then(res=>{
                console.log(res.data);
                if(res.data.status === 'verified'){
                    this.$buefy.dialog.alert({
                        title: 'EMAIL VERIFIED',
                        message: 'Email successfully verified.',
                        type: 'is-sucess',
                        onConfirm: ()=> this.loadAsyncData()
                    })
                }
            })
        },


    },

    mounted(){
        this.loadAsyncData();
    }

}
</script>

<style scoped>

</style>
