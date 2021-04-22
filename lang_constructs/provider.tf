provider "google" {
    project = "gcp-playground-305516"
    region = "us-east1"
    zone = "us-east1-c"

    credentials = file("${path.module}/../credentials/secrets.json")
}