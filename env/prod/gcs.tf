module "backend_bucket" {
  source = "../../modules/gcs"

  project_id = var.project_id
}