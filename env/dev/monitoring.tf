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

resource "google_monitoring_alert_policy" "job_failure_alert" {
  project               = var.project_id
  display_name          = "Error Alert for ${module.dbt_job.dbt_job_name}"
  combiner              = "OR"
  severity              = "ERROR"
  enabled               = true
  notification_channels = [google_monitoring_notification_channel.slack_alert.id]

  conditions {
    display_name = "Error Condition for ${module.dbt_job.dbt_job_name}"

    condition_threshold {
      # filterのmetric.typeにログベースの指標を指定（resource.typeの指定も必須）
      filter          = "resource.type=\"cloud_run_job\" AND metric.type=\"logging.googleapis.com/user/${google_logging_metric.job_failure.name}\""
      comparison      = "COMPARISON_GT"
      threshold_value = 0

      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_COUNT"
      }

      duration                = "60s"
      evaluation_missing_data = "EVALUATION_MISSING_DATA_INACTIVE"
    }
  }

  alert_strategy {
    notification_prompts = ["OPENED"]
  }

  documentation {
    subject = "ジョブ($${resource.label.job_name})の実行に失敗しました"

    content = <<-EOT
    ## Google Cloudプロジェクト
    $${resource.label.project_id}
    ## Cloud Runジョブ名
    $${resource.label.job_name} 
    ## アラートの説明
    Cloud Runジョブ**($${resource.label.job_name})**の実行に失敗しました。
    ジョブの実行ログおよびTerraformテンプレートの設定値を確認してください。
    EOT

    mime_type = "text/markdown"
  }
}