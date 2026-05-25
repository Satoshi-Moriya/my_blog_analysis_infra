resource "google_logging_metric" "job_failure" {
  project     = var.project_id
  name        = "error_metric_for_${module.dbt_job.dbt_job_name}"
  description = "Cloud Run Job（${module.dbt_job.dbt_job_name}）の実行失敗を検知するログベースの指標"

  filter = <<-EOT
  severity>=ERROR
  resource.type="cloud_run_job"
  resource.labels.job_name="${module.dbt_job.dbt_job_name}"
  resource.labels.location="${var.location}"
  logName=~"cloudaudit.googleapis.com%2Fsystem_event"
  EOT

  metric_descriptor {
    metric_kind = "DELTA"
    value_type  = "INT64"
  }
}

resource "google_monitoring_notification_channel" "slack_alert" {
  project      = var.project_id
  display_name = "ジョブエラー通知用メールアドレス"
  type         = "email"
  force_delete = false

  labels = {
    email_address = var.notification_email
  }
}