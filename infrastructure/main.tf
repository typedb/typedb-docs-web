terraform {
  backend "gcs" {
    bucket  = "vaticle-web-prod-terraform-state"
    prefix  = "terraform/applications/web-docs"
  }
}

provider "google" {
  project = "vaticle-web-prod"
  region  = "europe-west2"
  zone    = "europe-west2-b"
}

# WARNING: Destroy this resource will not guarantee terraform allocate the same IP address after apply
resource "google_compute_address" "web_docs_static_ip" {
  name = "web-docs-static-ip"
}

resource "google_compute_firewall" "web_docs_firewall" {
  name    = "web-docs-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  target_tags = ["web-docs"]
}

data "http" "startup_script_template" {
  url = "https://raw.githubusercontent.com/vaticle/web-infrastructure/master/nomad/startup/startup-nomad-client.sh"
}

data "template_file" "web_docs_startup_script" {
  template = data.http.startup_script_template.body
  vars = {
    APPLICATION = "web-docs"
    SECRET = "web"
    EXTRA_SCRIPT = ""
  }
}

resource "google_compute_instance" "web_docs" {
  name                      = "web-docs"
  machine_type              = "n1-standard-2"

  boot_disk {
    initialize_params {
      image = "vaticle-web-prod/nomad-client-77101614b940b872a97efa8ecca7783b2e4471a2"
    }
    device_name = "boot"
  }

  service_account {
    email = "grabl-prod@vaticle-web-prod.iam.gserviceaccount.com"
    scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  network_interface {
    network = "default"

    access_config {
      nat_ip = google_compute_address.web_docs_static_ip.address
    }
  }

  tags = ["nomad-client", "web-docs"]

  metadata_startup_script = data.template_file.web_docs_startup_script.rendered
}
