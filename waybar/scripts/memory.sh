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
  # Obtener memoria usada en porcentaje
  mem_used=$(free | awk '/Mem:/ { printf("%.0f", $3/$2 * 100) }')
  echo "${mem_used}% "
else
  echo ""
fi
