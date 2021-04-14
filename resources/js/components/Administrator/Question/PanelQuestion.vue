<template>
    <div>
        <div class="section">
            <div style="font-size: 20px; text-align: center; font-weight: bold;">LIST OF QUESTIONS</div>
            <div class="columns">
                <div class="column is-8 is-offset-2">
                    <b-field label="Page">
                        <b-select v-model="perPage" @input="setPerPage">
                            <option value="5">5 per page</option>
                            <option value="10">10 per page</option>
                            <option value="15">15 per page</option>
                            <option value="20">20 per page</option>
                        </b-select>
                    </b-field>

                    <div class="buttons mt-3">
                        <!-- <b-button tag="a" href="/cpanel-academicyear/create" class="is-primary">Create Account</b-button> -->
                        <b-button @click="openModal" class="is-primary">Create Section</b-button>
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
                            {{ props.row.question_id }}
                        </b-table-column>

                        <b-table-column field="question" label="Question" v-slot="props">
                            {{ props.row.question }}
                        </b-table-column>

                        <b-table-column field="points" label="Points" v-slot="props">
                            {{ props.row.points }}
                        </b-table-column>

                        <b-table-column field="ay_id" label="Action" v-slot="props">
                            <div class="is-flex">
                                <b-button outlined class="button is-small is-warning mr-1" tag="a" icon-right="pencil" icon-pack="fa" @click="getData(props.row.category_id)">EDIT</b-button>
                                <b-button outlined class="button is-small is-danger mr-1" icon-pack="fa" icon-right="trash" @click="confirmDelete(props.row.category_id)">DELETE</b-button>
                            </div>
                        </b-table-column>

                    </b-table>                    
                </div><!--close column-->
            </div>
        </div>

        <!--modal create-->
        <b-modal v-model="isModalCreate" has-modal-card
                    trap-focus
                    :width="640"
                    aria-role="dialog"
                    aria-label="Example Modal"
                    aria-modal>

            <form @submit.prevent="submit">
                <div class="modal-card">
                    <header class="modal-card-head">
                        <p class="modal-card-title">Category</p>
                        <button
                            type="button"
                            class="delete"
                            @click="isModalCreate = false"/>
                    </header>
                    <section class="modal-card-body">
                        <div class="">
                            <b-field label="Category"
                                        :type="this.errors.category ? 'is-danger':''"
                                        :message="this.errors.category ? this.errors.category[0] : ''">
                                <b-input v-model="fields.category"
                                            placeholder="Category" required>
                                </b-input>
                            </b-field>
                            <b-field label="Order No"
                                        :type="this.errors.order_no ? 'is-danger':''"
                                        :message="this.errors.order_no ? this.errors.order_no[0] : ''">
                                <b-input v-model="fields.order_no"
                                            placeholder="Order No" required>
                                </b-input>
                            </b-field>

                        </div>
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
            sortField: 'section_id',
            sortOrder: 'desc',
            page: 1,
            perPage: 5,
            defaultSortDirection: 'asc',

            isModalCreate: false,

            fields: {},
            errors : {},

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

        },

        
    }

}
</script>

<style scoped>

</style>
