job "web-docs-staging" {
  region = "uk"

  datacenters = ["uk"]

  type = "service"

  constraint {
    attribute = "${node.class}"
    value     = "web-docs-staging"
  }

  group "web-docs-staging" {
    count = 1

    network {
      mode = "bridge"

      port "https" {
        static = 443
        to = 8080
      }
    }

    task "web-docs-staging" {
      driver = "java"

      meta {
        commit = "${COMMIT}"
      }

      config {
        jar_path = "local/web-docs-0.0.0-${COMMIT}/server.jar"
        jvm_options = ["-Dpidfile.path=/dev/null"]
        args = ["--resources=local/web-docs-0.0.0-${COMMIT}/resources", "--pages=local/web-docs-0.0.0-${COMMIT}/_site"]
      }

      artifact {
        source = "https://repo.vaticle.com/repository/artifact-snapshot/vaticle_web_docs/${COMMIT}/web-docs-0.0.0-${COMMIT}.tar.gz"
      }

      template {
        data = <<EOH
{{ with secret "web/keystore" }}{{ .Data.value | base64Decode }}{{ end }}
EOH
        destination   = "local/keystore.jks"
      }

      template {
        data = <<EOH
LOCAL_PORT="8080"
KEYSTORE_FILE="local/keystore.jks"
KEYSTORE_PASSWORD="{{ with secret "web/keystore-password" }}{{ .Data.value }}{{ end }}"
EOH
        destination   = "local/environment"
        env = true
      }

      vault {
        policies = ["web-docs-staging"]
      }

      resources {
        cpu    = 1000
        memory = 2048
      }
    }
  }
}
