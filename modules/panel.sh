#!/bin/bash

install_panel() {
  clear
  echo "Downloading Pterodactyl Installer..."

  curl -O https://pterodactyl-installer.se
  chmod +x pterodactyl-installer.se

  echo "Launching Installer..."
  bash pterodactyl-installer.se

  read -p "Press Enter..."
}
