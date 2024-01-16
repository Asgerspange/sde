<template>
    <Dialog ref="dialog" :visible="visible" modal header="Update entry" :aria-expanded="visible ? true : false">
        <template v-if="entry">
            <div class="p-float-label">
            </div>
            <div class="row">
                <div class="col-6">
                    <InputText v-model="entry.teamName" />
                </div>
                <div class="col-6">
                    <Dropdown v-model="captainID" :options="data" :optionLabel="option => option.firstName + ' ' + option.lastName" @change="changeCaptain()" :placeholder=captainName />
                </div>
            </div>
        </template>

        <template v-slot:footer>
            <Button @click="close()" severity="secondary" text label="Close"/>
            <Button @click="update()" text label="Update"/>
        </template>
    </Dialog>
</template>

<script>
    import axios from 'axios';

    export default {
        data() {
            return {
                data: null,
                captainName: '',
                captainID: null,
            };
        },

        props: {
            entry: Object,
            visible: Boolean,
            captains: Array,
        },

        watch: {
            entry(newVal) {
                if (newVal) {
                    let nameObject = this.captains.find(captain => captain.id == this.entry.captainID);
                    this.captainName = nameObject.firstName + ' ' + nameObject.lastName;

                    this.getTeamMembers();
                }
            },
        },

        methods: {
            close() {
                this.$emit('closed');
            },

            update() {
                return axios.post('api/teams/updateTeam/' + this.entry.teamID, this.entry)
                    .then(() => {
                        this.close();
                    });
            },

            getTeamMembers () {
                axios.get('/api/teams/getTeamMembers/' + this.entry.teamID).then(response => {
                    this.data = response.data.members;
                });
            },

            changeCaptain() {
                this.entry.captainID = this.captainID.id;
            }
        }
    }
</script>

<style>
.p-dialog-header-icon  {
    display: none;
}
</style>