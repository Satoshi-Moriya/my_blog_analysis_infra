module "dbt_job" {
  source = "../../modules/cloud_run_jobs"

  location          = var.location
  project_id        = var.project_id
  ga_raw_dataset_id = var.ga_raw_dataset_id
  env               = var.env

  service_accounts_email = module.service_accounts.sa_dbt_runner_email
}