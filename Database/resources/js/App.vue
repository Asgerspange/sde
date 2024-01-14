<template>
    <main>
        <DarkmodeComponent />
        <router-view />
    </main>
</template>
  
<script>
    import DatabaseConnectionStatus from './Components/DatabaseConnectionComponent.vue';
    import DarkmodeComponent from './Components/DarkmodeComponent.vue';
  
    export default {
        components: {
            DatabaseConnectionStatus,
            DarkmodeComponent,
        },
    };
</script>