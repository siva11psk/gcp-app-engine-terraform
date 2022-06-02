output "app_engine_application_id" {
    value = google_app_engine_application.app-engine-application.id  
}

output "app_engine_application_name" {
    value = google_app_engine_application.app-engine-application.name
}

output "app_engine_application_default_host" {
    value = google_app_engine_application.app-engine-application.default_hostname
}