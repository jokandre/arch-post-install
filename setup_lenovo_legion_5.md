# Common issues on Lenovo Legion 5 2021 edition
```
                               OS: Manjaro Linux x86_64 
██████████████████  ████████   Host: 82JW Legion 5 15ACH6 
████████            ████████   Kernel: 5.18.12-3-MANJARO 
████████  ████████  ████████   Uptime: 19 days, 12 hours, 16 mins 
████████  ████████  ████████   Packages: 1424 (pacman), 7 (flatpak) 
████████  ████████  ████████   Shell: zsh 5.9 
████████  ████████  ████████   Resolution: 1920x1080 
████████  ████████  ████████   DE: GNOME 42.3.1 
████████  ████████  ████████   WM: Mutter 
████████  ████████  ████████   WM Theme: Adwaita 
████████  ████████  ████████   Theme: Adw-dark [GTK2/3] 
████████  ████████  ████████   Icons: Papirus-Dark [GTK2/3] 
                               Terminal: gnome-terminal 
                               CPU: AMD Ryzen 7 5800H with Radeon Graphics (16) 
                               GPU: NVIDIA GeForce RTX 3050 Mobile 
                               Memory: 9877MiB / 15851MiB 
```
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