<template>
    <Dialog ref="dialog" :visible="visible" modal header="Add entry" :aria-expanded="visible ? true : false" style="max-width: 500px;">
        <template v-if="entry">
            <div class="row">
                <div class="col-6">
                    <InputText v-model="entry.firstName" placeholder="First Name"></InputText>
                </div>
                <div class="col-6">
                    <InputText v-model="entry.lastName" placeholder="Last Name"></InputText>
                </div>
                <div class="col-6">
                    <InputText v-model="entry.birthYear" placeholder="Birth Year"></InputText>
                </div>
                <div class="col-6">
                    <InputText v-model="entry.mail" placeholder="Mail"></InputText>
                </div>
                <div class="col-6">
                    <InputText v-model="entry.street" placeholder="Street"></InputText>
                </div>
                <div class="col-6">
                    <InputText v-model="entry.phoneNumber" placeholder="Phone number"></InputText>
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
                    firstName: '',
                    lastName: '',
                    mail: '',
                    phoneNumber: '',
                    street: '',
                    birthYear: ''
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
                console.log(this.entry);
                return axios.post('api/addMember', this.entry)
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