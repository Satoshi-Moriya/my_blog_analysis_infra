resource "google_cloud_scheduler_job" "dbt_job_scheduler" {
  name      = "dbt-job-scheduler"
  schedule  = "0 11 * * *"
  time_zone = "Asia/Tokyo"

  http_target {
    http_method = "POST"
    uri         = "https://asia-northeast1-run.googleapis.com/apis/run.googleapis.com/v1/namespaces/${var.project_id}/jobs/${google_cloud_run_v2_job.dbt_job.name}:run"

    oauth_token {
      service_account_email = google_service_account.dbt_runner.email
    }
  }
}