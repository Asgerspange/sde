import { createApp } from 'vue';
import { createPinia } from 'pinia';

import piniaPluginPersistedstate from 'pinia-plugin-persistedstate';
import App from './App.vue';
import router from './router';
import PrimeVue from 'primevue/config';

import Dropdown from 'primevue/dropdown';
import Card from 'primevue/card';
import ToggleButton from 'primevue/togglebutton';
import Menu from 'primevue/menu';
import InputText from 'primevue/inputtext';
import Button from 'primevue/button';
import Dialog from 'primevue/dialog';
import TabMenu from 'primevue/tabmenu';

import 'primevue/resources/themes/saga-blue/theme.css';

const store = createPinia();

store.use(piniaPluginPersistedstate);

const app = createApp(App)
    .use(router)
    .use(store)
    .component('TabMenu', TabMenu)
    .component('Card', Card)
    .component('ToggleButton', ToggleButton)
    .component('InputText', InputText)
    .component('Dropdown', Dropdown)
    .component('Menu', Menu)
    .component('Dialog', Dialog)
    .component('Button', Button)
    .use(PrimeVue);

app.mount('#app');