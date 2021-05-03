variable "nsdomain" {
  type        = string
  default     = "metal.local"
  description = "NSX Domain"
}
variable "cluster_name" {
  type        = string
  default     = "metal-supervisor-tf"
  description = "Supervisor Cluster Name"
}
variable "namespace" {
  type        = string
  default     = "Default"
  description = "Cluster Namespace"
}
variable "storagepolicy" {
  type        = string
  description = "Storage Policy Name configured in vSAN"
}
variable "storagelimit" {
  type        = string
  description = "Storage Policy limit"
}

variable "cp_vm_network" {
  type        = string
  description = "VM Network CIDR"
}

variable "cp_subnet_mask" {
  type        = string
  description = "VM Network Subnet Mask"
}

variable "cp_gateway_ip" {
  type        = string
  description = "VM Network Gateway Address"
}

variable "starting_ip" {
  type        = string
  description = "VM Network Range Starting IP for Cluster Services"
}

variable "dns_server" {
  type        = string
  description = "DNS Server (Either configured in NSX or external)"
}
variable "ntp_server" {
  type        = string
  description = "NTP configured in VMWare or external"
}
variable "storage_policy_name" {
  type        = string
  description = "Storage Policy Name"
}
variable "egress_starting_ip" {
  type        = string
  description = "Your first usable Metal Elastic Subnet address for Egress range"
}
variable "ingress_starting_ip" {
  type        = string
  description = "Your first usable Metal Elastic Subnet address for Ingress range"
}

# vSphere

variable "metal_auth_token" {
  type        = string
  sensitive   = true
  description = "Equinix Metal API Key"
}

variable "metal_project_id" {
  type        = string
  default     = "null"
  description = "Equinix Metal Project ID"
}

variable "metal_organization_id" {
  type        = string
  default     = "null"
  description = "Equinix Metal Organization ID"
}

variable "metal_create_project" {
  type        = bool
  default     = true
  description = "Create a Metal Project if this is 'true'. Else use provided 'metal_project_id'"
}

variable "metal_project_name" {
  type        = string
  default     = "baremetal-anthos"
  description = "The name of the Metal project if 'create_project' is 'true'."
}

variable "s3_url" {
  description = "This is the URL endpoint to connect your s3 client to"
  type        = string
  default     = "https://s3.example.com"
}

variable "s3_access_key" {
  description = "This is the access key for your S3 endpoint"
  sensitive   = true
  type        = string
  default     = "S3_ACCESS_KEY"
}

variable "s3_secret_key" {
  description = "This is the secret key for your S3 endpoint"
  sensitive   = true
  type        = string
  default     = "S3_SECRET_KEY"
}

variable "s3_version" {
  type        = string
  description = "S3 API Version (S3v2, S3v4)"
  default     = "S3v4"
}

variable "object_store_bucket_name" {
  type        = string
  description = "This is the name of the bucket on your Object Store"
  default     = "vmware"
}

variable "vcenter_iso_name" {
  type        = string
  description = "The name of the vCenter ISO in your Object Store"
}

variable "relative_path_to_gcs_key" {
  type        = string
  description = "If you are using GCS to download you vCenter ISO this is the path to the GCS key"
  default     = "storage-reader-key.json"
}

# vSphere Licenses

variable "vsphere_license" {
  type        = string
  description = "Your vSphere license key."
}
variable "vsphere_addon_license" {
  type        = string
  description = "Your vSphere Addon License."
}
variable "vsphere_enterprise_license" {
  type        = string
  description = "Your vSphere Enterprise License."
}

# NSX

variable "nsx_manager_ova_name" {
  type        = string
  description = "NSX OVA file name in S3 bucket"
}

variable "nsx_controller_ova_name" {
  type        = string
  description = "NSX Controller OVA file name in S3 bucket"
}

variable "nsx_edge_ova_name" {
  type        = string
  description = "NSX Edge OVA file name in S3 bucket"
}

variable "nsx_license" {
  type        = string
  description = "Your NSX License"
}

variable "nsx_domain_0" {
  type        = string
  default     = "metal.local"
  description = "NSX Network Domain"
}


