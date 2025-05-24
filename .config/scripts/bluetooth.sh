state=$(bluetoothctl show | rg 'PowerState: (\w+)' -or '$1')

if [ "$1" = "state" ]; then
  [[ "$state" = "on" ]] && echo true || echo false
else
  [[ "$state" = "on" ]] && mode="off" || mode="on"
  bluetoothctl power "$mode"
fi
