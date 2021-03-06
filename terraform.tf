terraform {
  required_version = "= 0.14.3"

  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }

  backend "gcs" {
    bucket = "upday-challenge-tf-state"
    prefix = "terraform/state/"
  }
}