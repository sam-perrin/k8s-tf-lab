variable "vsphere_user" { default = "administrator@vsphere.local" }
variable "vsphere_pass" { }
variable "vcenter" { }
variable "dns_servers" { default = "192.168.118.100"}
variable "vlan10_gw" {default = "192.168.118.2" }
variable "dns_suffixes" { }
variable "node_count" {default = 3}
variable "master_count" {default = 1}
variable "etcd_count" {default = 1}
variable "datacenter" {default = "PROD"}
variable "pool" {  default = "Resources"}
variable "template" { default = "ubuntu1604-template"}
variable "network" { default = "VM Network"}
variable "datastore" { default = "Datastore"}