#!/bin/bash
STATE_FILE="$HOME/.config/waybar/sensors_state"

if [ ! -f "$STATE_FILE" ]; then
  echo "1" > "$STATE_FILE"
fi

if [ "$(cat "$STATE_FILE")" -eq 1 ]; then
  # aquí pones el código real que muestra el cpu, o el comando playerctl etc.
  echo "󰻠$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print int(usage) "%"}') "
else
  echo ""  # vacío para ocultar
fi
