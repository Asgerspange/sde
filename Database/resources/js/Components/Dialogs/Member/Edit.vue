<template>
    <Dialog ref="dialog" :visible="visible" modal header="Update entry" :aria-expanded="visible ? true : false">
        <template v-if="entry">
            <div class="p-float-label">
            </div>
            <div class="row">
                <div class="col-6">
                    <div class="p-float-label">
                        <InputText v-model="entry.firstName"/>
                        <label>First Name</label>
                    </div>
                </div>
                <div class="col-6">
                    <div class="p-float-label">
                        <InputText v-model="entry.lastName"/>
                        <label>Last Name</label>
                    </div>
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
        props: {
            entry: Object,
            visible: Boolean
        },

        methods: {
            close() {
                this.$emit('closed');
            },

            update() {
                return axios.post('api/members/updateMember', this.entry)
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