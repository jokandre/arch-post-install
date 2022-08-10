name='Reboot'
description='Reboots the system (recommended)'

execute() {
  msg "Reboot..."
  systemctl reboot
}