
# .        :  :::::::..    :::  .   ::::::.    :::.::: :::  .      ...     
# ;;,.    ;;; ;;;;``;;;;   ;;; .;;,.;;;`;;;;,  `;;;;;; ;;; .;;,..;;;;;;;.  
# [[[[, ,[[[[, [[[,/[[['   [[[[[/'  [[[  [[[[[. '[[[[[ [[[[[/' ,[[     \[[,
# $$$$$$$$"$$$ $$$$$$c    _$$$$,    $$$  $$$ "Y$c$$$$$_$$$$,   $$$,     $$$
# 888 Y88" 888o888b "88bo,"888"88o, 888  888    Y88888"888"88o,"888,_ _,88P
# MMM  M'  "MMMMMMM   "W"  MMM "MMP"MMM  MMM     YMMMM MMM "MMP" "YMMMMMP" 
# 

# ~/.config/waybar/scripts/sensors-toggle.sh
STATE_FILE="$HOME/.config/waybar/sensors_state"

if [ ! -f "$STATE_FILE" ]; then
  echo "1" > "$STATE_FILE"  # activado por defecto
fi

STATE=$(cat "$STATE_FILE")

if [ "$STATE" -eq 1 ]; then
  echo "0" > "$STATE_FILE"
else
  echo "1" > "$STATE_FILE"
fi
