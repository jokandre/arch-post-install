# Common issues on Lenovo Legion 5 2021 edition

# Use kernel 5.18+ to fix wifi
```sh
inxi -Nazy 

sudo pacman -S linux518-headers
```

# Fix wifi

 Go to https://github.com/lwfinger/rtw89

# Fix Bluetooth

 Go to https://github.com/lwfinger/rtw89-BT

-  Disabled after suspense issue:

Set ```AutoEnable=true``` in /etc/bluetooth/main.conf