# GRAKN.AI Documentation

## Dependencies

You need to install the following dependencies to be able to build HTML pages in the documentation repository. **NOTE:** this is *not* necessary for updating the documentation itself.

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

Running this command parses all markdown files in `/docs` to HTML and places them under `_site/docs` directory. Any other files or folders are also moved into `_site/` unless explicitly excluded in `_config.yml`.

## Clean

```
$ jekyll clean
```

Running this command removes `_site`, `.jekyll-metadata` and `.sass-cache`.

## Build and start the server

```
$ jekyll serve --livereload --trace
```

This starts a WEBrick web server on 127.0.0.1:4005. Same command with options `-H 0.0.0.0 -P $PORT` starts the server in production.

You can now view the documentation by navigating your web browser to `http://127.0.0.1:4005`

## Deploy

A commit on the `master` branch deploys to production, and a commit on the `development` branch deploys to staging.
