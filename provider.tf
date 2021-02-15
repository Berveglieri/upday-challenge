provider "google" {
  project = terraform.workspace == "production" ? var.prod_project_id : var.stg_project_id
  region  = "us-cental1"
}

provider "google-beta" {
  project = terraform.workspace == "production" ? var.prod_project_id : var.stg_project_id
  region  = "us-cental1"
}