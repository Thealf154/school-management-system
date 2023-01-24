import alias from "@rollup/plugin-alias";
import path from "path";

module.exports = {
  input: "src/index.js",
  output: {
    dir: "output",
    format: "cjs",
  },
  plugins: [
    alias({
      resolve: [".js", ".ts", "tsx"],
      entries: [
        {
          find: "components",
          replacement: "./src/components",
        },
        {
          find: "css",
          replacement: path.resolve(__dirname, "./src/css"),
        },
      ],
    }),
  ],
};
