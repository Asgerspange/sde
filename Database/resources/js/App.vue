<template>
    <div>
        <DarkmodeComponent />
        <DatabaseConnectionStatus />
        <TableComponent />
    </div>
</template>
  
<script>
    import DatabaseConnectionStatus from './Components/DatabaseConnectionComponent.vue';
    import TableComponent from './Components/TableComponent.vue';
    import DarkmodeComponent from './Components/DarkmodeComponent.vue';
  
    export default {
        components: {
            DatabaseConnectionStatus,
            DarkmodeComponent,
            TableComponent
        },
    };
</script>