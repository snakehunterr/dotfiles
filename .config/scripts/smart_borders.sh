#!/bin/sh

handle() {
  case $1 in
    openwindow* | closewindow* | workspace*)
      windows=$(hyprctl activeworkspace -j | jq ".windows")

      if [[ $windows -eq 1 ]]
      then
        hyprctl keyword general:border_size 0 &>/dev/null
      else
        hyprctl keyword general:border_size 1 &>/dev/null
      fi
    ;;
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
