name='Setup XFCE Desktop'
description='Configures the XFCE desktop environment in a specific way (see README)'

execute() {
  msg "Remove Clipman..."
  pkill xfce4-clipman
  yaourt -R --noconfirm xfce4-clipman-plugin

  msg "Setup Window Manager..."
  xfconf-query -n -c xfwm4 -p /general/mousewheel_rollup -t bool -s false
  xfconf-query -n -c xfwm4 -p /general/workspace_count   -t int  -s 4
  xfconf-query -n -c xfwm4 -p /general/workspace_names   -a \
    -t string -s W1 -t string -s W2 -t string -s W3 -t string -s W4

  msg "Setup Panel..."
  xfconf-query -n -c xfce4-panel -p /panels -a -t int -s 0
  xfconf-query -n -c xfce4-panel -p /panels/panel-0/autohide         -t int    -s 0
  xfconf-query -n -c xfce4-panel -p /panels/panel-0/background-style -t int    -s 1
  xfconf-query -n -c xfce4-panel -p /panels/panel-0/length           -t int    -s 100
  xfconf-query -n -c xfce4-panel -p /panels/panel-0/length-adjust    -t bool   -s true
  xfconf-query -n -c xfce4-panel -p /panels/panel-0/mode             -t int    -s 0
  xfconf-query -n -c xfce4-panel -p /panels/panel-0/position         -t string -s "p=8;x=0;y=0"
  xfconf-query -n -c xfce4-panel -p /panels/panel-0/position-locked  -t bool   -s true
  xfconf-query -n -c xfce4-panel -p /panels/panel-0/size             -t int    -s 28
  xfconf-query -n -c xfce4-panel -p /panels/panel-0/plugin-ids -a \
    -t int -s 1 -t int -s 2 -t int -s 3 -t int -s 4 -t int -s 5 \
    -t int -s 6 -t int -s 7 -t int -s 8 -t int -s 9 -t int -s 10

  msg "Setup Plugins..."
  xfconf-query -n -c xfce4-panel -p /plugins/plugin-1  -t string -s whiskermenu
  xfconf-query -n -c xfce4-panel -p /plugins/plugin-2  -t string -s tasklist
  xfconf-query -n -c xfce4-panel -p /plugins/plugin-3  -t string -s separator
  xfconf-query -n -c xfce4-panel -p /plugins/plugin-4  -t string -s systemload
  xfconf-query -n -c xfce4-panel -p /plugins/plugin-5  -t string -s diskperf
  xfconf-query -n -c xfce4-panel -p /plugins/plugin-6  -t string -s netload
  xfconf-query -n -c xfce4-panel -p /plugins/plugin-7  -t string -s systray
  xfconf-query -n -c xfce4-panel -p /plugins/plugin-8  -t string -s pager
  xfconf-query -n -c xfce4-panel -p /plugins/plugin-9  -t string -s datetime
  xfconf-query -n -c xfce4-panel -p /plugins/plugin-10 -t string -s showdesktop

  msg "Configure Plugins..."
  xfconf-query -n -c xfce4-panel -p /plugins/plugin-2/flat-buttons     -t bool -s true
  xfconf-query -n -c xfce4-panel -p /plugins/plugin-2/grouping         -t int  -s 0
  xfconf-query -n -c xfce4-panel -p /plugins/plugin-2/middle-click     -t int  -s 1
  xfconf-query -n -c xfce4-panel -p /plugins/plugin-2/sort-order       -t int  -s 4
  xfconf-query -n -c xfce4-panel -p /plugins/plugin-2/window-scrolling -t bool -s false

  xfconf-query -n -c xfce4-panel -p /plugins/plugin-3/expand           -t bool -s true
  xfconf-query -n -c xfce4-panel -p /plugins/plugin-3/style            -t int -s 1

  xfconf-query -n -c xfce4-panel -p /plugins/plugin-8/miniature-view   -t bool -s true
  xfconf-query -n -c xfce4-panel -p /plugins/plugin-8/rows             -t int  -s 2

  for file in xfce-panel/*; do
    cp -fv "$file" "$HOME/.config/xfce4/panel"
  done

  xfce4-panel --restart
}