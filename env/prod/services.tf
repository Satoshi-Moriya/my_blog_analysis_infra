resource "google_project_service" "scheduler" {
  service = "cloudscheduler.googleapis.com"
}