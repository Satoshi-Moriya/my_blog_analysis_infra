module "monitoring" {
  source = "../../modules/monitoring"

  location            = var.location
  project_id         = var.project_id
  notification_email = var.notification_email

  dbt_job_name       = module.dbt_job.dbt_job_name
}