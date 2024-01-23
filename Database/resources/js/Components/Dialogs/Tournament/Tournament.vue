<template>
    <Dialog ref="dialog" :visible="visible" modal :header="entry ? entry.tournamentName : 'Tournament'" :aria-expanded="visible ? true : false" style="max-width: 500px;">
        <template v-if="entry">
            
        </template>

        <template v-slot:footer>
            <Button @click="close()" severity="secondary" text label="Close"/>
        </template>
    </Dialog>
</template>

<script>
    export default {
        props: {
            visible: Boolean,
            entry: Object
        },

        methods: {
            close() {
                this.$emit('closed');
            },
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