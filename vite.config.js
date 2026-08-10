// Dev-only config — LfAssets has no build step (ships as-is to GitHub Pages).
// Vite serves the repo root as static files under /lf-assets/ so LyricFlow
// can use the same absolute path in local dev and production.
import { gatewayRedirectPlugin } from '../scripts/vite-gateway-redirect.mjs';

export default {
  server: {
    headers: {
      'Cache-Control': 'no-store, no-cache, must-revalidate, max-age=0',
    },
    fs: {
      allow: ['.'],
    },
  },
  plugins: [gatewayRedirectPlugin({ app: 'lf-assets' })],
};
