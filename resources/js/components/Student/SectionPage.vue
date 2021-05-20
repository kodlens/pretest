<template>
    <div>
        <div class="section">
            <div class="section-wrapper">
                
                <div class="img-wrapper">
                    <img src="img/abstraction.svg" class="img-size" alt="..." />
                </div>

                <div class="img-wrapper">
                    <img src="img/logical.svg" class="img-size" alt="..." />
                </div>

                <div class="img-wrapper">
                    <img src="img/english.svg" class="img-size" alt="..." />
                </div>

                <div class="img-wrapper">
                    <img src="img/numerical.svg" class="img-size" alt="..." />
                </div>

                <div class="img-wrapper">
                    <img src="img/general.svg" class="img-size" alt="..." />
                </div>
            </div>
        </div>
    </div><!--root div-->
</template>

<script>
export default {
    
}
</script>

<style scoped>
    .section-wrapper{
        margin: 20px;
        display: flex;
        justify-content: space-evenly;
    }

    .img-wrapper{
        /* border: 1px solid red; */
        margin: 15px;
        padding: 15px;
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

