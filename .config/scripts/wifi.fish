if test $USER_WIFI_STATE -eq 1
    set USER_WIFI_STATE 0
    nmcli radio wifi off
else
    set USER_WIFI_STATE 1
    nmcli radio wifi on
end
