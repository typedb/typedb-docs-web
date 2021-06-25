# Vaticle Documentation

## Clone
In order to clone `web-docs` along with its submodule `docs`, run:

```
$ git clone git@github.com:vaticle/web-docs.git --recursive
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

## Infrastructure manual

The infrastructure package contains the nomad client machine definition (written in [terraform](https://www.terraform.io/)) and nomad job definition (written in [nomad](https://www.nomadproject.io/)). During deployment, the nomad client machine will be created, and the nomad job will run as a container on the nomad client machine.

**NOTE:** All the following code assumes you have GCP credentials and nomad credential environment variables set up in your shell. Refer to `web-infrastructure` repo on how to set them up. Please access the GCP console [here](https://console.cloud.google.com/), and the project name is `vaticle-web-prod`.

#### Deployment

1. First we need to deploy the nomad client to run the web-docs server. We can change the nomad client image version to the one we desire. You don't need to perform this step if there's no change needed for the server hardware.

    ```
   terraform plan && terraform apply
    ```

2. We then need to insert the following credentials needed by the web-docs server to run. You don't need to perform this step if the credentials are already present on the vault server.

    ```
   vault kv put web/keystore value=$(cat keystore | base64)
   vault kv put web/keystore-password value=$(cat keystore-password)
   vault kv put web-docs/application-secret value=$(cat application-secret)
    ```
 
3. Then follow the steps in the Release pipeline defined in grabl.

**NOTE:** If, when upgrading the Docs styles (CSS/JS), the style changes do not appear in the live site, this may be caused by the Cloudflare cache. A person with admin permissions in Cloudflare can clear the cache to fix this issue.

#### Operation

To ssh into the machine, install the `gcloud` CLI and use the following command.

```
gcloud ssh web-docs
```

To view the logs of the job, go to the nomad GUI and select the job `web-docs` and view its log there.
