<template>
    <div class="d-flex justify-content-center mt-4">
        <div class="col-10 card">
            <DataTable :value="data" paginator :rows="5" :rowsPerPageOptions="[5, 10, 20, 50]">
                <Column field="id" header="ID"></Column>
                <Column field="firstName" header="First Name"></Column>
                <Column field="lastName" header="Last Name"></Column>
                <Column field="mail" header="Email"></Column>
                <Column field="phoneNumber" header="Phone Number"></Column>
                <Column field="street" header="Street"></Column>
                <Column field="birthYear" header="Birth Year"></Column>
                <Column field="role" header="Role"></Column>
            </DataTable>
        </div>
    </div>
</template>

<script>
    import axios from 'axios';
  
    export default {
        data() {
        return {
            columns: null,
            data: null
        };
    },
  
    created() {
        this.columns = [
            { field: 'id', header: 'ID' },
            { field: 'firstName', header: 'First Name' },
            { field: 'lastName', header: 'Last Name' },
            { field: 'mail', header: 'Email' },
            { field: 'phoneNumber', header: 'Phone Number' },
            { field: 'street', header: 'Street' },
            { field: 'birthYear', header: 'Birth Year' },
            { field: 'role', header: 'Role' },
        ];
    },
  
    mounted() {
        axios.get('api/getMembers')
            .then(response => {
                this.data = response.data.result;
            })
        }
    };
</script>
  