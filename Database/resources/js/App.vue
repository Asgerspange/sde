<template>
    <div>
        <DatabaseConnectionStatus />
        <div class="d-flex">
            <TeamComponent :team="'CS:GO Team A'"/>
            </div>
        <TableComponent />
    </div>
</template>
  
<script>
    import DatabaseConnectionStatus from './Components/DatabaseConnectionComponent.vue';
import TableComponent from './Components/TableComponent.vue';
    import TeamComponent from './Components/TeamComponent.vue';
  
    export default {
        components: {
    DatabaseConnectionStatus,
    TeamComponent,
    TableComponent
},
    };
</script>