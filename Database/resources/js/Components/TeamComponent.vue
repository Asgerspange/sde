<template>
    <div class="card col-3">
        <Card>
            <template #title> Players on {{ selectedTeam ? selectedTeam.label : '' }}</template>
            <template #content>
                <Dropdown
                    :options="teamOptions"
                    v-model="selectedTeam"
                    optionLabel="label"
                    @change="fetchPlayers"
                />
                <p class="m-0" v-for="player in players">{{ player.firstName + ' ' + player.lastName + ' ' + player.role }}</p>
            </template>
        </Card>
    </div>
</template>

<script>
    import axios from 'axios';

    export default {
        data() {
            return {
                players: [],
                selectedTeam: null,
                teamOptions: [
                    { label: 'CS:GO Team A', value: 'CS:GO Team A' },
                    { label: 'CS:GO Team B', value: 'CS:GO Team B' },
                    { label: 'CS:GO Team C', value: 'CS:GO Team C' },
                    { label: 'CS:GO Team D', value: 'CS:GO Team D' },
                    { label: 'Fortnite Team X', value: 'Fortnite Team X' },
                    { label: 'Fortnite Team Z', value: 'Fortnite Team Z' },
                ],
            };
        },

        props: {
            team: {
                type: String,
                required: true,
            },
        },

        mounted() {
            this.selectedTeam = this.teamOptions.find(option => option.value === this.team) || this.teamOptions[0];
            this.fetchPlayers();
        },

        methods: {
            fetchPlayers() {
                if (this.selectedTeam) {
                    axios.post('api/teams/getTeams', { team: this.selectedTeam.value })
                        .then(response => {
                            this.players = response.data.team;
                        });
                }
            },
        },
    };
</script>
