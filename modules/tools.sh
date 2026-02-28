#!/bin/bash

tools_menu() {
  clear
  echo "1) Cloudflare"
  echo "2) Tailscale"
  read -p "Select Tool: " t

  case $t in
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
