resource "google_storage_bucket" "backend_bucket" {
  name     = "${var.project_id}-tfstate-bucket"
  location = "us-west1"

  force_destroy               = false
  public_access_prevention    = "enforced"
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 30
    }
  }
}

resource "local_file" "default" {
  file_permission = "0644"
  filename        = "./backend.tf"

  content = <<-EOT
  terraform {
    backend "gcs" {
      bucket = "${google_storage_bucket.backend_bucket.name}"
      prefix = "terraform/state"
    }
  }
  EOT
}