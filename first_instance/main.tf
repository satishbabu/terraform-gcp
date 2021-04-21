resource "google_compute_instance" "appserver" {
  name = "test-server"
  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image= var.image
    }
  }

  network_interface {
    network = "default"
  }

  service_account {
      scopes = [ "userinfo-email", "compute-ro", "storage-ro" ]
  }

}

output "machine_type" { value = "${google_compute_instance.appserver.machine_type}" }
output "name" { value = "${google_compute_instance.appserver.name}" }
