<template>
    <Dialog ref="dialog" :visible="visible" modal :header="entry ? entry.teamName : 'Team Profile'" :aria-expanded="visible ? true : false" style="width: 500px;">
        <template v-if="entry">
            <div class="info-container">
                <div class="info">
                    <div class="d-flex">
                        <div class="label text--black">Team:&nbsp;</div>
                        <div class="value text--black">{{ entry.teamName }}</div>
                    </div>
                </div>
                <div class="info">
                    <div class="d-flex">
                        <div class="label text--black">Sponsor:&nbsp;</div>
                        <div class="value text--black">{{ entry.sponsor }}</div>
                    </div>
                </div>
            </div>
            <div class="player-container">
                <div class="player-header">
                    <h3 class="text--black">Players</h3>
                </div>
                <ul class="player-list text--black">
                    <li v-for="player in data" :key="player.id" @click="showUser(player)">
                        {{ player.firstName }}
                        {{ player.lastName }}
                    </li>
                </ul>
            </div>
        </template>

        <template v-slot:footer>
            <Button @click="close()" severity="secondary" text label="Close" />
        </template>
    </Dialog>
        <User :entry="tempEntry" :visible="showUserDialog" @closed="showUserDialog = false" />


</template>

<script>
    import User from '../Member/User';
    import axios from 'axios';
    export default {
        data() {
            return {
                data: null,
                showUserDialog: false,
                tempEntry: null
            };
        },

        components: {
            User
        },

        props: {
            entry: Object,
            visible: Boolean
        },

        watch: {
            entry(newVal) {
                if (newVal) {
                    this.getTeamMembers();
                }
            },
        },

        methods: {
            close() {
                this.data = null;
                this.$emit('closed');
            },

            getTeamMembers () {
                axios.get('/api/teams/getTeamMembers/' + this.entry.teamID).then(response => {
                    this.data = response.data.members;
                });
            },

            showUser(user) {
                axios.get('/api/members/getMember/' + user.id).then(response => {
                    this.tempEntry = response.data.result[0];
                    this.showUserDialog = true;
                });
            }
        }
    };
</script>

<style scoped>
    .info-container {
        display: flex;
        justify-content: space-between;
        margin-bottom: 15px;
    }

    .info {
        flex: 0 0 48%;
    }

    .label {
        font-weight: bold;
    }

    .player-container {
        display: flex;
        flex-direction: column;
    }

    .player-header {
        margin-bottom: 10px;
    }

    .player-list {
        list-style-type: none;
        padding: 0;
    }

    .player-list li {
        padding: 5px 0;
        border-bottom: 1px solid #ccc;
        width: 128px;
    }
</style>