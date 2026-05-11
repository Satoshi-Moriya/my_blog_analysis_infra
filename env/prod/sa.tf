module "service_accounts" {
  source = "../../modules/sa"

  env        = var.env
  project_id = var.project_id
}