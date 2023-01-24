import { defineConfig } from "vite";
import { resolve } from "path";
import path from "path";
import react from "@vitejs/plugin-react";
import alias from "@rollup/plugin-alias";

const projectRootDir = resolve(__dirname);

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    react(),
    alias({
      entries: [
        {
          find: "@",
          replacement: resolve(projectRootDir, "src"),
        },
      ],
    }),
  ],
});
