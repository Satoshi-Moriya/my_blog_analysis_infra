output "staging_dataset_id" {
  value = google_bigquery_dataset.staging.dataset_id
}

output "intermediate_dataset_id" {
  value = google_bigquery_dataset.intermediate.dataset_id
}

output "mart_dataset_id" {
  value = google_bigquery_dataset.mart.dataset_id
}
