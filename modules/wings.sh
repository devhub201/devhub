#!/bin/bash

install_wings() {
  clear
  echo "Downloading Wings Installer..."

  curl -O https://pterodactyl-installer.se
  chmod +x pterodactyl-installer.se

  bash pterodactyl-installer.se

  read -p "Press Enter..."
}
