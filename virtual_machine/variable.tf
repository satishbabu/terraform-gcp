variable "image" { default = "debian-cloud/debian-9" }

variable "machine_type" { 
    default = {
        dev = "f1-micro"
        prod = "prod box wont work"
    } 
}
