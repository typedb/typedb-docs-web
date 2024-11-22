# TypeDB Docs Website

The TypeDB docs subsite is an [Antora playbook](https://antora.org), whose UI bundle sources are in the `ui`
directory, and whose content is sourced from https://github.com/typedb/typedb-docs and integrated as a Git submodule into
the `content` directory.

The UI bundle is based on https://gitlab.com/antora/antora-ui-default.

## Install dependencies

### Node.js

Install Node.js v18, preferably through [NVM (Node Version Manager)](https://github.com/nvm-sh/nvm): `nvm install 18`, or `nvm use 18` if already installed.

### PNPM

Check the `packageManager` entry in [package.json](./package.json) to find out the correct PNPM version.

Generally speaking, it's OK to use a different minor/patch version to the specified one, but the major version should be the same.

Installation instructions can be found at https://pnpm.io/installation.

### Node modules

In the project root directory run `pnpm i` to install Antora, Gulp and all required `node_modules`.

## Development

These instructions are for compiling the docs site locally.

### Source content

#### Through Git

The `content` directory is a Git submodule linked to https://github.com/typedb/typedb-docs, so you can fetch it with
`git submodule update --recursive`. Add the `--init` flag if this is a freshly cloned repo.

#### Through local symlink

You can also symlink your local `typedb-docs` repo to the `content` directory:
```shell
rm -rf content
```
```shell
ln -s /Users/{path_to_docs_repo}/typedb-docs content
```
This is especially helpful if you're developing `typedb-docs` locally.

### Build

In the project root directory, run:

```shell
pnpm build
```

The docs site will be built and output to `dist`.

Assuming the build is successful, it will log a file you can open in a browser to view the site.

## Troubleshooting

- ⚠️ v18 is the **only** supported version of Node.js. The build may fail on other Node versions.
- ⚠️ Changing branches and doing merges often results in the `content` submodule being flagged as changed. You can run
  `git submodule update --recursive` to fix this by updating your submodule state to the one marked in Git.
