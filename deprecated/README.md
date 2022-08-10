# Arch-post-install
===========================

This project provides a set of shell scripts to be run after a fresh install of an Arch(-based) OS. It will install your favourite applications, set your preferred settings, etc.
Feel free to copy, improve and distribute.

You can get the latest version from the original git repository:

    git clone https://github.com/jokandre/arch-post-install.git


##Usage:

Run from source folder:

    ./main.sh

Or if you like, add the script's location to your custom shell paths to run on-demand.

	export PATH=${PATH}:$HOME/whereever/arch-post-install/

Note: The included [preferences](functions/configure) and [lists of packages](data) are those of the original author, you will have to change them to suit yourself.



What it does
------------


Right now this is a largely unfinished monolithic script. What currently takes place when you run it is:

+ The system is upgraded
  - Generates a new pacman mirrorlist. (`pacman-mirrors -g`)
  - Triggers a full pacman upgrade. (`pacman -Syyu`)
  - Triggers another pacman upgrade, because Manjaro usually updates
    `manjaro-system`, which stops any other pacman operations. (`pacman -Syu`)
+ A number of packages are installed
  - `yaourt` and utilities for it are installed. These are largely unnecessary
    unless on a Manjaro preview. They're installed just in case, as yaourt will
    take over from now on.
  - All packages I usually install by hand are installed. See the source code
    for the list of packages.
+ Packages are configured
  - Dropbox is set to autostart at boot.
  - Sublime Text is added Package Control and my packages and configuration are
    copied over. (see `sublime-text-3` source dir)
+ The home directory is set up
  - A symlink from $HOME/data to /data/$USER is created.
  - All XDG user dirs are linked to $HOME/data directories, and their names
    changed to all-lowercase always-english names.
  - A few custom XDG dirs are added.
+ XFCE is configured
  - The `mousewheel_rollup` feature is disabled.
  - The panel config is completely rewritten with a mix of `xfconf-query`s and
    configuration file copying.
  - The panel is restarted to reflect the new configuration.
+ The boot settings are updated
  - GRUB is set up to not show the menu, with hidden timeout set to 3, beep on
    start and the `quiet` kernel option is removed.
  - GRUB is updated. (`update-grub`)
+ The system reboots

After the reboot, there are a few things that will happen naturally:

+ Dropbox will prompt you to configure an account.
+ The first time you open Sublime Text 3, all packages will start downloading.
  This includes the already configured theme, so ST3 might look awfully bad
  until it is fully downloaded.
