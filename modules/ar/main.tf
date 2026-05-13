resource "google_artifact_registry_repository" "my_repo" {
  repository_id = "my-repository"
  location      = var.location
  description   = "docker repository"
  format        = "DOCKER"
}