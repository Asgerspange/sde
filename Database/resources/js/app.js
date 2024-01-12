import { createApp } from 'vue';

import App from './App.vue';
import PrimeVue from 'primevue/config';

import DataTable from 'primevue/datatable';
import Column from 'primevue/column';
import ColumnGroup from 'primevue/columngroup';
import Row from 'primevue/row';
import Dropdown from 'primevue/dropdown';
import Card from 'primevue/card';
import ToggleButton from 'primevue/togglebutton';

import 'primevue/resources/themes/saga-blue/theme.css';

const app = createApp(App)
    .component('Card', Card)
    .component('DataTable', DataTable)
    .component('Column', Column)
    .component('ToggleButton', ToggleButton)
    .component('Dropdown', Dropdown)
    .component('ColumnGroup', ColumnGroup)
    .component('Row', Row)
    .use(PrimeVue);

app.mount('#app');