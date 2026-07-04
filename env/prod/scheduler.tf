module "scheduler" {
  source = "../../modules/scheduler"

  env                    = var.env
  project_id             = var.project_id
  service_accounts_email = module.service_accounts.sa_dbt_runner_email
  dbt_job_name           = module.dbt_job.dbt_job_name
}

moved {
  from = google_cloud_scheduler_job.dbt_job_scheduler
  to   = module.scheduler.google_cloud_scheduler_job.dbt_job_scheduler[0]
}