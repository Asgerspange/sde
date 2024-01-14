<template>
    <Dialog ref="dialog" :visible="visible" modal header="Delete entry" :aria-expanded="visible ? true : false">
        <template v-if="entry">
            <div class="row">
                <p>Vil du slette {{ entry.firstName }}</p>
            </div>
        </template>

        <template v-slot:footer>
            <Button @click="close()" severity="secondary" text label="Close"/>
            <Button @click="deleteEntry()" text label="Delete"/>
        </template>
    </Dialog>
</template>

<script>
import axios from 'axios';

    export default {
        props: {
            entry: Object,
            visible: Boolean
        },

        methods: {
            close() {
                this.$emit('closed');
            },

            deleteEntry() {
                return axios.post('api/members/deleteMember', this.entry)
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
</style>