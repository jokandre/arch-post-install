name='Install Packages'
description='Installs new packages, selected by you from a list.'

execute() {
#  msg "Install Yaourt..."
#  sudo pacman -S --noconfirm $(uninst-pkgs \
#    yaourt fakeroot make automake autoconf wget curl git subversion)

  msg "Install Packages..."
  sudo pacman -S --noconfirm $(uninst-pkgs $(cat "packages/pkgs.list"))

}
