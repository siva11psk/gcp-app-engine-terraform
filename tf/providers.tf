terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.18.0"
    }
  }
}


provider "google" {
  project     = local.gcp-project-id
  region      = local.app-engine-location
}

