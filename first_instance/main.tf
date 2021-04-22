resource "google_compute_instance" "appserver" {
  count = "${length(var.name_count)}"
  name = "test-server-${count.index+1}"
  machine_type = var.machine_type["dev"]

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


resource "google_compute_instance" "second" {
  name = "second-server"
  machine_type = var.machine_type["dev"]

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

  depends_on = [ google_compute_instance.appserver ]
}


# app server
output "machine_type" { value = "${google_compute_instance.appserver.*.machine_type}" }
output "name" { value = "${google_compute_instance.appserver.*.name}" }
output "instance_id" {value = "${join(",", google_compute_instance.appserver.*.machine_type)}"}

# second server
output "machine_type_second" { value = "${google_compute_instance.second.machine_type}" }
output "name_second" { value = "${google_compute_instance.second.name}" }
output "instance_id_second" {value = "${google_compute_instance.second.id}" }
