locals {
  ci_principal = "principalSet://iam.googleapis.com/projects/139080098373/locations/global/workloadIdentityPools/github-pool/attribute.repository/Satoshi-Moriya/my_blog_analysis_infra"
}

module "iam" {
  source = "../../modules/iam"

  env               = var.env
  project_id        = var.project_id
  ga_raw_dataset_id = var.ga_raw_dataset_id

  service_accounts_email  = module.service_accounts.sa_dbt_runner_email
  staging_dataset_id      = module.datasets.staging_dataset_id
  intermediate_dataset_id = module.datasets.intermediate_dataset_id
  mart_dataset_id         = module.datasets.mart_dataset_id
}

resource "google_storage_bucket_iam_member" "tfstate_ci" {
  bucket = "${var.project_id}-tfstate-bucket"
  role   = "roles/storage.admin"
  member = local.ci_principal
}

resource "google_project_iam_member" "ci" {
  for_each = toset([
    "roles/viewer",
  ])
  project = var.project_id
  role    = each.value
  member  = local.ci_principal
}
