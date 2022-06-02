terraform {
  backend "gcs" {
    bucket  = "your-bucket-name"
    prefix  = "terraform/state"
  }
}