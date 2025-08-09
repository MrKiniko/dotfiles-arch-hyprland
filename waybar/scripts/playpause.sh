#!/bin/bash

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
