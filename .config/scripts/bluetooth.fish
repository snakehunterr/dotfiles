if test $USER_BLUETOOTH_STATE -eq 1
    set USER_BLUETOOTH_STATE 0
    bluetoothctl power off
else
    set USER_BLUETOOTH_STATE 1
    bluetoothctl power on
end
