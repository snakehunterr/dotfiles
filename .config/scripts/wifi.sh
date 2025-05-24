state=$(nmcli radio wifi)

if [ "$1" = "state" ]; then
  [[ $state = "enabled" ]] && echo "true" || echo "false"
else
  [[ $state = "enabled" ]] && mode="off" || mode="on"
  nmcli radio wifi "${mode}"
fi
