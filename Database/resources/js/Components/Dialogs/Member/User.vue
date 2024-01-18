<template>
    <Dialog ref="dialog" :visible="visible" modal header="User Profile" :aria-expanded="visible ? true : false">
        <template v-if="entry">
            <div class="container">
                <div class="user-profile">
                    <div class="user--image--container">
                        <img :src="entry.profilePicture" alt="Avatar" class="user--image">
                    </div>
                    <div class="user-details">
                        <div class="user--info">
                            <p>Name: {{ entry.firstName + ' ' + entry.lastName }}</p>
                            <p>Adresse: {{ entry.street }}</p>
                            <p>Hold: <a @click="team()">{{ entry.teamName }}</a></p>
                        </div>
                        <div class="user--stats">
                            <h4>Stats</h4>
                        </div>
                    </div>
                </div>
                <div class="membership--history">
                    <p>Medlem tilmeldt: {{ entry.joinDate }}</p>
                </div>
            </div>
        </template>

        <template v-slot:footer>
            <Button @click="close()" severity="secondary" text label="Close"/>
            <Button @click="update()" text label="Update"/>
        </template>
    </Dialog>

    <Team :entry="tempEntry" :visible="showTeamDialog" @closed="showTeamDialog = false" />
</template>

<script>
    import Team from '../Team/Team';
    export default {
        data() {
            return {
                showTeamDialog: false,
            };
        },

        components: {
            Team
        },

        props: {
            entry: Object,
            visible: Boolean
        },
        
        methods: {
            close() {
                this.$emit('closed');
            },

            team() {
                this.tempEntry = Object.assign({}, this.entry);
                this.showTeamDialog = true;
            }
        }
    }
</script>
        
<style scoped>
.user-profile {
    display: flex;
    align-items: flex-start;
}

.user--image--container {
    margin-top: 10px;
    margin-left: 10px;
}

.user--image {
    max-width: 200px;
}

.user-details {
    display: flex;
    margin-left: 20px; 
}

.user--info {
    width: 200px;
}

.user--stats {
    width: 150px;
    margin-left: 20px;
}

.membership--history {
    margin-top: 20px;
    margin-left: 10px;
}

.p-dialog-header-icon {
    display: none;
}
</style>