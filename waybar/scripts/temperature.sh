#!/bin/bash
STATE_FILE="$HOME/.config/waybar/sensors_state"

if [ ! -f "$STATE_FILE" ]; then
  echo "1" > "$STATE_FILE"
fi

if [ "$(cat "$STATE_FILE")" -eq 1 ]; then
  # Leer temperatura de CPU desde sysfs (ajusta hwmon-path si es necesario)
  temp_file="/sys/class/thermal/thermal_zone0/temp"
  if [[ -f "$temp_file" ]]; then
    temp_c=$(awk '{printf "%.0f", $1/1000}' "$temp_file")
    echo "${temp_c}°C "
  else
    echo " N/A"
  fi
else
  echo ""
fi
