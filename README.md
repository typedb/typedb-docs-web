# Vaticle Documentation

## Clone
In order to clone `web-docs` along with its submodule `docs`, run:

```
$ git clone git@github.com:vaticle/web-docs.git --recursive
```

## Build

Refer to the `pages/README.md` for building instructions.

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
 
3. Then follow the steps in the Release pipeline defined in Factory.

**NOTE:** If, when upgrading the Docs styles (CSS/JS), the style changes do not appear in the live site, this may be caused by the Cloudflare cache. A person with admin permissions in Cloudflare can clear the cache to fix this issue.

#### Operation

To ssh into the machine, install the `gcloud` CLI and use the following command.

```
gcloud ssh web-docs
```

To view the logs of the job, go to the nomad GUI and select the job `web-docs` and view its log there.
