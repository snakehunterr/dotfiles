temp=$(hyprctl hyprsunset temperature)

if [ "$1" = "state" ]; then
  [[ ${temp} -eq 6000 ]] && echo "false" || echo "true"
else
  [[ ${temp} -eq 6000 ]] && mode=2500 || mode=6000
  hyprctl hyprsunset temperature "${mode}"
fi
