resource "google_bigquery_dataset" "staging" {
  dataset_id  = "staging"
  project     = var.project_id
  location    = var.bq_location
  description = "staging層用のdataset"

  labels = {
    environment = "prod"
  }
}

resource "google_bigquery_dataset" "intermediate" {
  dataset_id  = "intermediate"
  project     = var.project_id
  location    = var.bq_location
  description = "intermediate層用のdataset"

  labels = {
    environment = "prod"
  }
}

resource "google_bigquery_dataset" "mart" {
  dataset_id  = "mart"
  project     = var.project_id
  location    = var.bq_location
  description = "mart層用のdataset"

  labels = {
    environment = "prod"
  }
}