#! /usr/bin/env fish

cp -rv $PWD/.config $HOME

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

if ! grep -e '^AutoEnable=false' /etc/bluetooth/main.conf >/dev/null
    sudo sed -i 's/.*AutoEnable=true/AutoEnable=false/' /etc/bluetooth/main.conf
end

# OTHER USEFUL #

sudo pacman -S --needed --noconfirm pigz btop jq unzip wev lsd man-db openssh

# FONTS #

sudo pacman -S --needed --noconfirm terminus-font

if ! grep -e '.*FONT=' /etc/vconsole.conf
    echo "FONT=ter-v24b" | sudo tee -a /etc/vconsole.conf
else
    sudo sed -i 's/.*FONT=.*/FONT=ter-v24b/' /etc/vconsole.conf
end

if ! grep -e '.*FONT_MAP=' /etc/vconsole.conf
    echo "FONT_MAP=9959-2" | sudo tee -a /etc/vconsole.conf
else
    sudo sed -i 's/.*FONT_MAP=.*/FONT_MAP=8859-2/' /etc/vconsole.conf
end

sudo cp -rv $PWD/FiraCodeNerdFont /usr/share/fonts

# GRUB #

ln -s $PWD/Wallpapers $HOME/Wallpapers
sudo cp -v $(readlink -f $HOME/Wallpapers/grub.jpg) /boot/grub/wallpaper.jpg
sudo grub-mkfont --output=/boot/grub/fonts/firacode.pf2 --size=24 /usr/share/fonts/FiraCodeNerdFont/FiraCodeNerdFont-Medium.ttf

if ! grep -e '.*GRUB_FONT=' /etc/default/grub
    echo "GRUB_FONT=/boot/grub/fonts/firacode.pf2" | sudo tee -a /etc/default/grub >/dev/null
else
    sudo sed -i 's/.*GRUB_FONT=.*/\/boot\/grub\/fonts\/firacode.pf2/' /etc/default.grub
end

if grep -e quiet /etc/default/grub
    sudo sed -i 's/ quiet//' /etc/default/grub
end

if ! grep -e '.*GRUB_BACKGROUND=' /etc/default/grub
    echo "GRUB_BACKGROUND=/boot/grub/wallpaper.jpg" | sudo tee -a /etc/default.grub
else
    sudo sed -i 's/#GRUB_BACKGROUND.*/GRUB_BACKGROUND=\/boot\/grub\/wallpaper.jpg/' /etc/default/grub
end

sudo grub-mkconfig -o /boot/grub/grub.cfg

# GTK THEME #

sudo pacman -S --needed --noconfirm sassc gtk-engine-murrine gnome-themes-extra
cp -rv $PWD/.themes $HOME
gsettings set org.gnome.desktop.interface gtk-theme tokyonight
mkdir -p $HOME/.local/share/icons
cp -rv $PWD/sunset_cursor $HOME/.local/share/icons/sunset

# FISH SHELL #

sudo pacman -S --needed --noconfirm fish fzf fd bat
set username (whoami)
sudo chsh -s (which fish) $username

set lastpwd $PWD
git clone https://aur.archlinux.org/yay-git $HOME/yay-git
cd $HOME/yay-git
makepkg -si
cd $PWD
rm -rfv $HOME/yay-git

# yay -S --noconfirm wyeb
