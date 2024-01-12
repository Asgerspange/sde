<template>
    <ToggleButton class="material-symbols" v-model="value" onLabel="&#xe518" offLabel="&#xe51c" @change="changetheme()"/>
</template>

<script>
    export default {
        data () {
            return {
                value: true,
            }
        },
        methods: {
            changetheme() {
                const stylesheet = document.getElementById('theme-link');

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