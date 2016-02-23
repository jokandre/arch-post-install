name='Configure Boot'
description='Configures the bootloader (GRUB2) to match a specific setup (see README)'

execute() {
  msg "Edit GRUB config..."
  sudo sed -E \
    -e 's/^#?GRUB_CMDLINE_LINUX_DEFAULT=(.*[^ ]) ?quiet/GRUB_CMDLINE_LINUX_DEFAULT=\1/' \
    -e 's/^#?GRUB_TIMEOUT=[0-9]+/GRUB_TIMEOUT=0/' \
    -e 's/^#?GRUB_HIDDEN_TIMEOUT=[0-9]+/GRUB_HIDDEN_TIMEOUT=3/' \
    -e 's/^#?GRUB_COLOR_NORMAL=.*$/GRUB_COLOR_NORMAL="light-gray\/black"/' \
    -e 's/^#?GRUB_COLOR_HIGHLIGHT=.*$/GRUB_COLOR_HIGHLIGHT="white\/black"/' \
    -e 's/^#?GRUB_INIT_TUNE=.*$/GRUB_INIT_TUNE="480 440 1"/' \
    -i.bak /etc/default/grub

  msg "Update GRUB..."
  sudo update-grub
}