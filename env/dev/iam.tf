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

moved {
  from = google_project_iam_member.dbt_job_user
  to   = module.iam.google_project_iam_member.dbt_job_user
}

moved {
  from = google_bigquery_dataset_iam_member.staging_editor
  to   = module.iam.google_bigquery_dataset_iam_member.staging_editor
}

moved {
  from = google_bigquery_dataset_iam_member.intermediate_editor
  to   = module.iam.google_bigquery_dataset_iam_member.intermediate_editor
}

moved {
  from = google_bigquery_dataset_iam_member.mart_editor
  to   = module.iam.google_bigquery_dataset_iam_member.mart_editor
}

moved {
  from = google_bigquery_dataset_iam_member.raw_viewer
  to   = module.iam.google_bigquery_dataset_iam_member.raw_viewer
}