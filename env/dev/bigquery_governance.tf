module "bigquery_governance" {
  source = "../../modules/bigquery_governance"

  project_id = var.project_id
}