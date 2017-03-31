## Open
```
gedit ~/.config/terminator/config
```
Paste
```
[global_config]
  always_on_top = True
  borderless = True
  enabled_plugins = LaunchpadCodeURLHandler, APTURLHandler, LaunchpadBugURLHandler
  sticky = True
  tab_position = bottom
[keybindings]
  hide_window = F12
[layouts]
  [[default]]
    [[[child0]]]
      order = 0
      parent = ""
      position = 0:24
      size = 1920, 450
      type = Window
    [[[child1]]]
      order = 0
      parent = child0
      position = 960
      type = HPaned
    [[[terminal2]]]
      order = 0
      parent = child1
      profile = default
      type = Terminal
    [[[terminal3]]]
      order = 1
      parent = child1
      profile = default
      type = Terminal
  [[original]]
    [[[child1]]]
      parent = window0
      profile = default
      type = Terminal
    [[[window0]]]
      order = 0
      parent = ""
      type = Window
[plugins]
[profiles]
  [[default]]
    background_darkness = 0.75
    background_type = transparent
    cursor_color = "#ffffff"
    foreground_color = "#ffffff"
    show_titlebar = False
    
```
