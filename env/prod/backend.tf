terraform {
  backend "gcs" {
    bucket = "my-blog-ga4-469009-tfstate-bucket"
    prefix = "terraform/state"
  }
}
