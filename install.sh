#!/bin/bash

BASH_COLOR_LightGreen='\033[1;32m'
BASH_COLOR_BrownOrange='\033[0;33m'     
BASH_COLOR_Yellow='\033[1;33m'
BASH_COLOR_Purple='\033[0;35m'     
BASH_COLOR_Cyan='\033[0;36m'     
BASH_COLOR_LightCyan='\033[1;36m'

IFS='' read -r -d '' welcome_msg <<"EOF"
    █████╗ ██████╗  ██████╗██╗  ██╗    ██████╗ ██╗ ██████╗███████╗
   ██╔══██╗██╔══██╗██╔════╝██║  ██║    ██╔══██╗██║██╔════╝██╔════╝
   ███████║██████╔╝██║     ███████║    ██████╔╝██║██║     █████╗
   ██╔══██║██╔══██╗██║     ██╔══██║    ██╔══██╗██║██║     ██╔══╝
   ██║  ██║██║  ██║╚██████╗██║  ██║    ██║  ██║██║╚██████╗███████╗
   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝    ╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝
   
   ██████╗ ██╗   ██╗    ███████╗██╗██████╗ ███╗   ███╗ █████╗ ███████╗
   ██╔══██╗╚██╗ ██╔╝    ██╔════╝██║██╔══██╗████╗ ████║██╔══██╗╚══███╔╝
   ██████╔╝ ╚████╔╝     ███████╗██║██║  ██║██╔████╔██║███████║  ███╔╝
   ██╔══██╗  ╚██╔╝      ╚════██║██║██║  ██║██║╚██╔╝██║██╔══██║ ███╔╝
   ██████╔╝   ██║       ███████║██║██████╔╝██║ ╚═╝ ██║██║  ██║███████╗
   ╚═════╝    ╚═╝       ╚══════╝╚═╝╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝
EOF

#sectionOneStart

part_one(){

  clear

  loadkeys us
  timedatectl set-ntp true
  hwclock --systohc

  echo -e "$BASH_COLOR_Cyan"
  echo -e "$welcome_msg"
  echo -e "$BASH_COLOR_LightGreen"

  read -p "Continue?(y/n) " con
  if [ $con = "n" ]; then 
  exit
  fi

  echo -e "$BASH_COLOR_LightGreen" 
  read -p "Update Mirrorlist?(y/n) " ref
  if [ $ref = "y" ]; then
  pacman -Sy --noconfirm reflector xxhash rsync curl
  reflector --latest 20 --sort rate --save /etc/pacman.d/mirrorlist --protocol https --download-timeout 5
  fi

echo -e "$BASH_COLOR_Cyan"

echo -e "Modifying pacman.conf\n"
sed -i "s/^#ParallelDownloads = 5$/ParallelDownloads = 15/" /etc/pacman.conf
sed -i "s/^#Color$/Color \nILoveCandy/" /etc/pacman.conf

echo -e "Disable PGP Signatures?(y/n) "
read pgpsig
if [ $pgpsig = "y" ]; then
sed -i "s/^#SigLevel = Optional TrustAll $/SigLevel = Never/" /etc/pacman.conf
fi

pacman --noconfirm -Sy archlinux-keyring

echo -e "$BASH_COLOR_BrownOrange"

clear
lsblk

echo -e "$BASH_COLOR_Yellow"

echo "Enter the drive: "
read drive
cfdisk $drive 

echo -e "$BASH_COLOR_LightCyan"

clear 
lsblk
echo "Enter the Linux partition: "
read partition
mkfs.ext4 $partition 

echo -e "$BASH_COLOR_Purple"

clear
read -p "Did you also created a SWAP partition? [y/n] " swap
if [ $swap = y ] ; then
  clear 
  lsblk
  echo "Enter SWAP partition: "
  read swapans
  mkswap $swapans
  clear
fi

echo -e "$BASH_COLOR_LightGreen"

read -p "Did you also create efi partition? [y/n] " answer
if [ $answer = y ] ; then
  lsblk
  echo "Enter EFI partition: "
  read efipartition
  mkfs.vfat -F 32 $efipartition
  clear
fi

clear
echo -e "$BASH_COLOR_Cyan"

mount $partition /mnt 

pacstrap /mnt base base-devel linux linux-firmware

echo -e "$BASH_COLOR_LightCyan"

echo -e "\nRun Pactsrap again? (y/n)\n"
read pacs
if [ $pacs = "y" ]; then 
  echo -e "$BASH_COLOR_LightGreen"
  echo -e "Running Pactsrap again \n"
  pacstrap /mnt base base-devel linux linux-firmware
fi

genfstab -U /mnt >> /mnt/etc/fstab

sed -e '/^#sectionOneStart/,/^#sectionOneComplete/d' install.sh > /mnt/install2.sh
chmod +x /mnt/install2.sh

echo -e "$BASH_COLOR_LightGreen"
read -p "Base Arch Installation Finished. Continue? (y/n) " baseins
if [ $baseins = "n" ]; then
exit
fi

arch-chroot /mnt ./install2.sh

exit 
}

part_one

#sectionOneComplete

#sectionTwoStart

part_two(){

clear
echo -e "$BASH_COLOR_Cyan"
echo -e "$welcome_msg"
echo -e "$BASH_COLOR_LightCyan" 

sed -i "s/^#ParallelDownloads = 5$/ParallelDownloads = 15/" /etc/pacman.conf
sed -i "s/^#Color$/Color \n ILoveCandy/" /etc/pacman.conf
sed -i "s/^#SigLevel = Optional TrustAll $/SigLevel = Never/" /etc/pacman.conf

ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
timedatectl set-ntp true
hwclock --systohc

pacman -Sy --noconfirm sed curl archlinux-keyring

clear

echo -e "$BASH_COLOR_LightGreen"

echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen

echo -e "$BASH_COLOR_Yellow"

echo "LANG=en_US.UTF-8" > /etc/locale.conf

echo -e "$BASH_COLOR_BrownOrange"

echo "KEYMAP=us" > /etc/vconsole.conf

echo -e "$BASH_COLOR_LightCyan"

clear
echo "Hostname: "
read hostname
echo $hostname > /etc/hostname
echo "127.0.0.1       localhost" >> /etc/hosts
echo "::1             localhost" >> /etc/hosts
echo "127.0.1.1       $hostname.localdomain $hostname" >> /etc/hosts

passwd

pacman --noconfirm -S grub efibootmgr os-prober

echo -e "[zram0]" >> /etc/systemd/zram-generator.conf

echo -e "$BASH_COLOR_BrownOrange"

clear
lsblk
echo "Enter EFI partition: " 
read efipartition
mkdir /boot/efi
mount $efipartition /boot/efi 
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
curl -sL https://raw.githubusercontent.com/Sidmaz666/dotfiles/main/grub/grub -o /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

rm /etc/issue
curl -sL https://raw.githubusercontent.com/Sidmaz666/dotfiles/main/scripts/issuetxt.sh | sh > /etc/issue

echo -e "$BASH_COLOR_LightGreen"

clear
pacman -S --noconfirm $(curl -sL https://raw.githubusercontent.com/Sidmaz666/dotfiles/main/pkgs/pacman.txt)
read -p "Failed! Retry? (y/n) " inspkg
if [ $inspkg = "y" ]; then
clear
pacman -S --noconfirm $(curl -sL https://raw.githubusercontent.com/Sidmaz666/dotfiles/main/pkgs/pacman.txt)
read -p "Failed Again?(y/n) " pkgsins
if [ $pkgsins = "y" ]; then
  clear
  echo -e "Confirm Packages Manually!!\n"
  pacman -S $(curl -sL https://raw.githubusercontent.com/Sidmaz666/dotfiles/main/pkgs/pacman.txt)
fi
fi

clear
sed -i 's/MODULES=""/MODULES=(amdgpu)/' /etc/mkinitcpio.conf 
sed -i 's/MODULES=()/MODULES=(amdgpu)/' /etc/mkinitcpio.conf 
mkinitcpio -P

echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

clear
echo -e "$BASH_COLOR_Cyan"
echo "Enter Username: "
read username
useradd -m -G wheel $username
passwd $username

systemctl enable NetworkManager.service
systemctl enable systemd-zram-setup@zram0.service

echo -e "$BASH_COLOR_Purple"

clear
echo -e "Cloning Paru"
git clone https://aur.archlinux.org/paru.git /home/$username/paru 
chown $username:$username /home/$username/paru
echo "Pre-Installation Finished"

echo -e "$BASH_COLOR_Purple\n"

read -p "Continue and Rice Your System?(y/n) " rice
if [ $rice = "n" ]; then
  exit
fi

sed -e '/^#sectionTwoStart/,/^#sectionTwoComplete/d' install2.sh > install3.sh
chown $username:$username install3.sh
chmod +x install3.sh
cp install3.sh /home/$username/install3.sh
su -c /home/$username/install3.sh $username

exit 
}

part_two

#sectionTwoComplete

cd $HOME

echo -e "$BASH_COLOR_BrownOrange"

echo -e "Making Directories!"
mkdir -p $HOME/Documents
mkdir -p $HOME/.config
mkdir -p $HOME/Pictures

dot_dir="$HOME/Documents"
conf_dir="$HOME/.config"

clear
echo -e "Installing Paru (AUR-Helper)\n"
cd paru
makepkg -si 
echo -e "Paru (AUR-Helper) Installed...\n"

cd $HOME
rm -Rf $HOME/paru

clear
echo -e "$BASH_COLOR_LightCyan"
echo -e "$welcome_msg"
echo -e "$BASH_COLOR_BrownOrange\nGetting All Of My Dotfiles....\n"
echo -e "This Will Take Quite Some Time\n"

git clone https://github.com/Sidmaz666/dotfiles.git 

cd dotfiles

clear
echo -e "Updating & Installing Extra Packages Via Paru!\n"
echo -e "Manually Select the packages!\n"
paru -Sy $(cat pkgs/pkgs.txt) 
read -p "Failed to install all the packages?(y/n) " parufail
if [ $parufail = "y" ]; then
  clear
  paru -Sy $(cat pkgs/pkgs.txt)
	read -p "Failed again?(y/n) " pag
	if [ $pag = "y" ]; then
	  clear
	  paru -S $(cat pkgs/pkgs.txt)
	fi
fi

clear
rm -Rf $conf_dir/picom
rm -Rf $conf_dir/kitty
rm -Rf $conf_dir/dunst
rm -Rf $conf_dir/mpv
rm -Rf $conf_dir/neofetch
rm -Rf $conf_dir/qtile
rm -Rf $conf_dir/vifm
rm -Rf $conf_dir/gtk-2.0
rm -Rf $conf_dir/gtk-3.0
rm -Rf $conf_dir/rofi
rm -Rf $conf_dir/ytfzf

cp -R scripts $dot_dir
cp -R wall $HOME/Pictures
cp -R picom $conf_dir
cp -R kitty $conf_dir
cp -R dunst $conf_dir
cp -R mpv $conf_dir
cp -R neofetch $conf_dir
cp -R qtile $conf_dir
cp -R vifm $conf_dir
cp -R gtk-2.0 $conf_dir
cp -R gtk-3.0 $conf_dir
cp -R ytfzf $conf_dir

mkdir -p $conf_dir/rofi/applets/
mv rofi/powermenu $conf_dir/rofi/applets/android

mkdir -p $HOME/.cache
mv betterlockscreen_fork/betterlockscreen $HOME/.cache/betterlockscreen

cp zsh/zshrc $HOME/.zshrc
cp zsh/zprofile $HOME/.zprofile
cp bash/bashrc $HOME/.bashrc
cp bash/bash_profile $HOME/.bash_profile
cp vim/vimrc $HOME/.vimrc
cp xinit/xinitrc $HOME/.xinitrc

echo -e "$BASH_COLOR_LightGreen" 

echo -e "Getting Required Github Projects"
cd $dot_dir/scripts
git clone https://github.com/windwp/rofi-color-picker.git 
git clone https://github.com/junegunn/fzf.git 
git clone https://github.com/wstam88/rofi-fontawesome.git 

mkdir -p $conf_dir/vifm/vifmimg
cd $conf_dir/vifm/vifmimg

rm -Rf $conf_dir/vifm/vifmimg/scripts
git clone https://github.com/cirala/vifmimg.git scripts 

mkdir -p $HOME/.vim/pack/coc/start
cd $HOME/.vim/pack/coc/start
git clone https://github.com/neoclide/coc.nvim.git --depth=1

mkdir -p $conf_dir/coc/extensions
cd $conf_dir/coc/extensions
if [ ! -f package.json ]
then
  echo '{"dependencies":{}}'> package.json
fi

npm install coc-snippets coc-html coc-json coc-tsserver coc-prettier coc-css coc-phpls coc-sql --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod

cd $HOME
git clone https://github.com/ohmyzsh/ohmyzsh.git .oh-my-zsh

clear
cd $HOME/dotfiles
echo -e "$BASH_COLOR_Purple"
echo "Installing Better Lock Screen Fork Sharingan-Lock!"
sudo cp  betterlockscreen_fork/sharinganlock /usr/bin/betterlockscreen
sudo cp  systemd/betterlockscreen@.service /etc/systemd/system/betterlockscreen@$USER.service

echo -e "\nSetting-up TTY\n"
sudo cp  systemd/logind.conf /etc/systemd/logind.conf
sudo cp  rofi/modern-dmenu.rasi /usr/share/rofi/themes/dmenu.rasi
sudo cp  systemd/getty@.service /etc/systemd/system/getty.target.wants/getty@tty1.service
sudo systemctl enable getty@tty1

clear
echo -e "$BASH_COLOR_LightCyan"
echo -e "Changing Default shell to ZSH\n"
chsh -s /bin/zsh 

clear
echo -e "$BASH_COLOR_LightGreen"
echo -e "Installation Finished, enable Better Lock Screen Service Manually!!\n Zram might need a restart too!!\n"

cd $HOME
mkdir -p Downloads
mv dotfiles $HOME/Downloads

exit

