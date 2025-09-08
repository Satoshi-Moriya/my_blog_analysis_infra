resource "google_service_account" "dbt_runner" {
  account_id   = "my-blog-analysis-sa"
  display_name = "my_blog_analysis用のService Account"
}