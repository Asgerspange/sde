<template>
    <Dialog ref="dialog" :visible="visible" modal header="Add entry" :aria-expanded="visible ? true : false" style="max-width: 500px;">
        <template v-if="entry">
            <div class="row">
                <div class="col-6">
                    <InputText v-model="entry.teamName" placeholder="Team Name"></InputText>
                </div>
                <div class="col-6">
                    <InputText v-model="entry.captainID" placeholder="captainID"></InputText>
                </div>
                <div class="col-6">
                    <InputText v-model="entry.sponsor" placeholder="sponsor"></InputText>
                </div>
                <div class="col-6">
                    <InputText v-model="entry.gameID" placeholder="gameID"></InputText>
                </div>
            </div>
        </template>

        <template v-slot:footer>
            <Button @click="close()" severity="secondary" text label="Close"/>
            <Button @click="addEntry()" text label="Add"/>
        </template>
    </Dialog>
</template>

<script>
import axios from 'axios';

    export default {
        data() {
            return {
                entry: {
                    teamName: '',
                    captainID: '',
                    sponsor: '',
                    gameID: ''
                },
            }
        },

        props: {
            visible: Boolean
        },

        methods: {
            close() {
                this.$emit('closed');
            },

            addEntry() {
                return axios.post('api/teams/addTeam', this.entry)
                    .then(() => {
                        this.close();
                    });
            }
        }
    }
</script>

<style>
    .p-dialog-header-icon  {
        display: none;
    }

    .p-inputtext p-component p-filled {
        user-select: text;
    }
</style>