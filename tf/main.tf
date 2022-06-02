
#app engine project
resource "google_app_engine_application" "app-engine-application" {
  project     = local.gcp-project-id
  location_id = local.app-engine-location
}


