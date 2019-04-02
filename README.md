# GRAKN.AI Documentation

## Clone
In order to clone `web-dev` along with its submodule `docs`, run:

```
$ git clone https://github.com/graknlabs/web-dev.git --recursive
```

## Requirements

### Ruby
Install the required version of Ruby as specified in the [`Gemfile`](Gemfile)

### Gems

**Arch Linux**
```
$ yaourt -S ruby-bundler
$ bundle install
```

**macOS**

Install the required verion of Ruby (as specified in the `Gemfile`). Installing Ruby using [RVM](https://rvm.io/rvm/install) is encouraged.

```
$ gem install bundler
$ bundle install
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