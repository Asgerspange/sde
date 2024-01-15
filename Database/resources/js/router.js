import { createWebHistory, createRouter } from 'vue-router';

import Teams from './Views/Teams.vue';
import Index from './Views/Index.vue';
import Tournaments from './Views/Tournaments.vue';

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
    },
    {
        path: '/tournaments',
        name: 'tournaments',
        component: Tournaments,
    }
];

const router = createRouter({
    history: createWebHistory(),
    routes,
});
export { routes };
export default router;