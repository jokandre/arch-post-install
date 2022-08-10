name='Setup User Directories'
description='Configures the main user directory in a specific way (see README file)'

execute() {
  msg "Setup Data Directory..."
  if [ ! -e /data ]; then
    sudo mkdir -v /data
  fi
  if [ ! -e "/data/$USER" ]; then
    sudo mkdir -v "/data/$USER"
  fi

  sudo chown -R "$USER" "/data/$USER"
  if [ ! -e "$HOME/data" ]; then
    ln -sv "/data/$USER" "$HOME/data"
  fi

  for dir in coding desktop documents downloads dropbox images music public templates university videos work
  do
    if [ ! -e "$HOME/data/$dir" ]; then
      mkdir -v "$HOME/data/$dir"
    fi

    if [ -e "$HOME/$dir" ]; then
      mv -v "$HOME/$dir/*" "$HOME/data/$dir"
    fi

    ln -sfv "data/$dir" "$HOME/$dir"
  done


  ln -s "/data" "$HOME/data"

  msg "Setup Default XDG Dirs..."
  xdg-user-dirs-update --set DESKTOP "$HOME/desktop"
  xdg-user-dirs-update --set DOWNLOAD "$HOME/downloads"
  xdg-user-dirs-update --set TEMPLATES "$HOME/templates"
  xdg-user-dirs-update --set PUBLICSHARE "$HOME/public"
  xdg-user-dirs-update --set DOCUMENTS "$HOME/documents"
  xdg-user-dirs-update --set MUSIC "$HOME/music"
  xdg-user-dirs-update --set PICTURES "$HOME/images"
  xdg-user-dirs-update --set VIDEOS "$HOME/videos"

  msg "Setup Custom XDG Dirs..."
  xdg-user-dirs-update --set DATA "$HOME/data"
  xdg-user-dirs-update --set DROPBOX "$HOME/dropbox"
  xdg-user-dirs-update --set UNIVERSITY "$HOME/university"
  xdg-user-dirs-update --set CODING "$HOME/coding"
  xdg-user-dirs-update --set WORK "$HOME/work"
}