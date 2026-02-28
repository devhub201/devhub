#!/bin/bash
set -e

# Root check
if [[ $EUID -ne 0 ]]; then
  echo "Run as root."
  exit 1
fi

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"

source $BASE_DIR/core/ui.sh
source $BASE_DIR/modules/vps.sh
source $BASE_DIR/modules/panel.sh
source $BASE_DIR/modules/wings.sh
source $BASE_DIR/modules/tools.sh
source $BASE_DIR/modules/themes.sh

while true; do
  show_menu
done
