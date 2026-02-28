#!/bin/bash

create_vps() {
  clear
  echo "Installing Virtualization Packages..."

  apt update -y
  apt install -y qemu-kvm libvirt-daemon-system virtinst bridge-utils

  echo "VPS Setup Complete."
  read -p "Press Enter..."
}
