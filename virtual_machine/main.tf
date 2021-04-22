resource "google_compute_instance" "appserver" {
  name = "appserver"
  machine_type = var.machine_type["dev"]
  can_ip_forward = false
  description = "this is our virtual Machine"

  tags = [ "allow-http", "allow-https" ]

  boot_disk {
    initialize_params {
      image = "${var.image}"
    }
  }

  labels = {
    name = "appserver"
    machine_type = var.machine_type["dev"]
  }

  metadata = {
    size = "20"
    foo = "bar"
  }

  metadata_startup_script = "echo hi >/test.txt"

  network_interface {
    network = "default"
  }

}


# app server
output "machine_type" { value = "${google_compute_instance.appserver.machine_type}" }
output "name" { value = "${google_compute_instance.appserver.name}" }

