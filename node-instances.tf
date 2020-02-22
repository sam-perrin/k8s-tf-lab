resource "vsphere_virtual_machine" "node0" {
  count = "${var.node_count}"
  name             = "node0${count.index + 1}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
  folder = "Kubernetes"

  num_cpus = 2
  memory   = 2048
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"

  scsi_type = "${data.vsphere_virtual_machine.template.scsi_type}"

  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }

  disk {
    label = "disk0"
    size  = "${data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  clone {
      template_uuid = "${data.vsphere_virtual_machine.template.id}"
      customize {
        linux_options {
          host_name = "node0${count.index + 1}"
          domain    = "${var.dns_suffixes}"
        }

        network_interface {
          ipv4_address = "192.168.118.15${count.index + 6}"
          ipv4_netmask = 24
        }

        ipv4_gateway = "${var.vlan10_gw}"
        dns_server_list = [ "${var.dns_servers}" ]
        dns_suffix_list = [ "${var.dns_suffixes}"]
    }
  }
  connection {
    type = "ssh"
    user = "terraform"
    password = "terraform"
    # private_key = "${file("keys/terraform_id_rsa")}"
    host = "node0${count.index + 1}.${var.dns_suffixes}"
  }
  provisioner "remote-exec" {
    script = "scripts/bootstrap-node.sh"
  }
}