

# Requirements

## Ruby
1. Install [Homebrew](https://brew.sh/)
2. Install `gpg`: `brew install gnupg`
3. Install the mpapis public key (required for installing RVM): `gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 && gpg --keyserver hkp://keys.gnupg.net --recv-keys 7D2BAF1CF37B13E2069D6956105BD0E739499BDB`. Alternatively, try [these instructions](https://rvm.io/rvm/security#alternatives).
4. Install RVM: `\curl -sSL https://get.rvm.io | bash -s stable --ruby`
5. Install the version of ruby specified at the bottom of [`Gemfile.lock`](Gemfile.lock) using [RVM](https://rvm.io/rvm/install): `rvm install x.x.x`
6. Use the recently installed version of ruby as default: `rvm use x.x.x --default`

## Gems

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

## Node.js

A javascript runtime (such as [Node.js](https://nodejs.org/en/download/)) is required to use `jekyll build`.

### Troubleshooting

#### Any error

If `bundle install` fails with any error, try rerunning the command - it may be an intermittent bug.

#### eventmachine / openssl

If `bundle install` fails with the error:
```
An error occurred while installing eventmachine (1.2.7), and Bundler cannot continue.
```
Check the output and search for the error cause. If the cause is:
```
./project.h:119:10: fatal error: 'openssl/ssl.h' file not found
```
Run:
```
brew install openssl
brew info openssl
```
Follow the instructions in the output of `brew info openssl`, which at the time of writing reads:
```
openssl@3 is keg-only, which means it was not symlinked into /usr/local,
because macOS provides LibreSSL.

If you need to have openssl@3 first in your PATH, run:
  echo 'export PATH="/usr/local/opt/openssl@3/bin:$PATH"' >> ~/.zshrc

For compilers to find openssl@3 you may need to set:
  export LDFLAGS="-L/usr/local/opt/openssl@3/lib"
  export CPPFLAGS="-I/usr/local/opt/openssl@3/include"

For pkg-config to find openssl@3 you may need to set:
  export PKG_CONFIG_PATH="/usr/local/opt/openssl@3/lib/pkgconfig"
```

## Symlinking YAML files of `/docs` to `/_data`
Make sure you've cloned the `docs` submodule of web-docs as well by calling `git submodule update --init`.

Given that Jekyll can only read data from files placed under `_data` and we'd like these files to be defined within the `docs` submodule,
we need to run the `symlink_creator.sh` to create symlinks in `_data`.

```
sh symlink_creator.sh
```

# Build

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

### Troubleshooting

If `jekyll serve --trace --livereload` gives the following error:
```
symbol not found in flat namespace '_SSL_get1_peer_certificate'
```
Simply run `jekyll serve` instead.
