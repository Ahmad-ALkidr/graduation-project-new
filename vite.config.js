import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';

export default defineConfig({
    // Add the server configuration here
    server: {
        host: '0.0.0.0',
        hmr: {
            host: 'your-replit-host-from-error',
            clientPort: 443,
        },
        allowedHosts: [
            'your-replit-host-from-error'
        ]
    },
    // The plugins section remains the same
    plugins: [
        laravel({
            input: ['resources/css/app.css', 'resources/js/app.js'],
            refresh: true,
        }),
    ],
});
