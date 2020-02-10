# k8s-tf-lab
Set of basic terraform manifests that will provision a defined set of nodes ready to create a Kubernetes cluster. Does not bootstrap cluster itself.
## Files to add
### terraform.tfvars
Need to add environment specific variables in here
### ssh keyfile
The scripts are run by creating a terraform user on the template. This user can login using SSH keys & doesn't need a password to sudo.
## Network
Will need to change the subnet in the etcd, master & node files