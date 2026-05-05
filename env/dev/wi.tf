resource "google_iam_workload_identity_pool" "github_pool" {
  description               = "GitHub Actions から実行する際に使用"
  disabled                  = false
  display_name              = "github-pool"
  project                   = var.project_id
  workload_identity_pool_id = "github-pool"
}

resource "google_iam_workload_identity_pool_provider" "github_pool_provider" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.github_pool.workload_identity_pool_id
  workload_identity_pool_provider_id = "github-pool-provider"

  # 外部のリポジトリから使えないようにするため、attribute_conditionを必ず設定する
  attribute_condition = "assertion.repository == 'Satoshi-Moriya/my_blog_analytics_etl'"
  attribute_mapping = {
    "attribute.repository"       = "assertion.repository"
    "attribute.repository_owner" = "assertion.repository_owner"
    "google.subject"             = "assertion.sub"
  }
  description  = null
  disabled     = false
  display_name = "github-pool-provider"
  project      = var.project_id

  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}