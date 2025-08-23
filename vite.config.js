import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';

export default defineConfig({
    server: {
        hmr: {
            host: 'b9ba92a5-b947-42b7-8f51-da6c7a7eed71-00-3ccxgzfs6cyrv.sisko.replit.dev',
            clientPort: 443,
        },
        host: '0.0.0.0',
        allowedHosts: ['.replit.dev']
    },
    plugins: [
        laravel({
            input: ['resources/css/app.css', 'resources/js/app.js'],
            refresh: true,
        }),
    ],
});