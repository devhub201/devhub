#!/bin/bash
set -e

# ===== COLORS =====
RED="\e[1;31m"
GREEN="\e[1;32m"
YELLOW="\e[1;33m"
BLUE="\e[1;34m"
MAGENTA="\e[1;35m"
CYAN="\e[1;36m"
RESET="\e[0m"

# ===== ROOT CHECK =====
if [[ $EUID -ne 0 ]]; then
  echo -e "${RED}Run as root.${RESET}"
  exit 1
fi

# ===== ANIMATION =====
type_effect() {
  text="$1"
  delay=0.02
  for (( i=0; i<${#text}; i++ )); do
    echo -ne "${text:$i:1}"
    sleep $delay
  done
  echo ""
}

loading_bar() {
  echo -ne "${CYAN}Loading: ${RESET}"
  for i in {1..30}; do
    echo -ne "${GREEN}█${RESET}"
    sleep 0.03
  done
  echo ""
}

# ===== HEADER =====
header() {
  clear
  echo -e "${MAGENTA}"
  echo "██████╗ ███████╗██╗   ██╗"
  echo "██╔══██╗██╔════╝██║   ██║"
  echo "██║  ██║█████╗  ██║   ██║"
  echo "██║  ██║██╔══╝  ╚██╗ ██╔╝"
  echo "██████╔╝███████╗ ╚████╔╝ "
  echo "╚═════╝ ╚══════╝  ╚═══╝  "
  echo -e "${RESET}"
  echo -e "${CYAN}        Dev Hub Hosting Panel${RESET}"
  echo ""
}

# ===== VPS =====
create_vps() {
  clear
  echo -e "${YELLOW}Setting up VPS Environment...${RESET}"
  apt update -y
  apt install -y qemu-kvm libvirt-daemon-system virtinst bridge-utils
  echo -e "${GREEN}VPS Setup Complete!${RESET}"
  read -p "Press Enter..."
}

# ===== PANEL =====
install_panel() {
  clear
  echo -e "${YELLOW}Installing Pterodactyl Panel...${RESET}"
  curl -s https://pterodactyl-installer.se | bash
  read -p "Press Enter..."
}

# ===== WINGS =====
install_wings() {
  clear
  echo -e "${YELLOW}Installing Wings...${RESET}"
  curl -s https://pterodactyl-installer.se | bash
  read -p "Press Enter..."
}

# ===== THEMES =====
themes_menu() {
  clear
  echo -e "${BLUE}1) Nebula${RESET}"
  echo -e "${BLUE}2) Unix${RESET}"
  echo -e "${BLUE}3) Mods${RESET}"
  read -p "Select Theme: " theme
  echo -e "${GREEN}Theme option selected.${RESET}"
  read -p "Press Enter..."
}

# ===== TOOLS =====
tools_menu() {
  clear
  echo -e "${CYAN}1) Cloudflare Tunnel${RESET}"
  echo -e "${CYAN}2) Tailscale${RESET}"
  read -p "Select Tool: " tool

  case $tool in
    1)
      curl -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -o cloudflared
      chmod +x cloudflared
      mv cloudflared /usr/local/bin/
      ;;
    2)
      curl -fsSL https://tailscale.com/install.sh | sh
      ;;
  esac

  read -p "Press Enter..."
}

# ===== START ANIMATION =====
clear
type_effect "$(echo -e ${MAGENTA}Starting Dev Hub Installer...${RESET})"
loading_bar
sleep 1

# ===== MAIN LOOP =====
while true; do
  header
  echo -e "${GREEN}1) Create VPS${RESET}"
  echo -e "${GREEN}2) Install Pterodactyl Panel${RESET}"
  echo -e "${GREEN}3) Install Wings${RESET}"
  echo -e "${GREEN}4) Themes${RESET}"
  echo -e "${GREEN}5) Tools${RESET}"
  echo -e "${RED}6) Exit${RESET}"
  echo ""
  read -p "Select Option: " choice

  case $choice in
    1) create_vps ;;
    2) install_panel ;;
    3) install_wings ;;
    4) themes_menu ;;
    5) tools_menu ;;
    6) exit 0 ;;
    *) echo "Invalid option"; sleep 1 ;;
  esac
done
