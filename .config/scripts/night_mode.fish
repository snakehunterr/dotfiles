if test $USER_NIGHT_MODE_STATE -eq 1
    set USER_NIGHT_MODE_STATE 0
    hyprctl hyprsunset temperature 6000
else
    set USER_NIGHT_MODE_STATE 1
    hyprctl hyprsunset temperature 3000
end
