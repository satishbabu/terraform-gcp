variable "environment" { default = "production" }

resource "google_compute_instance" "appserver" {
  name = "app-server"
  machine_type = "${var.environment == "production" ? "f1-micro" : "n1-standard-1"}"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
  }
}


# app server
output "machine_type" { value = "${google_compute_instance.appserver.machine_type}" }
