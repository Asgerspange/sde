<template>
    <div class="tab-menu-container">
        <TabMenu :model="items">
            <template #item="{ item, props }">
                <a v-ripple v-bind="props.action" class="text-center tablinka gap-2">
                    <i class="material-symbols-outlined">{{ item.image }}</i>
                    <span>{{ item.label }}</span>
                </a>
            </template>
        </TabMenu>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                items: [
                    { label: 'Members', image: 'groups', command: () => this.$router.push('/') },
                    { label: 'Teams', image: 'team_dashboard', command: () => this.$router.push('/teams') },
                    { label: 'Tournaments', image: 'trophy', command: () => this.$router.push('/tournaments') }
                ]
            };
        }
    };
</script>

<style lang="scss" scoped>
    @import '../../scss/colors.scss';
    .tab-menu-container {
        display: flex;
        justify-content: center;
    }

    .tab-menu-container .p-tabmenu {
        width: fit-content;
    }

    .tablinka {
        color: $black-primary-text;
        text-decoration: none;
    }

    .p-tabmenu .p-tabmenu-nav .p-tabmenuitem .p-menuitem-link {
        color: #6c757d;
        padding: 1rem;
        font-weight: 600;
        border-top-right-radius: 0px;
        border-top-left-radius: 0px;
        transition: box-shadow 0.2s;
        margin: 0 0 -2px 0;
    }
</style>
