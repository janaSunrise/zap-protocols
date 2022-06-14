import { defineConfig } from 'tsup';

export default defineConfig({
  entry: ['typechain/index.ts'],
  sourcemap: true,
  clean: true,
  format: ['cjs', 'esm']
});
