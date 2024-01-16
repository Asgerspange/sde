import { defineStore } from 'pinia';

export const useStore = defineStore('store', {
    state: () => ({
        theme: {
            name: 'light'
        },
    }),

    getters: {
        getTheme () {
            return this.theme.name;
        }
    },

    actions: {
        setTheme (themeName) {
            this.theme.name = themeName;
        },
    },

    persist: {
        paths: ['theme.name']
    }
});