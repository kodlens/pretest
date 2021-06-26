<template>
    <div>
        <b-field label="Schedule">

            <b-input :value="valueDesc" expanded icon-pack="fa"
                     icon="globe" placeholder="SELECT SCHEDULE" required readonly>
            </b-input>

            <p class="control">
                <b-button class="button is-primary" @click="openModal">...</b-button>
            </p>
        </b-field>


        <b-modal v-model="this.isModalActive" has-modal-card
                 trap-focus width="640" aria-role="dialog" aria-modal>
            <div class="modal-card">
                <header class="modal-card-head">
                    <p class="modal-card-title">Schedules</p>
                    <button type="button" class="delete"
                            @click="isModalActive = false"/>

                </header>

                <section class="modal-card-body">
                    <div>

                        <b-field label="Search" label-position="on-border" >
                            <b-input type="text" v-model="search.description" placeholder="Search..." expanded auto-focus></b-input>
                            <p class="control">
                                <b-button class="is-primary" icon-pack="fa" icon-left="search" @click="loadAsyncData"></b-button>
                            </p>
                        </b-field>


                        <b-table
                            :data='data'
                            :loading="loading"
                            paginated
                            backend-pagination
                            :total='total'
                            :per-page="perPage"
                            @page-change="onPageChange"
                            detail-transition=""
                            aria-next-label="Next page"
                            aria-previous-label="Previouse page"
                            aria-page-label="Page"
                            :show-detail-icon=true
                            aria-current-label="Current page"
                            default-sort-direction="defualtSortDirection"
                            @sort="onSort">

                            <b-table-column field="test_schedule_id" label="ID" v-slot="props">
                                {{props.row.test_schedule_id}}
                            </b-table-column>

                            <b-table-column field="description" label="Description" v-slot="props">
                                {{props.row.description.toUpperCase()}}
                            </b-table-column>

                            <b-table-column field="from" label="From" v-slot="props">
                                {{props.row.from}}
                            </b-table-column>

                            <b-table-column field="to" label="To" v-slot="props">
                                {{props.row.to}}
                            </b-table-column>

                            <b-table-column field="" label="Action" v-slot="props">
                                <div class="buttons">
                                    <b-button class="is-small is-warning" @click="selectData(props.row)">
                                        <i class="fa fa-pencil"></i>&nbsp;&nbsp;SELECT</b-button>
                                </div>
                            </b-table-column>
                        </b-table>
                    </div>
                </section>

                <footer class="modal-card-foot">
                    <b-button
                        label="Close"
                        @click="isModalActive=false"></b-button>
                </footer>
            </div>
        </b-modal>


    </div>
</template>

<script>
export default {
    props: {
        propDesc: {
            type: String,
            default: '',
        },
    },
    data(){
        return{
            data: [],
            total: 0,
            loading: false,
            sortfield: 'test_schedule_id',
            sortOrder:'desc',
            page: 1,
            perPage: 5,
            defaultSortDirection:'',

            isModalActive: false,
            errors:{},

            search: {
                description: '',
            },

            schedules: {},

        }
    },
    methods: {
        loadAsyncData() {
            const params = [
                `sort_by=${this.sortfield}.${this.sortOrder}`,
                `perpage=${this.perPage}`,
                `page=${this.page}`,
                `description=${this.search.description}`,

            ].join('&');

            this.loading = true;
            axios.get(`/fetch-schedules?${params}`).then(({data}) => {
                this.data = [];
                let currentTotal = data.total;
                if (data.total / this.perPage > 1000) {
                    currentTotal = this.perPage * 1000;
                }

                this.total = currentTotal;
                data.data.forEach((item) => {
                    this.data.push(item);
                });

                this.loading = false;
            }).catch(err => {
                this.data = [];
                this.total = 0;
                this.loading = false;
                throw err;
            });

        },

        onPageChange(page) {
            this.page = page;
            this.loadAsyncData();
        },

        onSort(field, order) {
            this.sortfield = field;
            this.sortOrder = order;
            this.loadAsyncData();
        },

        setPerPage() {
            this.loadAsyncData();
        },

        openModal(){
            this.loadAsyncData();
            this.isModalActive = true;
        },

        selectData(dataRow){
            this.isModalActive = false;
            this.schedules.desc = dataRow.description.toUpperCase();

            this.$emit('description', dataRow.description.toUpperCase());
        }

    },

    computed: {
        valueDesc(){
            //this.schedules.desc = this.schedules;
            return this.propDesc;
        }
    },

}
</script>

<style scoped>

</style>
