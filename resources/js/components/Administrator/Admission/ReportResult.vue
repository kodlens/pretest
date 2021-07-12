<template>
    <div>
        <div class="section">
            <div class="table-title">LIST OF STUDENT AND RESULT</div>

            <div class="level">
                <div class="level-left">
                    <div class="level-item">
                        <b-field label="SEARCH" label-position="on-border">
                            <b-input type="text" placeholder="Search Lastname"
                                     v-model="search.lname" @keyup.native.enter="loadAsyncData"/>
                            <b-input type="text" placeholder="Search Firstname"
                                     v-model="search.fname" @keyup.native.enter="loadAsyncData"/>
                        </b-field>
                    </div>
                </div>
                <div class="level-right">
                    <div class="level-item">
                        <b-field label="1st Program" label-position="on-border">
                            <b-select v-model="search.first_program" placeholder="SELECT 1ST PROGRAM" @input="loadAsyncData">
                                <option value="">ALL</option>
                                <option v-for="(item, index) in this.programs" :key="index" :value="item.CCode">{{ item.CCode }}</option>
                            </b-select>
                        </b-field>
                    </div>
                </div>
            </div>


            <div class="level">
                <div class="level-left">
                    <div class="level-item">
                        
                    </div>
                </div>
                <div class="level-right">
                    <div class="level-item">
                        
                    </div>
                </div>
            </div>


        </div>

        <div class="section">
            <div style="display:flex; justify-content: flex-end; margin-bottom: 10px;">
               
                <b-button class="is-small is-success is-outlined" style="margin-right:auto;" icon-pack="fa" icon-right="refresh" @click="loadAsyncData">REFRESH</b-button>
               
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
                    detail-transition = ""
                    aria-next-label="Next page"
                    aria-previous-label="Previous page"
                    aria-page-label="Page"
                    :show-detail-icon=true
                    aria-current-label="Current page"
                    backend-sorting
                    :default-sort-direction="defaultSortDirection"
                    @sort="onSort" class="is-fullwidth">


                    <b-table-column field="user_id" label="User ID" v-slot="props">
                        {{ props.row.user_id }}
                    </b-table-column>

                    <b-table-column field="fullname" label="Fullname" v-slot="props">
                        {{ props.row.lname }}, {{ props.row.fname }} {{ props.row.mname }}
                    </b-table-column>

                    <b-table-column field="fromTo" label="Schedule" v-slot="props">
                        {{ props.row.from }} / {{ props.row.to }}
                    </b-table-column>

                    <b-table-column field="sex" label="Sex" centered v-slot="props">
                        {{ props.row.sex }}
                    </b-table-column>

                    <b-table-column field="program" label="1st Program" v-slot="props">
                        {{ props.row.first_program_choice }}
                    </b-table-column>

                    <b-table-column field="program" label="2nd Program" v-slot="props">
                        {{ props.row.second_program_choice }}
                    </b-table-column>

                    <b-table-column field="abstraction" label="ABSTRACTION" centered numeric v-slot="props">

                        <div v-if="props.row.abstraction < 1">
                            <span style="color:red; font-weight: bold;">{{ props.row.abstraction }}</span>
                        </div>
                        <div v-else style="color: green; font-weight: bold;">
                            {{ props.row.abstraction}}
                        </div>
                    </b-table-column>

                    <b-table-column field="logical" label="LOGICAL" centered numeric v-slot="props">

                        <div v-if="props.row.logical < 1">
                            <span style="color:red; font-weight: bold;">{{ props.row.logical }}</span>
                        </div>
                        <div v-else style="color: green; font-weight: bold;">
                            {{ props.row.logical}}
                        </div>

                    </b-table-column>

                    <b-table-column field="english" label="ENGLISH" centered numeric v-slot="props">

                        <div v-if="props.row.english < 1">
                            <span style="color:red; font-weight: bold;">{{ props.row.english }}</span>
                        </div>
                        <div v-else style="color: green; font-weight: bold;">
                            {{ props.row.english}}
                        </div>

                    </b-table-column>

                    <b-table-column field="numerical" label="NUMERICAL" centered numeric v-slot="props">

                        <div v-if="props.row.numerical < 1">
                            <span style="color:red; font-weight: bold;">{{ props.row.numerical }}</span>
                        </div>
                        <div v-else style="color: green; font-weight: bold;">
                            {{ props.row.numerical}}
                        </div>

                    </b-table-column>

                    <b-table-column field="general" label="GENERAL" centered numeric v-slot="props">

                        <div v-if="props.row.general < 1">
                            <span style="color:red; font-weight: bold;">{{ props.row.general }}</span>
                        </div>
                        <div v-else style="color: green; font-weight: bold;">
                            {{ props.row.general}}
                        </div>

                    </b-table-column>

                    <b-table-column field="total" label="TOTAL" centered numeric v-slot="props">
                        <!-- {{ Number(props.row.general) + Number(props.row.numerical) + Number(props.row.english)
                        + Number(props.row.logical) + Number(props.row.abstraction) }} -->
                        <div v-if="Number(props.row.total) <= 0">
                            <span style="color:white; background-color: red; padding: 3px 10px; border-radius: 5px; font-weight: bold;">{{ props.row.total }}</span>
                        </div>

                        <div v-if="Number(props.row.total) >= 1 && Number(props.row.total) < 45">
                            <span style="color:white; background-color: orange; padding: 3px 10px; border-radius: 5px; font-weight: bold;">{{ props.row.total }}</span>
                        </div>

                        <div v-if="Number(props.row.total) >= 45">
                            <span style="color:white; background-color: green; padding: 3px 10px; border-radius: 5px; font-weight: bold;">{{ props.row.total }}</span>
                        </div>

                    </b-table-column>

                    <b-table-column field="" label="Action" v-slot="props">
                        <div class="buttons">
                            <b-button v-if="props.row.is_submitted == 1" outlined class="button is-small is-link mr-1" 
                                icon-pack="fa" 
                                icon-right="arrow-circle-right" 
                                @click="openModal(props.row)">
                                    READMIT
                            </b-button>

                            <b-button v-else outlined class="button is-small is-success mr-1" 
                                icon-pack="fa" 
                                icon-right="arrow-circle-right" 
                                @click="openModal(props.row)">
                                    ADMIT
                            </b-button>


                        </div>
                    </b-table-column>
                </b-table>
            </div> <!--table container-->

            <div class="buttons">
                <downloadexcel
                    :fetch="loadDataForReport"
                    :fields="json_fields"
                    worksheet="REPORT"
                    :class="btnClass"
                    :before-generate="startDownload"
                    :before-finish="finishDownload"
                    name="student_result.xls">
                    Export to Excel
                </downloadexcel>
            </div>

        </div><!--section-->



        <b-modal v-model="this.isModalActive" has-modal-card
                 trap-focus aria-role="dialog" aria-modal>
            <div class="modal-card" style="height: 350px;">
                <header class="modal-card-head">
                    <p class="modal-card-title">PROGRAMS</p>
                    <button type="button" class="delete"
                            @click="isModalActive = false"/>

                </header>

                <section class="modal-card-body">
                    <div>
                        <b-field label="Add program">
                            <b-taginput
                                v-model="programTags"
                                :data="filteredPrograms"
                                autocomplete
                                field="CCode"
                                icon="label"
                                placeholder="Type a program (eg. BSCS)"
                                @typing="getFilteredTags">
                                <template v-slot="props">
                                    <strong>{{props.option.CCode}}</strong>: {{props.option.CDesc}}
                                </template>
                                <template #empty>
                                    There are no items
                                </template>
                            </b-taginput>
                        </b-field>
                    </div>
                </section>

                <footer class="modal-card-foot">
                    <b-button
                        label="Close"
                        @click="isModalActive=false"></b-button>
                    <b-button
                        label="ADMIT" class="is-success"
                        icon-pack="fa" icon-right="arrow-circle-right"
                        @click="admit"></b-button>
                </footer>
            </div>
        </b-modal>

        <b-loading :is-full-page="isFullPage" v-model="isLoading">
            
        </b-loading>


    </div><!--root div-->
</template>

<script>

import downloadexcel  from "vue-json-excel";

export default {

    props: {
        propPrograms: {
            type: String,
            default: '',
        }
    },

    components: {
        downloadexcel,
    },

    data(){
        return{
            data: [],
            total: 0,
            loading: false,
            sortField: 'user_id',
            sortOrder: 'desc',
            page: 1,
            perPage: 20,
            defaultSortDirection: 'asc',

            isFullPage: true,
            isLoading: false,

            errors: {},

            json_fields: {
                'USER ID' : 'user_id',
                'LASTNAME': 'lname',
                'FIRSTNAME': 'fname',
                'MIDDLENAME': 'mname',
                'SEX': 'sex',
                'EMAIL': 'email',
                '1ST PROGRAM': 'first_program_choice',
                '2ND PROGRAM': 'second_program_choice',
                'PROVINCE': 'province',
                'CITY': 'city',
                'BARANGAY': 'barangay',
                'ABSTRACTION': 'abstraction',
                'LOGICAL REASONING': 'logical',
                'ENGLISH PROFICIENCY': 'english',
                'NUMERICAL REASONING': 'numerical',
                'GENERAL KNWOLEDGE': 'general',
                'TOTAL SCORE': 'total',
                'CREATED AT': 'created_at',
            },

            report_data: [],

            btnClass: {
                'is-success': true,
                'button': true,
                'is-loading':false,
            },

            search: {
                lname: '',
                fname: '',
                first_program: '',
            },

            programs: [],

            filteredPrograms: {},
            isSelectOnly: false,
            programTags: [],
            isModalActive: false,

            selectedData: {},


        }
    },

    methods: {

        loadAsyncData() {
            const params = [
                `sort_by=${this.sortField}.${this.sortOrder}`,
                `perpage=${this.perPage}`,
                `lname=${this.search.lname}`,
                `fname=${this.search.fname}`,
                `first_program=${this.search.first_program}`,
                `page=${this.page}`
            ].join('&')

            this.loading = true
            axios.get(`/panel/ajax-studentlist-result?${params}`).then(({ data }) => {
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

        loadDataForReport: async function(){
            const params = [
                `first_program=${this.search.first_program}`
            ].join('&')

            const response = await axios.get(`/panel/report-excel-studentlist-result?${params}`);
            return response.data;
        },
        startDownload(){
            this.btnClass['is-loading'] = true;
        },
        finishDownload(){
            this.btnClass['is-loading'] = false;
        },


        openModal: function(dataRow){
            this.programTags = []; //init
            this.errors = {};
            this.isModalActive = true;
            this.selectedData = dataRow;

            //if 1st program is same with 2nd program, then ignore the 2nd program
            if(dataRow.first_program_choice !== dataRow.second_program_choice){
                this.programTags.push({
                    CCode: dataRow.first_program_choice,
                });
                this.programTags.push({
                    CCode: dataRow.second_program_choice,
                });
            }else{
                this.programTags.push({
                    CCode: dataRow.first_program_choice,
                });
            }
            
           // console.log(dataRow.first_program_choice);
        },
        getFilteredTags: function(text) {
            this.filteredPrograms = this.programs.filter((option) => {
                return option.CCode.toString().toLowerCase().indexOf(text.toLowerCase()) >= 0
            })
        },

        admit: function(){
            if(this.programTags.length < 1){
                //this.errors.programTag = 'No program selected. Please select atleast 1 program.';
                alert('No program selected. Please select atleast 1 program.');
                return;
            }

            this.isModalActive = false;
            this.isLoading = true;

            axios.post('/admit-student', {
                fields: this.selectedData,
                programs: this.programTags
            }).then(res=>{
                //console.log(res.data);
                
                this.isModalActive = false;
                this.isLoading = false;
                if(res.data.status === 'mailed'){
                    this.$buefy.dialog.alert({
                        title: 'SUCCESSFULLY EMAILED.',
                        message: 'Student was successfully emailed with there admission code.',
                        type: 'is-success',
                        onConfirm: ()=> this.loadAsyncData()
                    })
                }
            })

        },

        //initialize data
        initData: function(){
            this.programs = JSON.parse(this.propPrograms);
            this.filteredPrograms = this.programs;

            this.loadAsyncData();
        }
    },

    mounted(){
        this.initData();

    }


}
</script>


<style scoped>


</style>

