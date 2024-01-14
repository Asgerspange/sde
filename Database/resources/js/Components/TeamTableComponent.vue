<template>
    <div class="container">
        <Button label="Add entry" class="p-button-success" @click="toggleDialog('add', {})"/>
        <table class="styled-table">
            <thead class="guide-row">
                <tr>
                    <th>TeamID</th>
                    <th>Team Name</th>
                    <th>Captain ID</th>
                    <th>Sponsor</th>
                    <th>GameID</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="entry in data" :key="entry.id" class="fade-in">
                    <td>{{ entry.teamID }}</td>
                    <td>{{ entry.teamName }}</td>
                    <td>{{ entry.captainID }}</td>
                    <td>{{ entry.sponsor }}</td>
                    <td>{{ entry.gameID}}</td>
                    <td>
                        <Button label="Edit" class="p-button-secondary" @click="toggleDialog('edit', entry)"/>
                        <Button label="Delete" class="p-button-danger" @click="toggleDialog('delete', entry)"/>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <Edit :entry="tempEntry" :visible="showEditDialog" @closed="showEditDialog = false" />
    <Delete :entry="tempEntry" :visible="showDeleteDialog" @closed="showDeleteDialog = false" />
    <Add :visible="showCreateDialog" @closed="showCreateDialog = false" />
</template>

<script>
    import axios from 'axios';
    import Edit from './Dialogs/Team/Edit';
    import Delete from './Dialogs/Delete';
    import Add from './Dialogs/Team/Add';

    export default {
        data() {
            return {
                data: null,
                tempEntry: null,
                showEditDialog: false,
                showCreateDialog: false,
                showDeleteDialog: false,
            };
        },

        components: {
            Delete,
            Edit,
            Add
        },

        mounted() {
            axios.get('api/teams/getTeams').then((response) => {
                this.data = response.data.teams;
            });
        },

        methods: {
            toggleDialog (action, entry) {
                if (action === 'edit') {
                    this.tempEntry = Object.assign({}, entry);
                    this.showEditDialog = true;
                }

                if (action === 'add') {
                    this.tempEntry = Object.assign({}, entry);
                    this.showCreateDialog = true;
                }

                if (action === 'delete') {
                    this.tempEntry = Object.assign({}, entry);
                    this.showDeleteDialog = true;
                }
            }
        }
    };
</script>

<style lang="scss" scoped>
    .styled-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    .styled-table th,
    .styled-table td {
        padding: 12px 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    .styled-table th {
        background-color: #f2f2f2;
    }

    .styled-table tbody tr:hover {
        background-color: #f5f5f5;
    }

    .fade-in-enter-active, .fade-in-leave-active {
        transition: opacity 0.5s;
    }
    .fade-in-enter, .fade-in-leave-to {
        opacity: 0;
    }
</style>