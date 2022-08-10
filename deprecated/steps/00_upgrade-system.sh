name='Upgrade System'
description='Performs a full system upgrade.'

execute() {
  msg "Update Pacman Mirrorlist..."
  sudo pacman-mirrors -g

  msg "Update the System..."
  sudo pacman -Syyu --noconfirm
  sudo pacman -Syu --noconfirm
}
