<template>
    <Dialog ref="dialog" :visible="visible" modal header="User Profile" :aria-expanded="visible ? true : false">
        <template v-if="entry">
            <div class="container">
                <div class="user-profile">
                    <div class="user--image--container">
                        <img :src="entry.profilePicture" alt="Avatar" class="user--image">
                    </div>
                    <div class="user-details">
                        <div class="user--info text--black">
                            <p>Navn: {{ entry.firstName + ' ' + entry.lastName }}</p>
                            <p>Alder: {{ getAge(entry.birthYear) }}</p>
                            <p>Adresse: {{ entry.street }}</p>
                            <p>Hold: {{ entry.teamName }}</p>
                        </div>
                    </div>
                </div>
                <div class="membership--history">
                    <p class="text--black">Medlem tilmeldt: {{ entry.joinDate }}</p>
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
    export default {
        data() {
            return {
                showTeamDialog: false,
            };
        },

        props: {
            entry: Object,
            visible: Boolean
        },
        
        methods: {
            close() {
                this.$emit('closed');
            },

            getAge(birthYear) {
                const currentYear = new Date().getFullYear();
                const age = currentYear - birthYear;

                return age;
            },
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

    .membership--history {
        margin-top: 20px;
        margin-left: 10px;
    }

    .p-dialog-header-icon {
        display: none;
    }
</style>