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
reflector --verbose --completion-percent 100 --ipv6 --protocol https --score 20 --sort rate --save /etc/pacman.d/mirrorlist
fi
echo -e "$BASH_COLOR_Cyan"
echo -e "Modifying pacman.conf\n"
sed -i "s/^#ParallelDownloads = 5$/ParallelDownloads = 15/" /etc/pacman.conf
sed -i "s/^#Color$/Color \nILoveCandy/" /etc/pacman.conf
sed -i "s/^#SigLevel = Optional TrustAll $/SigLevel = Never/" /etc/pacman.conf
loadkeys us
timedatectl set-ntp true
hwclock --systohc
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
read -p "Did you also created a SWAP partition? [y/n] " swap
if [ $swap = y ] ; then
  clear 
  lsblk
  echo "Enter SWAP partition: "
  read swapans
  mkswap $swapans
fi
echo -e "$BASH_COLOR_LightGreen"
read -p "Did you also create efi partition? [y/n] " answer
if [ $answer = y ] ; then
  clear
  lsblk
  echo "Enter EFI partition: "
  read efipartition
  mkfs.vfat -F 32 $efipartition
fi
echo -e "$BASH_COLOR_Cyan"
mount $partition /mnt 
pacstrap /mnt base base-devel linux linux-firmware
echo -e "\nRun Pactsrap again? (y/n)\n"
read pacs
if [ $pacs = "y" ]; then 
echo -e "Running Pactsrap again \n"
pacstrap /mnt base base-devel linux linux-firmware
fi
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
clear
echo -e "$BASH_COLOR_Cyan"
echo -e "$welcome_msg"
echo -e "$BASH_COLOR_LightCyan" 
sed -i "s/^#ParallelDownloads = 5$/ParallelDownloads = 15/" /etc/pacman.conf
sed -i "s/^#Color$/Color \n ILoveCandy/" /etc/pacman.conf
ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
timedatectl set-ntp true
hwclock --systohc
pacman -Sy --noconfirm sed curl git archlinux-keyring networkmanager
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
curl -sL https://raw.githubusercontent.com/Sidmaz666/dotfiles/main/pkgs/pacman.txt -o /tmp/pacman.txt
rm /etc/issue
curl -sL https://raw.githubusercontent.com/Sidmaz666/dotfiles/main/scripts/issuetxt.sh | sh > /etc/issue
pacman -S --noconfirm $(cat /tmp/pacman.txt)
read -p "Failed! Retry? (y/n) " inspkg
if [ $inspkg = "y" ]; then
pacman -S --noconfirm $(cat /tmp/pacman.txt)
fi
sed -i 's/^MODULES=""/MODULES=(amdgpu)/' /etc/mkinitcpio.conf \
  || sed -i 's/^#MODULES=""/MODULES=(amdgpu)/' /etc/mkinitcpio.conf \
  || sed -i 's/^MODULES=()/MODULES=(amdgpu)/' /etc/mkinitcpio.conf \
  || sed -i 's/^#MODULES=()/MODULES=(amdgpu)/' /etc/mkinitcpio.conf \
  || sed -i 's/MODULES=()/MODULES=(amdgpu)/' /etc/mkinitcpio.conf \
  || echo -e "MODULES=(amdgpu)" >> /etc/mkinitcpio.conf
mkinitcpio -P
echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
clear
echo -e "$BASH_COLOR_LightCyan"
echo "Enter Username: "
read username
useradd -m -G wheel $username
passwd $username
systemctl enable NetworkManager.service
systemctl enable systemd-zram-setup@zram0.service
echo -e "$BASH_COLOR_Purple"
clear
echo -e "Getting Paru"
pacman -S --noconfirm git
git clone https://aur.archlinux.org/paru.git /home/$username/paru 
echo "Pre-Installation Finished"
sed -e '/^#sectionTwoStart/,/^#sectionTwoComplete/d' install2.sh > install3.sh
chown $username:$username install3.sh
chown $username:$username /home/$username/paru
chmod +x install3.sh
cp install3.sh /home/$username/install3.sh
su -c /home/$username/install3.sh $username
exit 
}

part_two

#sectionTwoComplete

cd $HOME
echo -e "$BASH_COLOR_BrownOrange System Update Check"
sudo pacman -Syyu --noconfirm
sudo pacman -S --needed --noconfirm base-devel
dot_dir="$HOME/Documents"
mkdir -p $HOME/.config
conf_dir="$HOME/.config"
cd paru
makepkg -si 
echo -e "Building Paru...\n"
cd $HOME
rm -Rf paru
clear
echo -e "$BASH_COLOR_LightCyan"
echo -e "$welcome_msg"
echo -e "Making Script Directory"
mkdir -p $HOME/Documents/scripts
echo -e "$BASH_COLOR_BrownOrange \nGetting All Of My Dotfiles....\n"
echo -e "This Will Take Quite Some Time\n"
git clone https://github.com/Sidmaz666/dotfiles.git 
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
cd dotfiles
paru -Syyu --noconfirm
clear
echo -e "Manually Select!\n"
paru -S $(cat pkgs/pkgs.txt) 
cp -R scripts $dot_dir
mkdir -p $HOME/Pictures
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
mkdir -p $conf_dir/rofi/applets/
mv rofi/powermenu $conf_dir/rofi/applets/android
cp -R ytfzf $conf_dir
mkdir -p $HOME/.cache
cp -R betterlockscreen_fork/betterlockscreen $HOME/.cache/betterlockscreen
cp zsh/zshrc $HOME/.zshrc
cp zsh/zprofile $HOME/.zprofile
cp bash/bashrc $HOME/.bashrc
cp bash/bash_profile $HOME/.bash_profile
cp vim/vimrc $HOME/.vimrc
cp xinit/xinitrc $HOME/.xinitrc
echo -e "Getting Required Github Projects"
cd $dot_dir/scripts
git clone https://github.com/windwp/rofi-color-picker.git 
git clone https://github.com/junegunn/fzf.git 
git clone https://github.com/wstam88/rofi-fontawesome.git 
mkdir -p $conf_dir/vifm/vifmimg
cd $conf_dir/vifm/vifmimg
git clone https://github.com/cirala/vifmimg.git scripts 
mkdir -p $HOME/.vim/pack/coc/start
git clone https://github.com/neoclide/coc.nvim.git $HOME/.vim/pack/coc/start
cd $HOME
git clone https://github.com/ohmyzsh/ohmyzsh.git .oh-my-zsh
cd $HOME/dotfiles
echo -e "$BASH_COLOR_Purple"
echo "Installing Better Lock Screen Fork Sharingan Lock"
sudo cp  betterlockscreen_fork/sharinganlock /usr/bin/betterlockscreen
sudo cp  systemd/betterlockscreen.service@ /etc/systemd/system/betterlockscreen.service@
sudo cp  systemd/logind.conf /etc/systemd/logind.conf
sudo cp  rofi/modern-dmenu.rasi /usr/share/rofi/themes/dmenu.rasi
sudo cp  systemd/getty@.service /etc/systemd/system/getty.target.wants/getty@tty1.service
sudo systemctl enable betterlockscreen@$USER
sudo systemctl enable getty@tty1
chsh -s /bin/zsh 
echo -e "$BASH_COLOR_LightGreen"
echo -e "Installation Finished, enable Better Lock Screen Service Manually and Rename Username(default Username random)\n"
cd $HOME
mkdir -p Downloads
mv dotfiles $HOME/Downloads
exit

