#!/bin/bash

# Función para escapar caracteres especiales para Pango markup
escape_markup() {
  local input="$1"
  echo "$input" | sed \
    -e 's/&/\&amp;/g' \
    -e 's/</\&lt;/g' \
    -e 's/>/\&gt;/g' \
    -e 's/"/\&quot;/g' \
    -e "s/'/\&apos;/g"
}

# Función para cortar texto y añadir "..." respetando UTF-8
truncate_text() {
  local input="$1"
  local max_len="$2"
  if [ "$(echo -n "$input" | wc -m)" -gt "$max_len" ]; then
    echo "$(echo -n "$input" | cut -c1-"$max_len")..."
  else
    echo "$input"
  fi
}

# Obtener título y artista
title=$(playerctl metadata title 2>/dev/null)
artist=$(playerctl metadata artist 2>/dev/null)

# Escapar caracteres especiales
title=$(escape_markup "$title")
artist=$(escape_markup "$artist")

# Limitar longitud
title=$(truncate_text "$title" 25)
artist=$(truncate_text "$artist" 30)

# Obtener duración y posición en segundos
duration=$(playerctl metadata mpris:length 2>/dev/null)
position=$(playerctl position 2>/dev/null)

# Convertir nanosegundos a segundos
if [[ "$duration" -gt 100000 ]]; then
  duration=$((duration / 1000000))  # a milisegundos
  duration=$((duration / 1000))     # a segundos
fi

# Redondear posición
position=${position%.*}

# Función para formatear segundos a mm:ss
format_time() {
  local T=$1
  printf "%02d:%02d" $((T / 60)) $((T % 60))
}

pos_str=$(format_time "$position")

# Mostrar salida
if [ -n "$title" ]; then
  echo "$artist - $title | $pos_str"
else
  echo ""
fi
