#!/bin/bash

cp -r /home/kino/Documentos/colores\ dotfiles/red/* /home/kino/dev/config/dotfiles

pkill -SIGUSR2 waybar

pkill swaync
swaync &

pkill -USR1 hyprpaper
hyprpaper &