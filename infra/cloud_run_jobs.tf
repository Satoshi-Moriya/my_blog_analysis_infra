resource "google_cloud_run_v2_job" "dbt_job" {
  name                = "my-blog-analysis-dbt-job"
  location            = var.location
  deletion_protection = false

  template {
    template {
      containers {
        image = "asia-northeast1-docker.pkg.dev/my-blog-ga4-469009/my-repository/my-blog-analysis-etl:latest"

        # env {
        #   name  = "DBT_PROFILES_DIR"
        #   value = "/var/dbt/"
        # }

        # env {
        #   name  = "DBT_TARGET"
        #   value = var.dbt_target
        # }
      }
      service_account = google_service_account.dbt_runner.email
    }
  }
}