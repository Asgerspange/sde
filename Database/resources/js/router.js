import { createWebHistory, createRouter } from 'vue-router';

import Teams from './Views/Teams.vue';
import Index from './Views/Index.vue';
const routes = [
    {
        path: '/',
        name: 'index',
        component: Index,
    },
    {
        path: '/teams',
        name: 'teams',
        component: Teams,
    }
];

const router = createRouter({
    history: createWebHistory(),
    routes,
});
export { routes };
export default router;