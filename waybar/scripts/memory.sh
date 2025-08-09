#!/bin/bash
STATE_FILE="$HOME/.config/waybar/sensors_state"

if [ ! -f "$STATE_FILE" ]; then
  echo "1" > "$STATE_FILE"
fi

if [ "$(cat "$STATE_FILE")" -eq 1 ]; then
  # Obtener memoria usada en porcentaje
  mem_used=$(free | awk '/Mem:/ { printf("%.0f", $3/$2 * 100) }')
  echo "${mem_used}% "
else
  echo ""
fi
