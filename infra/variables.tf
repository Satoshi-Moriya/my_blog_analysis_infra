variable "project_id" {
  description = "Google CloudのProject ID"
  type        = string
}

variable "bq_location" {
  description = "BigQueryのlocation"
  type        = string
  default     = "asia-northeast1"
}

variable "region" {
  description = "Google Cloudのregion"
  type        = string
  default     = "asia-northeast1"
}

variable "ga_raw_dataset_id" {
  description = "GA4のエキスポートしているdatasetのID"
  type        = string
}