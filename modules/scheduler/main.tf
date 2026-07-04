resource "google_cloud_scheduler_job" "dbt_job_scheduler" {
  count = var.env == "prod" ? 1 : 0

  name      = "dbt-job-scheduler"
  schedule  = "0 11 * * *"
  time_zone = "Asia/Tokyo"

  http_target {
    http_method = "POST"
    uri         = "https://asia-northeast1-run.googleapis.com/apis/run.googleapis.com/v1/namespaces/${var.project_id}/jobs/${var.dbt_job_name}:run"

    oauth_token {
      service_account_email = var.service_accounts_email
    }
  }
}