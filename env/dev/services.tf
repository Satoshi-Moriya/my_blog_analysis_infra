resource "google_project_service" "iam" {
  service = "iam.googleapis.com"

  disable_on_destroy = false
}

resource "google_project_service" "cloudresourcemanager" {
  service = "cloudresourcemanager.googleapis.com"

  disable_on_destroy = false
}