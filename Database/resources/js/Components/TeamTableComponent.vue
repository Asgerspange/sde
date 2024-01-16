<template>
    <div class="container">
        <Button label="Add entry" class="p-button-success" @click="toggleDialog('add', {})"/>
        <table class="styled-table">
            <thead class="guide-row">
                <tr>
                    <th>Team ID</th>
                    <th>Team Name</th>
                    <th>Captain</th>
                    <th>Sponsor</th>
                    <th>Game</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="entry in data.teams" :key="entry.id">
                    <td>{{ entry.teamID }}</td>
                    <td>{{ entry.teamName }}</td>
                    <td>{{ getCaptainName(entry.captainID) }}</td>
                    <td>{{ entry.sponsor }}</td>
                    <td>{{ getGameName(entry.gameID) }}</td>
                    <td>
                        <Button label="Show Team" class="p-button-info" @click="toggleDialog('show', entry)" />
                        <Button label="Edit" class="p-button-secondary" @click="toggleDialog('edit', entry)"/>
                        <Button label="Delete" class="p-button-danger" @click="toggleDialog('delete', entry)"/>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <Edit :entry="tempEntry" :captains="data.captains" :visible="showEditDialog" @closed="showEditDialog = false" />
    <Delete :entry="tempEntry" :visible="showDeleteDialog" @closed="showDeleteDialog = false" />
    <Add :visible="showCreateDialog" @closed="showCreateDialog = false" />
    <Team :entry="tempEntry" :visible="showTeamDialog" @closed="showTeamDialog = false" />
</template>

<script>
    import axios from 'axios';
    import Edit from './Dialogs/Team/Edit';
    import Delete from './Dialogs/Delete';
    import Add from './Dialogs/Team/Add';
    import Team from './Dialogs/Team/Team'

    export default {
        data() {
            return {
                data: {
                    teams: [],
                    captains: [],
                    games: [],
                },
                tempEntry: null,
                Players: [],
                showEditDialog: false,
                showTeamDialog: false,
                showCreateDialog: false,
                showDeleteDialog: false,
            };
        },

        components: {
            Delete,
            Edit,
            Add,
            Team
        },

        mounted() {
            axios.all([
                axios.get('api/teams/getTeams'),
                axios.get('api/teams/getTeamCaptains'),
            ])
            .then(axios.spread((teamsResponse, captainsResponse) => {
                this.data.teams = teamsResponse.data.teams;
                this.data.games = teamsResponse.data.games;
                this.data.captains = captainsResponse.data.captains;
                }))
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
                    this.tempEntry = Object.assign({}, entry);

                    this.showTeamDialog = true;

                }
            },

            getCaptainName(captainID) {
                const captain = this.data.captains.find((captain) => captain.id == captainID);

                return captain ? captain.firstName + ' ' + captain.lastName : '';
            },

            getGameName(gameID) {
                const game = this.data.games.find((game) => game.gameID == gameID);

                return game ? game.games[0].gameName : '';
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