<template>
    <div>
        <div class="section">
            <div class="section-wrapper">
                <a :href="'/taking-exam/'+schedid+'/'+item.section_id" v-for="(item, index) in sectionsJSON" :key="index" class="img-wrapper">
                    <img :src="'/img/' + item.img_filename" class="img-size" alt="..." />
                    <p>SECTION: {{ item.section }}</p>
                    <p>TIME: {{ item.set_time }} minutes</p>
                </a>
            </div>
        </div>
    </div><!--root div-->
</template>

<script>


export default {
    props:['sections', 'schedid'],
    data(){
        return{
            sectionsJSON: null,
        }
    },

    methods: {
        initializeData(){
            this.sectionsJSON = JSON.parse(this.sections);
        }
    },

    mounted() {
        this.initializeData()
    }
}
</script>

<style scoped>
    .section-wrapper{
        margin: auto;
        display: flex;
        flex-direction: column;
        justify-content: space-evenly;
        max-width: 500px;
    }

    .img-wrapper{
        /* border: 1px solid red; */
        margin: 15px;
        padding: 15px;
        border-radius: 10px;
        border: 1px solid #c7c7c7;
        transition: all 0.2s ease;
    }

    .img-wrapper:hover{

        box-shadow: 1px 1px 25px green;
    }

    .img-size{
        height: 150px;
    }

    /* @media screen and (max-width: 992px) {
        .section-wrapper{

            justify-content:center;
            flex-direction: column;
            align-items: center;

        }

    } */
</style>

