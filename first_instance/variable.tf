variable "image" { default = "debian-cloud/debian-9" }

variable "machine_type" { 
    default = {
        dev = "f1-micro"
        prod = "prod box wont work"
    } 
}

variable "name_count" { default = ["server1", "server2", "server3"] }