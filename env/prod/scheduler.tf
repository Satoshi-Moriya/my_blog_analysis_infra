module "scheduler" {
  source = "../../modules/scheduler"

  env                    = var.env
  project_id             = var.project_id
  service_accounts_email = module.service_accounts.sa_dbt_runner_email
  dbt_job_name           = module.dbt_job.dbt_job_name
}