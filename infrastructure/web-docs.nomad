job "web-docs" {
  region = "uk"

  datacenters = ["uk"]

  type = "service"

  constraint {
    attribute = "${node.class}"
    value     = "web-docs"
  }

//  update {
//    auto_revert  = true
//  }

  group "web-docs" {
    count = 1

    network {
      mode = "bridge"

      port "https" {
        static = 443
        to = 8080
      }
    }

    task "web-docs" {
      driver = "java"

      config {
        jar_path = "local/web-docs-${VERSION}/server.jar"
        jvm_options = ["-Dpidfile.path=/dev/null"]
        args = ["--resources=local/web-docs-${VERSION}/resources", "--pages=local/web-docs-${VERSION}/_site"]
      }

      artifact {
        source = "https://repo.vaticle.com/repository/artifact/vaticle_web_docs/${VERSION}/web-docs-${VERSION}.tar.gz"
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
        policies = ["web-docs"]
      }

      resources {
        cpu    = 1000
        memory = 2048
      }
    }
  }
}
