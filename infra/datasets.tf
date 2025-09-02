resource "google_bigquery_dataset" "staging" {
  dataset_id  = "staging"
  project     = var.project_id
  location    = var.bq_location
  description = "staging層用のdataset"
  deletion_protection = false

  labels = {
    environment = "prod"
    team        = "data-engineering"
  }
}

resource "google_bigquery_dataset" "intermediate" {
  dataset_id  = "intermediate"
  project     = var.project_id
  location    = var.bq_location
  description = "intermediate層用のdataset"
  deletion_protection = false

  labels = {
    environment = "prod"
    team        = "data-engineering"
  }
}

resource "google_bigquery_dataset" "mart" {
  dataset_id  = "mart"
  project     = var.project_id
  location    = var.bq_location
  description = "mart層用のdataset"
  deletion_protection = false

  labels = {
    environment = "prod"
    team        = "data-engineering"
  }
}