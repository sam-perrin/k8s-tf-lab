variable "vsphere_user" { }
variable "vsphere_pass" { }
variable "vcenter" { }
variable "dns_servers" { }
variable "vlan10_gw" { }
variable "dns_suffixes" { }
variable "node_count" {default = 3}
variable "master_count" {default = 1}
variable "etcd_count" {default = 1}
variable "datacenter" { }
variable "pool" { }
variable "template" { }
variable "network" { }
variable "datastore" { }