<template>
    <div>
        <p>Database Connection Status: {{ isConnected ? 'true' : 'false' }}</p>
    </div>
</template>

<script>
    import axios from 'axios';

    export default {
        data() {
            return {
                isConnected: false
            };
        },
        mounted() {
            this.checkDatabaseConnection();
        },
        methods: {
            checkDatabaseConnection() {
                axios.get('/api/check-database-connection')
                    .then(response => {
                        this.isConnected = response.data.connected;
                    })
                    .catch(error => {
                        console.error('Error checking database connection:', error);
                    });
            },
        },
    };
</script>
