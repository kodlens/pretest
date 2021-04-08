<template>
    <div>
        <input type="hidden" name="_token" :value="csrf" />
    </div>
</template>

<script>

export default {
    data(){
        return{
            csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
        }
    }
}
</script>
