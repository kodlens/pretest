<template>
    <div>
        <div class="hero is-fullheight-with-navbar">
            <div class="hero-body">
                <div class="container">
                    <div class="columns">
                        <div class="column is-8 is-offset-2">

                            <b-notification v-if="isTaken == 1"
                                type="is-danger"
                                aria-close-label="Close notification"
                                role="alert">
                                You already taken the test.
                            </b-notification>

                            <div class="horizontal-word">
                                <span>PLEASE READ ME!</span>
                            </div>
                            <div class="instruction">

                                <p>Good day our dear freshmen! You are about to take the GADTC Admission Test (GADTest) which was postponed because of the pandemic.
                                    This is a 90 item test that you should take for only 45 minutes.
                                    A timer is found at the bottom for your reference.
                                    Rest assured all information that you will input in the test will be kept confidential.
                                    Please refrain taking screenshots and posting any of the questions of the test.
                                    If you are ready, click the button below.
                                </p>

                            </div>
                            <div class="buttons is-centered">
                                <a href="/student/taking-exam" class="button is-primary is-outlined">
                                    <b-icon pack="fa" icon="file-text-o"></b-icon> &nbsp;&nbsp;START TEST NOW
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    props: ['isTaken'],

    data() {
        return {

        }
    },

    methods: {

    }

}
</script>

<style scoped>
    .instruction{
        display: flex;
        justify-content: center;
        text-align: justify;
        font-size: 20px;
        font-weight: bold;
        margin: 15px;
        border-bottom: 1px solid darkgreen;
        padding: 15px;
    }

    .horizontal-word {
        width: 100%;
        text-align: center;
        border-bottom: 1px solid darkgreen;
        line-height: 0.1em;
        margin: 10px 0 20px;
        font-weight: bold;
    }

    .horizontal-word > span {
        background: #fff;
        padding: 0 10px;
        color: darkgreen;
    }

</style>
