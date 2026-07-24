# typedb-docs-web

This repo builds the TypeDB docs subsite with [Antora](https://antora.org): the **framework** (UI) and the **content** are assembled by `antora-playbook.yml` into a static site under `dist/`.

- **Framework** — the UI bundle (theme, layouts, styles, JS) lives in `ui/`. Based on [antora-ui-default](https://gitlab.com/antora/antora-ui-default); built into `ui/build/ui-bundle.zip`.
- **Content** — the AsciiDoc docs live in `content/`, sourced from [typedb/typedb-docs](https://github.com/typedb/typedb-docs) (a Git submodule). Versioned into `content/2.x/` and `content/3.x/`, each split into Antora modules (`home/`, `academy/`, `learn-typedb/`, `reference/`, etc.). Ignore the `content/2.x/` tree — only work within `content/3.x/` unless the user specifically requests changes to 2.x.

## Build

After making any edit — to either the framework (`ui/`) or content (`content/...`) — rebuild the site. Prefer the minimal build (uses `antora-playbook-minimal.yml`), which excludes the 2.x tree, the external `typedb-driver` source, and the 3.x `archive/*` modules:

```bash
pnpm build-minimal
```

It keeps the 3.x `reference` module, so it logs a few expected, non-fatal errors (driver-API includes and one 2.x xref that can't resolve without the excluded sources); the site still generates.

### Full build

Run the full build for the complete site (2.x, driver, and archive included). Use it before considering the driver/reference/2.x output verified:

```bash
pnpm build
```
