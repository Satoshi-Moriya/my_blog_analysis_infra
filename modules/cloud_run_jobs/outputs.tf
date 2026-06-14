output "dbt_job_name" {
  value = google_cloud_run_v2_job.dbt_job.name
}