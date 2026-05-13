module "datasets" {
  source = "../../modules/datasets"

  project_id = var.project_id
  location = var.location
  environment = var.env
}