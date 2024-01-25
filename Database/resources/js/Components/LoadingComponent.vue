<template>
    <div v-show="loading" class="loader"></div>
</template>

<script>
    import { useStore } from '../store';

    export default {
        computed: {
            loading () {
                return useStore().getLoading
            }
        }
    }
</script>

<style lang="scss" scoped>
    @import '../../scss/variables';
    .loader {
        position: relative;
        height: 4px;
        width: 100%;
        overflow: hidden;
        margin-bottom: -4px;
    }

    .loader::after {
        content: '';
        width: 192px;
        height: 4.8px;
        position: absolute;
        top: 0;
        left: 0;
        box-sizing: border-box;
        animation: animloader 2s linear infinite;
        background-image: linear-gradient(to right, $v2-white-primary, $v2-teal-primary, $v2-white-primary);
    }

    @keyframes animloader {
        0% {
            left: 0;
            transform: translateX(-100%);
        }
        100% {
            left: 100%;
            transform: translateX(0%);
        }
    }

</style>
