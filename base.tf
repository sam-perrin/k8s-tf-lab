provider "vsphere" {
    user    =   "${var.vsphere_user}"
    password    =   "${var.vsphere_pass}"
    vsphere_server  =   "${var.vcenter}"

    allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "${var.datacenter}"
}

data "vsphere_datastore" "datastore" {
  name          = "${var.datastore}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "pool" {
  name          = "${var.pool}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "${var.network}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_virtual_machine" "template" {
    name    = "${var.template}"
    datacenter_id = "${data.vsphere_datacenter.dc.id}"
}