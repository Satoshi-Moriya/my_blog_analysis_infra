module "iam" {
  source = "../../modules/iam"

  env               = var.env
  project_id        = var.project_id
  ga_raw_dataset_id = var.ga_raw_dataset_id

  service_accounts_email  = module.service_accounts.sa_dbt_runner_email
  staging_dataset_id      = module.datasets.staging_dataset_id
  intermediate_dataset_id = module.datasets.intermediate_dataset_id
  mart_dataset_id         = module.datasets.mart_dataset_id
}