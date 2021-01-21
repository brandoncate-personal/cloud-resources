resource "google_storage_bucket" "terraform" {
  name          = "bcate-terraform-backend"
  location      = "US"
  force_destroy = true
  storage_class = "STANDARD"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    condition {
      age = 14
    }
    action {
      type = "Delete"
    }
  }
}