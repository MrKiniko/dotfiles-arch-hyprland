#!/bin/bash

# .        :  :::::::..    :::  .   ::::::.    :::.::: :::  .      ...     
# ;;,.    ;;; ;;;;``;;;;   ;;; .;;,.;;;`;;;;,  `;;;;;; ;;; .;;,..;;;;;;;.  
# [[[[, ,[[[[, [[[,/[[['   [[[[[/'  [[[  [[[[[. '[[[[[ [[[[[/' ,[[     \[[,
# $$$$$$$$"$$$ $$$$$$c    _$$$$,    $$$  $$$ "Y$c$$$$$_$$$$,   $$$,     $$$
# 888 Y88" 888o888b "88bo,"888"88o, 888  888    Y88888"888"88o,"888,_ _,88P
# MMM  M'  "MMMMMMM   "W"  MMM "MMP"MMM  MMM     YMMMM MMM "MMP" "YMMMMMP" 
# 

status=$(playerctl status 2>/dev/null)

case "$status" in
  "Playing")
    echo "⏸"
    ;;
  "Paused")
    echo "⏵"
    ;;
  "Stopped")
    echo "⏵"
    ;;
  *)
    echo "⏵"
    ;;
esac
