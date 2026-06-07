resource "google_service_usage_consumer_quota_override" "query_usage_per_day_per_project" {
  provider       = google-beta
  project        = var.project_id
  service        = "bigquery.googleapis.com"
  metric         = urlencode("bigquery.googleapis.com/quota/query/usage")
  limit          = urlencode("/d/project")
  override_value = "30000"
  force          = true
}