output "VPN_Endpoint" {
  value = module.vsphere.vpn_endpoint
}

output "VPN_PSK" {
  sensitive = true
  value     = module.vsphere.vpn_psk
}

output "VPN_User" {
  value = module.vsphere.vpn_user
}

output "VPN_Password" {
  sensitive = true
  value     = module.vsphere.vpn_password
}

output "vCenter_FQDN" {
  value = module.vsphere.vcenter_fqdn
}

output "vCenter_Username" {
  value = module.vsphere.vcenter_username
}

output "vCenter_Password" {
  sensitive = true
  value     = module.vsphere.vcenter_password
}

output "vCenter_Appliance_Root_Password" {
  sensitive = true
  value     = module.vsphere.vcenter_root_password
}

#output "KSA_Token_Location" {
#  value = "The user cluster KSA Token (for logging in from GCP) is located at ./ksa_token.txt"
#}

#output "SSH_Key_Location" {
#  value = "An SSH Key was created for this environment, it is saved at ~/.ssh/${local.ssh_key_name}"
#}
