<template>
    <div class="button-container">
        <ToggleButton class="material-symbols-outlined" v-model="themeToggle" onLabel="&#xe518" offLabel="&#xe51c" @change="changeTheme"/>
    </div>
</template>

<script>
import { useStore } from '../store';

export default {
    data() {
        return {
            themeToggle: true,
        };
    },

    computed: {
        theme() {
            return useStore().getTheme;
        },
    },

    methods: {
        changeTheme() {
            const currentTheme = useStore().getTheme;

            if (currentTheme === 'light') {
                useStore().setTheme('dark');

                document.documentElement.setAttribute('data-theme', 'dark');

                return;
            }
            
            useStore().setTheme('light');
            document.documentElement.setAttribute('data-theme', 'light');
        },
    },
};
</script>

<style scoped>
.button-container {
    position: fixed;
    bottom: 10px;
    right: 10px;
}
</style>
