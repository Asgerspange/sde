<template>
    <div class="container">
        <Button label="Add entry" class="p-button-success" @click="toggleDialog('add', {})"/>
        <table class="styled-table">
            <thead class="guide-row">
                <tr>
                    <th>Tournament</th>
                    <th>Start date</th>
                    <th>End date</th>
                    <th>Location</th>
                    <th>Winner</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="entry in data" :key="entry.id" class="fade-in">
                    <td>{{ entry.tournamentName }}</td>
                    <td>{{ entry.startDate }}</td>
                    <td>{{ entry.endDate }}</td>
                    <td>{{ entry.location }}</td>
                    <td>{{ entry.winner ? entry.winner.teamName : "No Winner" }}</td>
                    <td>
                        <Button label="Show Tournament" class="p-button-info" @click="toggleDialog('show', entry)"/>
                        <Button label="Edit" class="p-button-secondary" @click="toggleDialog('edit', entry)"/>
                        <Button label="Delete" class="p-button-danger" @click="toggleDialog('delete', entry)"/>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <Delete :entry="tempEntry" :visible="showDeleteDialog" @closed="showDeleteDialog = false" />
    <Tournament :entry="tempEntry" :visible="showTournamentDialog" @closed="showTournamentDialog = false" />
</template>

<script>
    import axios from 'axios';
    import Delete from './Dialogs/Delete';
    import Tournament from './Dialogs/Tournament/Tournament';

    export default {
        data() {
            return {
                data: null,
                tempEntry: null,
                showEditDialog: false,
                showCreateDialog: false,
                showDeleteDialog: false,
                showTournamentDialog: false
            };
        },

        components: {
            Delete,
            Tournament
        },

        mounted() {
            axios.get('api/tournaments/getTournaments').then((response) => {
                this.data = response.data.tournaments;
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

                if (action === 'show') {
                    this.tempEntry = entry;
                    this.showTournamentDialog = true;
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