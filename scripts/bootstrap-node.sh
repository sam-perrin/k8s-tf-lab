#!/bin/bash
# Disable swap
sudo swapoff --all
sudo sed -ri '/\sswap\s/s/^#?/#/' /etc/fstab

# Add Kubernetes repo
sudo apt update && sudo apt install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

# Update repo's and install Kubernetes packages
sudo apt update
sudo apt install -y kubelet kubeadm docker.io
sudo apt-mark hold kubelet kubeadm docker.io