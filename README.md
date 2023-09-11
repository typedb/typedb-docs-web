# TypeDB Docs Framework

The TypeDB docs subsite is an [Antora playbook](https://antora.org), whose UI bundle sources are in the `ui`
directory, and whose content is sourced from https://github.com/vaticle/docs and integrated as a Git submodule into
the `content` directory.

The UI bundle is based on https://gitlab.com/antora/antora-ui-default.

## Development

These instructions are for compiling the docs site locally.

### Prerequisites

1. The `content` submodule must be fetched. If it's the first time fetching it, use `git submodule update --init --recursive`. Otherwise, omit the `--init` flag.
2. Install Node.js v18, preferably through [NVM (Node Version Manager)](https://github.com/nvm-sh/nvm): `nvm install 18`, or `nvm use 18` if already installed
3. In the project root directory run `npm i` to install Antora, Gulp and all required `node_modules`

#### Caveats

- ⚠️ `pnpm` is not compatible with the Antora UI bundle. Use `npm` instead.
- ⚠️ v18 is the **only** supported version of Node.js. The build may fail on other Node versions.
- ⚠️ Changing branches and doing merges often results in the `content` submodule being flagged as changed. You can run
`git submodule update --recursive` to fix this by updating your submodule state to the one marked in Git.

### Build

In the project root directory, run:
```shell
npm run build
```

The docs site will be built and output to `dist`.

Assuming the build is successful, it will log a file you can open in a browser to view the site.
