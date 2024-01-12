<template>
    <div>
        <DarkmodeComponent />
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
    import DarkmodeComponent from './Components/DarkmodeComponent.vue';
  
    export default {
        components: {
    DatabaseConnectionStatus,
    TeamComponent,
    DarkmodeComponent,
    TableComponent
},
    };
</script>