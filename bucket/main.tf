resource "google_storage_bucket" "bucket" {
  name = "satish-test-bucket-gcp"
  location = "us-east1"
  storage_class = "REGIONAL"

  labels = {
    "name" = "satish-test-bucket-gcp"
    location = "us-east1"
  }

  versioning {
    enabled = true
  }
}