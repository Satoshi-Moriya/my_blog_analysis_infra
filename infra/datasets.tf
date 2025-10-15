resource "google_bigquery_dataset" "prod_staging" {
  dataset_id  = "prod_staging"
  project     = var.project_id
  location    = var.bq_location
  description = "本番環境のstaging層用のdataset"

  labels = {
    environment = "prod"
  }
}

resource "google_bigquery_dataset" "prod_intermediate" {
  dataset_id  = "prod_intermediate"
  project     = var.project_id
  location    = var.bq_location
  description = "本番環境のintermediate層用のdataset"

  labels = {
    environment = "prod"
  }
}

resource "google_bigquery_dataset" "prod_mart" {
  dataset_id  = "prod_mart"
  project     = var.project_id
  location    = var.bq_location
  description = "本番環境のmart層用のdataset"

  labels = {
    environment = "prod"
  }
}