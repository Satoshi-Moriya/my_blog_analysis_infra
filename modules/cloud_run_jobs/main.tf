resource "google_cloud_run_v2_job" "dbt_job" {
  name                = "my-blog-analysis-dbt-job"
  location            = var.location
  deletion_protection = false

  template {
    template {
      containers {
        name    = "my-blog-analysis-etl"
        image   = "asia-northeast1-docker.pkg.dev/${var.project_id}/my-repository/my-blog-analysis-etl:latest"
        command = ["bash"]
        args    = ["/app/scripts/batch.sh"]

        env {
          name  = "DBT_TARGET"
          value = var.env
        }

        env {
          name  = "DBT_GCP_PROJECT"
          value = var.project_id
        }

        env {
          name  = "DBT_BIGQUERY_DATASET"
          value = var.ga_raw_dataset_id
        }

      }
      service_account = var.service_accounts_email

      max_retries = 1
      timeout     = "3600s"
    }
  }

  lifecycle {
    ignore_changes = [
      client,
    ]
  }
}
