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
