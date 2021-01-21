terraform {
  backend "gcs" {
    bucket  = "bcate-terraform-backend"
    prefix  = "terraform/domain-aws/state"
  }
}