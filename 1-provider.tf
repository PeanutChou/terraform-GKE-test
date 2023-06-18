# https://registry.terraform.io/providers/hashicorp/google/latest/docs
provider "google" {
  credentials = "${file("service-cred.json")}"
  project = "turing-app-389812"
  region  = "asia-east1"
}

# https://www.terraform.io/language/settings/backends/gcs
terraform {
  backend "gcs" {
    bucket = "test-terraform-peanut"
    prefix = "terraform/state"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}
