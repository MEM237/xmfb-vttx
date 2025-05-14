import { defineConfig } from 'vite'
// ✅ if React is set up, this line will exist:
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
})
