terraform {
  backend "gcs" {
    bucket  = "bcate-terraform-backend"
    prefix  = "terraform/gke/state"
  }
}