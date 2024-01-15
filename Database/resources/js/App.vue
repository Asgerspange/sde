<template>
    <main>
        <TabmenuComponent />
        <DarkmodeComponent />
        <router-view />
    </main>
</template>
  
<script>
    import DatabaseConnectionStatus from './Components/DatabaseConnectionComponent.vue';
    import DarkmodeComponent from './Components/DarkmodeComponent.vue';
    import TabmenuComponent from './Components/TabmenuComponent.vue';
  
    export default {
        components: {
            DatabaseConnectionStatus,
            DarkmodeComponent,
            TabmenuComponent
        },
    };
</script>