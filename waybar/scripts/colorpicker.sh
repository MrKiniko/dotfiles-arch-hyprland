#!/bin/bash

# .        :  :::::::..    :::  .   ::::::.    :::.::: :::  .      ...     
# ;;,.    ;;; ;;;;``;;;;   ;;; .;;,.;;;`;;;;,  `;;;;;; ;;; .;;,..;;;;;;;.  
# [[[[, ,[[[[, [[[,/[[['   [[[[[/'  [[[  [[[[[. '[[[[[ [[[[[/' ,[[     \[[,
# $$$$$$$$"$$$ $$$$$$c    _$$$$,    $$$  $$$ "Y$c$$$$$_$$$$,   $$$,     $$$
# 888 Y88" 888o888b "88bo,"888"88o, 888  888    Y88888"888"88o,"888,_ _,88P
# MMM  M'  "MMMMMMM   "W"  MMM "MMP"MMM  MMM     YMMMM MMM "MMP" "YMMMMMP" 
# 

# Ejecuta hyprpicker, captura toda la salida
OUTPUT=$(hyprpicker)

# Extrae solo el código HTML tipo #RRGGBB con grep
COLOR=$(echo "$OUTPUT" | grep -oE '#[0-9a-fA-F]{6}')

# Si no encuentra color, avisa y sale
if [ -z "$COLOR" ]; then
  notify-send "Color Picker" "No se seleccionó un color válido"
  exit 1
fi

# Copia solo el código HTML al portapapeles
echo -n "$COLOR" | wl-copy

# Notifica que se copió correctamente
notify-send "Color Picker" "Color $COLOR copiado al portapapeles"

# Salida para Waybar (icono fijo)
echo "{\"text\": \"🎨\"}"
