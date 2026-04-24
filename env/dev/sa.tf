resource "google_service_account" "ci_runner" {
  account_id   = "my-blog-analysis-ci-sa"
  display_name = "my_blog_analysisのci用のService Account"
  project = var.project_id
}