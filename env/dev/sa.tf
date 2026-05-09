resource "google_service_account" "ci_runner" {
  account_id   = "my-blog-analysis-ci-sa"
  display_name = "my_blog_analysisのci用のService Account"
  project      = var.project_id
}

resource "google_service_account" "dbt_runner" {
  account_id   = "my-blog-analysis-sa"
  display_name = "my_blog_analysis用のService Account"
  project      = var.project_id
}