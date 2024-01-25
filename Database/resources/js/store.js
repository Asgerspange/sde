import { defineStore } from 'pinia';

export const useStore = defineStore('store', {
    state: () => ({
        theme: {
            name: 'light'
        },

        loading: false,
    }),

    getters: {
        getLoading() {
            return this.loading;
        },

        getTheme () {
            return this.theme.name;
        }
    },

    actions: {
        setTheme (themeName) {
            this.theme.name = themeName;
        },

        toggleLoading (boolean) {
            this.loading = boolean;
        },
    },

    persist: {
        paths: ['theme.name']
    }
});