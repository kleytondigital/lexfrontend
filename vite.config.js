import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

// https://vite.dev/config/
export default defineConfig({
    plugins: [react()],
    server: {
        port: 3001,
        host: '0.0.0.0',
        preview: {
            allowedHosts: [
                'lex.aoseudispor.com.br',
                'localhost',
                '185.208.206.76',
                '0.0.0.0', // Adicionar esse IP pode ajudar em alguns cenários
            ],
        },
        proxy: {
            '/api': {
                target: 'http://lex.aoseudispor.com.br:5000',
                changeOrigin: true,
                secure: false,
            },
        },
    },
});