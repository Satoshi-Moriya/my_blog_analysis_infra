resource "google_bigquery_dataset" "staging" {
  dataset_id  = "staging"
  project     = var.project_id
  location    = var.location
  description = "dev環境のstaging層用のdataset"

  labels = {
    environment = "dev"
  }
}

resource "google_bigquery_dataset" "intermediate" {
  dataset_id  = "intermediate"
  project     = var.project_id
  location    = var.location
  description = "dev環境のintermediate層用のdataset"

  labels = {
    environment = "dev"
  }
}

resource "google_bigquery_dataset" "mart" {
  dataset_id  = "mart"
  project     = var.project_id
  location    = var.location
  description = "dev環境のmart層用のdataset"

  labels = {
    environment = "dev"
  }
}