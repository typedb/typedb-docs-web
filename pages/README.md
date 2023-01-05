# Documentation build guide

To be able to build the documentation you need to set up the proper environment:

1. [Install Ruby](#install-ruby)
2. [Install Ruby gems](#install-ruby-gems)
    - [Troubleshooting](#troubleshooting-bundle-installation)
3. [Install Node.js](#install-nodejs)
4. [Symlinking YAML files](#symlinking-yaml-files-of-docs-to-_data)

After you have set up the environment you can build the Documentation:

1. [Build](#build-documentation)
2. [Live web-server](#live-web-server)
   - [Troubleshooting web server](#troubleshooting-web-server)
3. [Clean up after previous build](#clean-up)

## Install Ruby
1. Clone this repository to your local machine: `git clone git@github.com:vaticle/web-docs.git --recursive`. The `--recursive` option needed to include the docs content as a submodule in the `pages/docs` directory.
2. Install [Homebrew](https://brew.sh/) if you don't have it already.
3. Install `gpg`: `brew install gnupg`
4. Install the mpapis public key (required for installing RVM): `gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 && gpg --keyserver hkp://keys.gnupg.net --recv-keys 7D2BAF1CF37B13E2069D6956105BD0E739499BDB`. Alternatively, try [these instructions](https://rvm.io/rvm/security#alternatives).
5. Install RVM: `\curl -sSL https://get.rvm.io | bash -s stable --ruby`
6. Using RVM, install ruby 3.0.0: `rvm install 3.0.0`. 
7. Use the recently installed version of ruby as default: `rvm use 3.0.0 --default`

## Install Ruby Gems

Navigate your CLI terminal to the pages directory inside the cloned web-docs repository: `cd web-docs/pages`. Then proceed to install Ruby Gems by executing following commands.

### Arch Linux

```
$ yaourt -S ruby-bundler
$ bundle install
```
### MacOS

```
$ gem install bundler
$ bundle install
```

### Troubleshooting bundle installation

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
because MacOS provides LibreSSL.

If you need to have openssl@3 first in your PATH, run:
  echo 'export PATH="/usr/local/opt/openssl@3/bin:$PATH"' >> ~/.zshrc

For compilers to find openssl@3 you may need to set:
  export LDFLAGS="-L/usr/local/opt/openssl@3/lib"
  export CPPFLAGS="-I/usr/local/opt/openssl@3/include"

For pkg-config to find openssl@3 you may need to set:
  export PKG_CONFIG_PATH="/usr/local/opt/openssl@3/lib/pkgconfig"
```

## Install Node.js

A javascript runtime (such as [Node.js](https://nodejs.org/en/download/)) is required to use 
Jekyll build.

Install it: `brew install node`.

## Symlinking YAML files of `/docs` to `/_data`

Make sure you've cloned the `docs` submodule of web-docs as well by calling `git submodule update --init`.

Given that Jekyll can only read data from files placed under `_data` and we'd like these files to be defined within the `docs` submodule, we need to run the `symlink_creator.sh` to create symlinks in `_data`. This script is located in the `pages` directory of the repository. You can run it by the following command.

```
sh symlink_creator.sh
```

After that, installation is complete.

## Build documentation web portal

### Build documentation

```
$ jekyll build
```

Running this command parses all markdown files in `docs/` to HTML and places them under `_site/docs/` directory. Any other files or folders are also moved into `_site/` unless explicitly excluded in [`_config.yml`](_config.yml).

### Live web server

The following command builds documentation and starts a WEBrick web server with the resulted web portal.

```
$ jekyll serve --trace --livereload
```

You can now view the documentation by navigating your web browser to `http://127.0.0.1:4005`.

Same command with `-H 0.0.0.0` and `-P $PORT` options starts the server in production.

#### Troubleshooting web server

If `jekyll serve --trace --livereload` gives the following error:

```
symbol not found in flat namespace '_SSL_get1_peer_certificate'
```

or any other SSL error, simply run `jekyll serve` instead.

### Clean up

```
$ jekyll clean
```

Running this command removes `_site`, `.jekyll-metadata` and `.sass-cache`.
