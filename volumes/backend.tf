terraform {
  backend "gcs" {
    bucket  = "bcate-terraform-backend"
    prefix  = "terraform/volume/state"
  }
}