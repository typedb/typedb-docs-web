terraform {
  backend "gcs" {
    bucket  = "vaticle-web-dev-terraform-state"
    prefix  = "terraform/applications/web-docs"
  }
}

provider "google" {
  project = "vaticle-web-dev"
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

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["web-docs"]
}

resource "google_compute_instance" "web_docs" {
  name                      = "web-docs"
  machine_type              = "n1-standard-2"

  boot_disk {
    initialize_params {
      image = "vaticle-web-dev/nomad-client-22c68d0fdd2a595b48537aeb254526d134d1d38f"
    }
    device_name = "boot"
  }

  service_account {
    email = "grabl-dev@vaticle-web-dev.iam.gserviceaccount.com"
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

  metadata_startup_script = templatefile("${path.module}/../startup-nomad-client.sh", { APPLICATION = "web-docs", SECRET = "web", EXTRA_SCRIPT = "" })
}
