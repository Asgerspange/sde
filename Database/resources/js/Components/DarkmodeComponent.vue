<template>
    <ToggleButton class="material-symbols-outlined" v-model="value" onLabel="&#xe518" offLabel="&#xe51c" @change="changetheme()"/>
</template>

<script>
    export default {
        data () {
            return {
                value: false,
            }
        },
        methods: {
            changetheme() {
                if (this.value) {
                    console.log('dark');
                    document.documentElement.setAttribute('data-theme', 'dark');
                } else {
                    console.log('light');
                    document.documentElement.setAttribute('data-theme', 'light');
                }
            }
        }
    }
</script>