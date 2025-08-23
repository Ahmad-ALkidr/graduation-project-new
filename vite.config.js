import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';

export default defineConfig({
    server: {
        hmr: {
            host: process.env.REPL_SLUG
                ? `${process.env.REPL_SLUG}.${process.env.REPL_OWNER}.replit.dev`
                : 'localhost',
            clientPort: 443,
        },
        host: '0.0.0.0',
        allowedHosts: ['all'], // السماح لأي دومين (ديناميكي)
    },
    plugins: [
        laravel({
            input: ['resources/css/app.css', 'resources/js/app.js'],
            refresh: true,
        }),
    ],
});
