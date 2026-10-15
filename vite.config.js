import { defineConfig } from "vite";

// base "./" để chạy được ở GitHub Pages (https://<user>.github.io/<repo>/)
export default defineConfig({
  base: "./",
  build: { outDir: "dist", chunkSizeWarningLimit: 1500 },
});
