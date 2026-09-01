import react from '@vitejs/plugin-react'
import { defineConfig } from 'vite'

// https://vite.dev/config/
export default defineConfig({
  plugins: [react()],
  server: {
    host: true, 
    port: 5173,
    strictPort: true, 
    // Add this block below to allow your container's hostname
    allowedHosts: [
      'deno-react'
    ]
  }
})
