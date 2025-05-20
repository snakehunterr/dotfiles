#! /bin/sh

cp -rv ${PWD}/.config ~

# MAIN PACKAGES #

sudo pacman -S --needed --noconfirm hyprland hyprlock hyprpaper hypridle hyprpicker hyprsunset hyprcursor
sudo pacman -S --needed --noconfirm kitty firefox helix
sudo pacman -S --needed --noconfirm xdg-desktop-portal xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
sudo pacman -S --needed --noconfirm rofi-wayland waybar
sudo pacman -S --needed --noconfirm libnotify swaync
sudo pacman -S --needed --noconfirm wl-clipboard wmctrl grim slurp

sudo pacman -S --needed --noconfirm pipewire pipewire-alsa pipewire-pulse pipewire-audio wireplumber alsa-utils

# asahi arch linux arm
# pacman -S speakersafetyd

sudo pacman -S --needed --noconfirm bluez bluez-utils bluetui
sudo systemctl enable bluetooth.service
sudo sed -i 's/#AutoEnable=true/AutoEnable=false/' /etc/bluetooth/main.conf

# OTHER USEFUL #

sudo pacman -S --needed --noconfirm pigz btop jq unzip wev lsd man-db openssh

# FONTS #

sudo pacman -S --needed --noconfirm terminus-font
echo "FONT=ter-v24b" | sudo tee -a /etc/vconsole.conf
echo "FONT_MAP=8859-2" | sudo tee -a /etc/vconsole.conf
sudo cp -rv ${PWD}/FiraCodeNerdFont /usr/share/fonts

# GRUB #

ln -s ${PWD}/Wallpapers ${HOME}/Wallpapers

sudo grub-mkfont --output=/boot/grub/fonts/firacode.pf2 --size=24 /usr/share/fonts/FiraCodeNerdFont/FiraCodeNerdFont-Medium.ttf
echo "GRUB_FONT=/boot/grub/fonts/firacode.pf2" | sudo tee -a /etc/default/grub >/dev/null

sudo cp -v $(readlink -f ~/Wallpapers/grub.jpg) /boot/grub/wallpaper.jpg
sudo sed -i 's/#GRUB_BACKGROUND.*/GRUB_BACKGROUND=\/boot\/grub\/wallpaper.jpg/' /etc/default/grub
sudo sed -i 's/ quiet//' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

# GTK THEME #

sudo pacman -S --needed --noconfirm sassc gtk-engine-murrine gnome-themes-extra
cp -rv ${PWD}/.themes ~
gsettings set org.gnome.desktop.interface gtk-theme "tokyonight"
mkdir -p ~/.local/share/icons
cp -rv ${PWD}/sunset_cursor ~/.local/share/icons/sunset

# FISH SHELL #

sudo pacman -S --needed --noconfirm fish fzf fd bat
username=$(whoami)
sudo chsh -s $(which fish) ${username}

lastpwd=$PWD
git clone https://aur.archlinux.org/yay-git ~/yay-git
cd ~/yay-git
makepkg -si
cd $PWD
rm -rfv ~/yay-git

# yay -S --noconfirm wyeb
