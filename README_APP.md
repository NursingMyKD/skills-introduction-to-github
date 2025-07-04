# ICU Staffing Dashboard

This repository contains a minimal skeleton of the ICU Staffing Dashboard described in the PRD. The app uses a monorepo layout with Electron and React.

## Packages

- `main` – Electron main process that opens a browser window.
- `renderer` – React front end powered by Vite.
- `common` – Shared types.

## Development

Install dependencies using **pnpm**:

```sh
pnpm install
```

Run the renderer in development mode and start Electron:

```sh
pnpm dev & pnpm start
```

The application is offline ready and renders a placeholder dashboard.
