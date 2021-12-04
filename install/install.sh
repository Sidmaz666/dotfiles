#!/bin/bash

ins_pkgs(){
  pkgs="$(cat ./dotfiles/sys_file_laptop/olpkgs.txt | awk '{print $1}')" 
  paru -S $pkgs
  echo "All Essential Packages Installed"
}

wallpapers(){
  mkdir -p $HOME/Pictures/awall
  cp -r ./dotfiles/awall $HOME/Pictures/awall
  echo "Wallpapers are added to $HOME/Pictures/awall"
}

vim_install(){
  vpkgs="$(cat ./dotfiles/shell/viminstall.txt | awk '{print $1}' )"
  paru -S $vpkgs
  echo "Essential Vim packages are Installed"
}

mov_dotfiles(){
  read -p "Continue?[Will overwrite existing files] y/n" ans
  if [[ "$ans" == "y" ]]; then 
  sudo cp -r ./dotfiles/sys_file_laptop/dunstrc /etc/dunst/dunstrc  
  sudo cp -r ./dotfiles/sys_file_laptop/suspend@.service /etc/systemd/system/betterlockscreen.service
  sudo cp -r ./dotfiles/extra/betterlockscreen_fork /usr/bin/betterlockscreen
  sudo cp -r ./dotfiles/extra/clean /usr/bin/clean
  sudo cp -r ./dotfiles/extra/rgcc /usr/bin/rgcc
  cp -r ./dotfiles/picom $HOME/.config
  cp -r ./dotfiles/qtile $HOME/.config 
  cp -r ./dotfiles/vifm $HOME/.config
  cp -r ./dotfiles/extra/neofetch.conf $HOME/.config/neofetch
  cp -r ./dotfiles/shell/.vimrc $HOME
  cp -r ./dotfiles/shell/.zshrc $HOME
  cp -r ./dotfiles/shell/.p10k.zsh $HOME
  mkdir -p $HOME/Documents/scripts 
  cp -r ./dotfiles/extra/toggleBar.sh $HOME/Documents/scripts
  cp -r ./dotfiles/extra/rofi-calc.sh $HOME/Documents/scripts
  mkdir -p $HOME/Documents/scripts/extra
  cp -r ./dotfiles/extra/record.sh $HOME/Documents/scripts/extra
  cp -r ./dotfiles/extra/Dic-TXT $HOME/Documents/scripts/extra
  cp -r ./dotfiles/extra/ytfzf $HOME/.config
  mkdir -p $HOME/Documents/scripts/battery-notifications
  cp -r ./dotfiles/extra/battery_notification_script $HOME/Documents/scripts/battery-notifications/batterynotif.sh
  echo "All dotfiles are allocated Perfectly!!" 
  else
    echo "Dotfiles are not Allocated perfectly!"
  fi
}

sys_enable(){
  sudo systemctl enable lightdm
  echo "Enabled Lightdm!"
}

main_func(){
  ins_pkgs 
  vim_install 
  wallpapers 
  mov_dotfiles 
  sys_enable
  exit
}

sudo pacman -S git paru-bin && \
  git clone https://www.github.com/Sidmaz666/dotfiles && \
  main_func
