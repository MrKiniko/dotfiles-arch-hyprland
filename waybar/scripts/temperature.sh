#!/bin/bash

# .        :  :::::::..    :::  .   ::::::.    :::.::: :::  .      ...     
# ;;,.    ;;; ;;;;``;;;;   ;;; .;;,.;;;`;;;;,  `;;;;;; ;;; .;;,..;;;;;;;.  
# [[[[, ,[[[[, [[[,/[[['   [[[[[/'  [[[  [[[[[. '[[[[[ [[[[[/' ,[[     \[[,
# $$$$$$$$"$$$ $$$$$$c    _$$$$,    $$$  $$$ "Y$c$$$$$_$$$$,   $$$,     $$$
# 888 Y88" 888o888b "88bo,"888"88o, 888  888    Y88888"888"88o,"888,_ _,88P
# MMM  M'  "MMMMMMM   "W"  MMM "MMP"MMM  MMM     YMMMM MMM "MMP" "YMMMMMP" 
# 

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
