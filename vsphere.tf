module "vsphere" {
  source                   = "equinix/vsphere/metal"
  version                  = "3.0.0"
  auth_token               = var.metal_auth_token
  organization_id          = var.metal_organization_id
  project_id               = var.metal_project_id
  s3_url                   = var.s3_url
  s3_access_key            = var.s3_access_key
  s3_secret_key            = var.s3_secret_key
  object_store_bucket_name = var.object_store_bucket_name
  vcenter_iso_name         = var.vcenter_iso_name
  create_project           = var.metal_create_project
}

