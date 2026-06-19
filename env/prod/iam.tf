resource "google_project_iam_member" "dbt_job_user" {
  project = var.project_id
  role    = "roles/bigquery.jobUser"
  member  = "serviceAccount:${module.service_accounts.sa_dbt_runner_email}"
}

resource "google_project_iam_member" "scheduler_invoker" {
  project = var.project_id
  role    = "roles/run.invoker"
  member  = "serviceAccount:${module.service_accounts.sa_dbt_runner_email}"
}

resource "google_bigquery_dataset_iam_member" "raw_viewer" {
  dataset_id = var.ga_raw_dataset_id
  project    = var.project_id
  role       = "roles/bigquery.dataViewer"
  member     = "serviceAccount:${module.service_accounts.sa_dbt_runner_email}"
}

resource "google_bigquery_dataset_iam_member" "new_staging_editor" {
  dataset_id = module.datasets.staging_dataset_id
  project    = var.project_id
  role       = "roles/bigquery.dataEditor"
  member     = "serviceAccount:${module.service_accounts.sa_dbt_runner_email}"
}

resource "google_bigquery_dataset_iam_member" "new_intermediate_editor" {
  dataset_id = module.datasets.intermediate_dataset_id
  project    = var.project_id
  role       = "roles/bigquery.dataEditor"
  member     = "serviceAccount:${module.service_accounts.sa_dbt_runner_email}"
}

resource "google_bigquery_dataset_iam_member" "new_mart_editor" {
  dataset_id = module.datasets.mart_dataset_id
  project    = var.project_id
  role       = "roles/bigquery.dataEditor"
  member     = "serviceAccount:${module.service_accounts.sa_dbt_runner_email}"
}

resource "google_bigquery_dataset_iam_member" "new_raw_viewer" {
  dataset_id = var.ga_raw_dataset_id
  project    = var.project_id
  role       = "roles/bigquery.dataViewer"
  member     = "serviceAccount:${module.service_accounts.sa_dbt_runner_email}"
}