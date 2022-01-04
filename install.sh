#!/bin/bash

BASH_COLOR_RED='\033[0;31m'
BASH_COLOR_NC='\033[0m' # No Color
BASH_COLOR_Black='\033[0;30m'     
BASH_COLOR_DarkGray='\033[1;30m'
BASH_COLOR_Red='\033[0;31m'     
BASH_COLOR_LightRed='\033[1;31m'
BASH_COLOR_Green='\033[0;32m'     
BASH_COLOR_LightGreen='\033[1;32m'
BASH_COLOR_BrownOrange='\033[0;33m'     
BASH_COLOR_Yellow='\033[1;33m'
BASH_COLOR_Blue='\033[0;34m'     
BASH_COLOR_LightBlue='\033[1;34m'
BASH_COLOR_Purple='\033[0;35m'     
BASH_COLOR_LightPurple='\033[1;35m'
BASH_COLOR_Cyan='\033[0;36m'     
BASH_COLOR_LightCyan='\033[1;36m'
BASH_COLOR_LightGray='\033[0;37m'     
BASH_COLOR_White='\033[1;37m'

IFS='' read -r -d '' welcome_msg <<"EOF"
  
   █     █░▓█████  ██▓     ▄████▄   ▒█████   ███▄ ▄███▓▓█████    ▄▄▄█████▓ ▒█████                                         
  ▓█░ █ ░█░▓█   ▀ ▓██▒    ▒██▀ ▀█  ▒██▒  ██▒▓██▒▀█▀ ██▒▓█   ▀    ▓  ██▒ ▓▒▒██▒  ██▒                                       
  ▒█░ █ ░█ ▒███   ▒██░    ▒▓█    ▄ ▒██░  ██▒▓██    ▓██░▒███      ▒ ▓██░ ▒░▒██░  ██▒                                       
  ░█░ █ ░█ ▒▓█  ▄ ▒██░    ▒▓▓▄ ▄██▒▒██   ██░▒██    ▒██ ▒▓█  ▄    ░ ▓██▓ ░ ▒██   ██░                                       
  ░░██▒██▓ ░▒████▒░██████▒▒ ▓███▀ ░░ ████▓▒░▒██▒   ░██▒░▒████▒     ▒██▒ ░ ░ ████▓▒░                                       
  ░ ▓░▒ ▒  ░░ ▒░ ░░ ▒░▓  ░░ ░▒ ▒  ░░ ▒░▒░▒░ ░ ▒░   ░  ░░░ ▒░ ░     ▒ ░░   ░ ▒░▒░▒░                                        
    ▒ ░ ░   ░ ░  ░░ ░ ▒  ░  ░  ▒     ░ ▒ ▒░ ░  ░      ░ ░ ░  ░       ░      ░ ▒ ▒░                                        
    ░   ░     ░     ░ ░   ░        ░ ░ ░ ▒  ░      ░      ░        ░      ░ ░ ░ ▒                                         
      ░       ░  ░    ░  ░░ ░          ░ ░         ░      ░  ░                ░ ░                                         
                          ░                                                                                               
                                  ██████  ██▓▓█████▄  ███▄ ▄███▓ ▄▄▄      ▒███████▒                                       
                                ▒██    ▒ ▓██▒▒██▀ ██▌▓██▒▀█▀ ██▒▒████▄    ▒ ▒ ▒ ▄▀░                                       
                                ░ ▓██▄   ▒██▒░██   █▌▓██    ▓██░▒██  ▀█▄  ░ ▒ ▄▀▒░                                        
                                  ▒   ██▒░██░░▓█▄   ▌▒██    ▒██ ░██▄▄▄▄██   ▄▀▒   ░                                       
                                ▒██████▒▒░██░░▒████▓ ▒██▒   ░██▒ ▓█   ▓██▒▒███████▒                                       
                                ▒ ▒▓▒ ▒ ░░▓   ▒▒▓  ▒ ░ ▒░   ░  ░ ▒▒   ▓▒█░░▒▒ ▓░▒░▒                                       
                                ░ ░▒  ░ ░ ▒ ░ ░ ▒  ▒ ░  ░      ░  ▒   ▒▒ ░░░▒ ▒ ░ ▒                                       
                                ░  ░  ░   ▒ ░ ░ ░  ░ ░      ░     ░   ▒   ░ ░ ░ ░ ░                                       
                                      ░   ░     ░           ░         ░  ░  ░ ░                                           
                                              ░                           ░                                               
   ▄▄▄       ██▀███   ▄████▄   ██░ ██     ██▓ ███▄    █   ██████ ▄▄▄█████▓ ▄▄▄       ██▓     ██▓    ▓█████  ██▀███   ▐██▌ 
  ▒████▄    ▓██ ▒ ██▒▒██▀ ▀█  ▓██░ ██▒   ▓██▒ ██ ▀█   █ ▒██    ▒ ▓  ██▒ ▓▒▒████▄    ▓██▒    ▓██▒    ▓█   ▀ ▓██ ▒ ██▒ ▐██▌ 
  ▒██  ▀█▄  ▓██ ░▄█ ▒▒▓█    ▄ ▒██▀▀██░   ▒██▒▓██  ▀█ ██▒░ ▓██▄   ▒ ▓██░ ▒░▒██  ▀█▄  ▒██░    ▒██░    ▒███   ▓██ ░▄█ ▒ ▐██▌ 
  ░██▄▄▄▄██ ▒██▀▀█▄  ▒▓▓▄ ▄██▒░▓█ ░██    ░██░▓██▒  ▐▌██▒  ▒   ██▒░ ▓██▓ ░ ░██▄▄▄▄██ ▒██░    ▒██░    ▒▓█  ▄ ▒██▀▀█▄   ▓██▒ 
   ▓█   ▓██▒░██▓ ▒██▒▒ ▓███▀ ░░▓█▒░██▓   ░██░▒██░   ▓██░▒██████▒▒  ▒██▒ ░  ▓█   ▓██▒░██████▒░██████▒░▒████▒░██▓ ▒██▒ ▒▄▄  
   ▒▒   ▓▒█░░ ▒▓ ░▒▓░░ ░▒ ▒  ░ ▒ ░░▒░▒   ░▓  ░ ▒░   ▒ ▒ ▒ ▒▓▒ ▒ ░  ▒ ░░    ▒▒   ▓▒█░░ ▒░▓  ░░ ▒░▓  ░░░ ▒░ ░░ ▒▓ ░▒▓░ ░▀▀▒ 
    ▒   ▒▒ ░  ░▒ ░ ▒░  ░  ▒    ▒ ░▒░ ░    ▒ ░░ ░░   ░ ▒░░ ░▒  ░ ░    ░      ▒   ▒▒ ░░ ░ ▒  ░░ ░ ▒  ░ ░ ░  ░  ░▒ ░ ▒░ ░  ░ 
    ░   ▒     ░░   ░ ░         ░  ░░ ░    ▒ ░   ░   ░ ░ ░  ░  ░    ░        ░   ▒     ░ ░     ░ ░      ░     ░░   ░     ░ 
        ░  ░   ░     ░ ░       ░  ░  ░    ░           ░       ░                 ░  ░    ░  ░    ░  ░   ░  ░   ░      ░    
                   ░                                                                                                    
EOF

#sectionOneStart

part_one(){
clear
echo -e "$BASH_COLOR_Cyan"
echo -e "$welcome_msg"
echo -e "$BASH_COLOR_LightGreen"
read -p "Continue?(y/n) " con
if [ $con != y ]; then 
  exit
fi
#sudo reflector --country India --sort rate --save /etc/pacman.d/mirrorlist > /dev/null 2>&1
sed -i "s/^#ParallelDownloads = 5$/ParallelDownloads = 15/" /etc/pacman.conf
sed -i "s/^#Color$/Color \n ILoveCandy/" /etc/pacman.conf
pacman --noconfirm -Sy archlinux-keyring
loadkeys us
timedatectl set-ntp true
echo -e "$BASH_COLOR_BrownOrange"
lsblk
echo -e "$BASH_COLOR_Yellow"
echo "Enter the drive: "
read drive
cfdisk $drive 
echo -e "$BASH_COLOR_LightCyan"
echo "Enter the linux partition: "
read partition
mkfs.ext4 $partition 
echo -e "$BASH_COLOR_LightGreen"
read -p "Did you also create efi partition? [y/n]" answer
if [[ $answer = y ]] ; then
  echo "Enter EFI partition: "
  read efipartition
  mkfs.vfat -F 32 $efipartition
fi
echo -e "$BASH_COLOR_Cyan"
mount $partition /mnt 
pacstrap /mnt base base-devel linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab
sed -e '/^#sectionOneStart/,/^#sectionOneComplete/d' install.sh > /mnt/install2.sh
chmod +x /mnt/install2.sh
arch-chroot /mnt ./install2.sh
exit 
}

part_one

#sectionOneComplete

#sectionTwoStart

part_two(){
echo -e "$BASH_COLOR_Cyan"
echo -e "$welcome_msg"
sed -i "s/^#ParallelDownloads = 5$/ParallelDownloads = 15/" /etc/pacman.conf
sed -i "s/^#Color$/Color \n ILoveCandy/" /etc/pacman.conf
pacman --noconfirm -Sy archlinux-keyring
pacman -S --noconfirm sed curl git
ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
hwclock --systohc
echo -e "$BASH_COLOR_LightGreen"
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo -e "$BASH_COLOR_Yellow"
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo -e "$BASH_COLOR_BrownOrange"
echo "KEYMAP=us" > /etc/vconsole.conf
echo -e "$BASH_COLOR_LightCyan"
echo "Hostname: "
read hostname
echo $hostname > /etc/hostname
echo "127.0.0.1       localhost" >> /etc/hosts
echo "::1             localhost" >> /etc/hosts
echo "127.0.1.1       $hostname.localdomain $hostname" >> /etc/hosts
passwd
pacman --noconfirm -S grub efibootmgr os-prober
echo -e "$BASH_COLOR_BrownOrange"
echo "Enter EFI partition: " 
read efipartition
mkdir /boot/efi
mount $efipartition /boot/efi 
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
curl -sL https://raw.githubusercontent.com/Sidmaz666/dotfiles/main/grub/grub -o /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg
curl -sL https://raw.githubusercontent.com/Sidmaz666/dotfiles/main/pkgs/pacman.txt -o /tmp/pacman.txt
curl -sL https://raw.githubusercontent.com/Sidmaz666/dotfiles/main/rofi/modern-dmenu.rasi -o /usr/share/rofi/themes/dmenu.rasi
curl -sL https://raw.githubusercontent.com/Sidmaz666/dotfiles/main/systemd/logind.conf -o /etc/systemd/logind.conf
curl -sL https://raw.githubusercontent.com/Sidmaz666/dotfiles/main/scripts/issuetxt.sh | sh > /etc/issue
pacman -S --noconfirm $(cat /tmp/pacman.txt)
sed -i 's/MODULES=""/MODULES=(amdgpu)/' /etc/mkinitcpio.conf
mkinitcpio -P
systemctl enable NetworkManager.service 
echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
echo "Enter Username: "
read username
useradd -m -G wheel -s /bin/bash $username
passwd $username
echo -e "$BASH_COLOR_Purple"
echo "Pre-Installation Finish Reboot now"
script=/home/$username/install3.sh
sed -e '/^#sectionTwoStart/,/^#sectionTwoComplete/d' install2.sh > $script
chown $username:$username $script
chmod +x $script
su -c $script -s /bin/bash $username
exit 
}

part_two

#sectionTwoComplete

dot_dir="$HOME/Documents"
conf_dir="$HOME/.config"
echo -e "$BASH_COLOR_BrownOrange Getting Paru AUR Helper"
curl -sL https://raw.githubusercontent.com/Sidmaz666/dotfiles/main/pkgs/paru.txt -o /tmp/paru.txt
sudo pacman -S --needed --noconfirm base-devel
git clone https://aur.archlinux.org/paru.git 
cd paru
makepkg -si
paru -Sy $(cat /tmp/paru.txt)
cd ..
rm -Rf paru
rm  -Rf  $conf_dir/picom
rm  -Rf  $conf_dir/kitty
rm  -Rf  $conf_dir/dunst
rm  -Rf  $conf_dir/mpv
rm  -Rf  $conf_dir/neofetch
rm  -Rf  $conf_dir/qtile
rm  -Rf  $conf_dir/vifm
rm  -Rf  $conf_dir/gtk-2.0
rm  -Rf  $conf_dir/gtk-3.0
rm  -Rf  $conf_dir/rofi
rm  -Rf  $conf_dir/ytfzf
rm /tmp/paru.txt
chsh -s /bin/zsh 
echo -e "$BASH_COLOR_LightCyan"
echo -e "$welcome_msg"
echo -e "Making Script Directory"
mkdir -p $HOME/Documents/scripts
mkdir -p $HOME/.config/rofi/applets
cd $HOME
mkdir -p Downloads
echo -e "$BASH_COLOR_BrownOrange Getting All Of My Dotfiles....\n"
echo -e "This Will Take Quite Some Time"
git clone https://github.com/Sidmaz666/dotfiles.git ~/Downloads
cd Downloads/dotfiles
cp  -R  scripts $dot_dir
cp  -R  wall $HOME/Pictures
cp  -R  picom $conf_dir
cp  -R  kitty $conf_dir
cp  -R  dunst $conf_dir
cp  -R  mpv $conf_dir
cp  -R  neofetch $conf_dir
cp  -R  qtile $conf_dir
cp  -R  vifm $conf_dir
cp  -R  gtk-2.0 $conf_dir
cp  -R  gtk-3.0 $conf_dir
cp  -R  rofi/powermenu $conf_dir/rofi/applets/android
cp  -R  ytfzf $conf_dir
cp mv vim/vimrc $HOME/.vimrc
echo -e "Getting Required Github Projects"
git clone https://github.com/windwp/rofi-color-picker.git $dot_dir/scripts
git clone https://github.com/junegunn/fzf.git $dot_dir/scripts
git clone https://github.com/cirala/vifmimg.git $conf_dir/vifm
git clone https://github.com/wstam88/rofi-fontawesome.git $dot_dir/scripts
mkdir -p $HOME/.vim/pack/coc/start
git clone https://github.com/neoclide/coc.nvim.git $HOME/.vim/pack/coc/start
echo -e "$BASH_COLOR_Purple"
echo "Installing Better Lock Screen Fork Sharingan Lock"
sudo cp  betterlockscreen_fork/sharinganlock /usr/bin/betterlockscreen
sudo cp  systemd/betterlockscreen.service@ /etc/systemd/system
sudo cp  systemd/getty@.service /etc/systemd/system/getty.target.wants/getty@tty1.service
sudo systemctl enable betterlockscreen@$USER
echo -e "$BASH_COLOR_LightGreen"
echo -e "Installation Finished, enable Better Lock Screen Service Manually and Rename Username(default Username random)\n"
read -p "Reload?(y/n)" $ xstarto
if [ $xstarto = y ]; then
  exit
else 
  reboot
fi

