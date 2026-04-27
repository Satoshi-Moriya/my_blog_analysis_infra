resource "google_bigquery_dataset" "staging" {
  dataset_id  = "staging"
  project     = var.project_id
  location    = var.location
  description = "staging層用のdataset"

  labels = {
    environment = var.environment
  }
}

resource "google_bigquery_dataset" "intermediate" {
  dataset_id  = "intermediate"
  project     = var.project_id
  location    = var.location
  description = "intermediate層用のdataset"

  labels = {
    environment = var.environment
  }
}

resource "google_bigquery_dataset" "mart" {
  dataset_id  = "mart"
  project     = var.project_id
  location    = var.location
  description = "mart層用のdataset"

  labels = {
    environment = var.environment
  }
}