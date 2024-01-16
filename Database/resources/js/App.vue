<template>
    <main>
        <TabmenuComponent />
        <DarkmodeComponent />
        <router-view />
    </main>
</template>
  
<script>
    import { useStore } from './store';
    import DatabaseConnectionStatus from './Components/DatabaseConnectionComponent.vue';
    import DarkmodeComponent from './Components/DarkmodeComponent.vue';
    import TabmenuComponent from './Components/TabmenuComponent.vue';
  
    export default {
        components: {
            DatabaseConnectionStatus,
            DarkmodeComponent,
            TabmenuComponent
        },

        mounted () {
            this.setTheme();
        },

        methods: {
            setTheme() {
                const currentTheme = useStore().getTheme;

                if (currentTheme === 'light') {
                    document.documentElement.setAttribute('data-theme', 'light');

                    return;
                }
                
                document.documentElement.setAttribute('data-theme', 'dark');
            }
        }
    };
</script>