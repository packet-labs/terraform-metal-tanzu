data "template_file" "create_namespace" {
  template = file("${path.module}/templates/create_namespace.py")
  vars = {
    host          = module.vsphere.vcenter_fqdn
    user          = module.vsphere.vcenter_username
    password      = module.vsphere.vcenter_root_password
    nsuser        = "admin"
    nsdomain      = module.nsx-dc.nsx_password
    clustername   = var.cluster_name
    namespace     = var.namespace
    storagepolicy = var.storagepolicy
    storagelimit  = var.storagelimit
  }
}

resource "null_resource" "namespace_config" {
  connection {
    type        = "ssh"
    user        = "root"
    private_key = file(module.vsphere.ssh_key_path)
    host        = module.vsphere.bastion_host
  }

  provisioner "file" {
    content     = data.template_file.create_namespace.rendered
    destination = "/root/create_namespace.py"
  }
}

resource "null_resource" "apply_namespace_config" {

  connection {
    type        = "ssh"
    user        = "root"
    private_key = file(module.vsphere.ssh_key_path)
    host        = module.vsphere.bastion_host

  }

  provisioner "remote-exec" {
    inline     = ["python3 /root/create_namespace.py"]
    on_failure = continue
  }
}

data "template_file" "configure_supervisor_cluster" {
  template = file("${path.module}/templates/configure_supervisor_cluster.py")
  vars = {
    host            = module.vsphere.vcenter_fqdn
    user            = module.vsphere.vcenter_username
    password        = module.vsphere.vcenter_root_password
    clustername     = var.cluster_name
    mastervmnetwork = var.cp_vm_network
    startingip      = var.starting_ip
    mastersm        = var.cp_subnet_mask
    gatewayip       = var.cp_gateway_ip
    dnsserver       = var.dns_server
    ntpserver       = var.ntp_server
    storagepolicy   = var.storage_policy_name
    egressaddress   = var.egress_starting_ip
    ingressaddress  = var.ingress_starting_ip
  }
}

resource "null_resource" "supervisor_cluster_config" {
  connection {
    type        = "ssh"
    user        = "root"
    private_key = file(module.vsphere.ssh_key_path)
    host        = module.vsphere.bastion_host
  }

  provisioner "file" {
    content     = data.template_file.configure_supervisor_cluster.rendered
    destination = "/root/configure_supervisor_cluster.py"
  }
}

resource "null_resource" "apply_supervisor_cluster_config" {

  connection {
    type        = "ssh"
    user        = "root"
    private_key = file(module.vsphere.ssh_key_path)
    host        = module.vsphere.bastion_host
  }

  provisioner "remote-exec" {
    inline     = ["python3 /root/configure_supervisor_cluster.py"]
    on_failure = continue
  }
}
