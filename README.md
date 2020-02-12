# GRAKN.AI Documentation

## Clone
In order to clone `web-dev` along with its submodule `docs`, run:

```
$ git clone https://github.com/graknlabs/web-dev.git --recursive
```

## Requirements

### Ruby
1. Install [Homebrew](https://brew.sh/)
2. Install `gpg`: `brew install gnupg`
3. Install the mpapis public key (required for installing RVM): `gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3`. Alternatively, try [these instructions](https://rvm.io/rvm/security#alternatives).
4. Install RVM: `\curl -sSL https://get.rvm.io | bash -s stable --ruby`
5. Install the version of ruby specific in [`Gemfile`](Gemfile) using [RVM](https://rvm.io/rvm/install): `rvm install x.x.x`
6. Use the recently installed version of ruby as default: `rvm use x.x.x --default`

### Gems

**Arch Linux**

```
$ yaourt -S ruby-bundler
$ bundle install
```

**macOS**

```
$ gem install bundler
$ bundle install
```

## Symlinking YAML files of `/docs` to `/_data`
Given that Jekyll can only read data from files placed under `_data` and we'd like these files to be defined within the `docs` submodule, we need to run the `symlink_creator.sh` to create symlinks in `_data`.

```
sh symlink_creator.sh
```

## Build

```
$ jekyll build
```

Running this command parses all markdown files in `docs/` to HTML and places them under `_site/docs/` directory. Any other files or folders are also moved into `_site/` unless explicitly excluded in [`_config.yml`](_config.yml).

## Clean

```
$ jekyll clean
```

Running this command removes `_site`, `.jekyll-metadata` and `.sass-cache`.

## Build and start the server

```
$ jekyll serve --trace --livereload
```

This starts a WEBrick web server on 127.0.0.1:4005. Same command with `-H 0.0.0.0` and `-P $PORT` starts the server in production.

You can now view the documentation by navigating your web browser to `http://127.0.0.1:4005`

## Deploy

Any commit pushed to this repository triggers an automatic deploy. Commits on `master` deploy to production at [dev.grakn.ai](https://dev.grakn.ai) and commits on `development` deploy to staging at [grakn-web-dev-wip.herokuapp.com](http://grakn-web-dev-wip.herokuapp.com).
