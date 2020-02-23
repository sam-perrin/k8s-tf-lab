#!/bin/bash
sudo swapoff --all
sudo sed -ri '/\sswap\s/s/^#?/#/' /etc/fstab