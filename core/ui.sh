#!/bin/bash

RED="\e[1;31m"
GREEN="\e[1;32m"
CYAN="\e[1;36m"
RESET="\e[0m"

show_menu() {
  clear
  echo -e "${CYAN}"
  echo "██████╗ ███████╗██╗   ██╗"
  echo "Dev Hub Installer"
  echo -e "${RESET}"

  echo "1) Create VPS"
  echo "2) Install Pterodactyl Panel"
  echo "3) Install Wings"
  echo "4) Themes"
  echo "5) Tools"
  echo "6) Exit"
  echo ""

  read -p "Select Option: " opt

  case $opt in
    1) create_vps ;;
    2) install_panel ;;
    3) install_wings ;;
    4) themes_menu ;;
    5) tools_menu ;;
    6) exit 0 ;;
    *) echo "Invalid"; sleep 1 ;;
  esac
}
