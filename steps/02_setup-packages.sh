name='Setup Packages'
description='Performs initial configuration for some packages for the previous step'

execute() {
  msg "Configure Dropbox..."
  dropbox autostart y
#  ln -sv "$HOME/dropbox" "$HOME/Dropbox"

#  msg "Configure Sublime Text 3..."
#  mkdir -pv "$HOME/.config/sublime-text-3/Installed Packages"
#  mkdir -pv "$HOME/.config/sublime-text-3/Packages/User"

#  curl -L "https://sublime.wbond.net/Package%20Control.sublime-package" \
#    -o "$HOME/.config/sublime-text-3/Installed Packages/Package Control.sublime-package"

#  cp "sublime-text-3/Package Control.sublime-settings" "$HOME/.config/sublime-text-3/Packages/User"
#  cp "sublime-text-3/Preferences.sublime-settings" "$HOME/.config/sublime-text-3/Packages/User"

  #msg "Add Dhg Theme to theme directory..."
  #sudo cp -v "zsh/dhg.zsh-theme" "/usr/share/oh-my-zsh/themes/"

  msg "Copy .zshrc to home..."
  sudo cp -v "zsh/default/.zshrc" "$HOME"

  msg "Copy .tmux.conf to home..."
  sudo cp -v "tmux/.tmux.conf" "$HOME"

  msg "Change shell to zsh..."
  sudo chsh "$USER" -s "$(which zsh)"

}
