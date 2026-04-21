terraform {
  backend "gcs" {
    bucket = "my-blog-ga4-dev-tfstate-bucket"
    prefix = "terraform/state"
  }
}
