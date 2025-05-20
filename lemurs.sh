#! /bin/sh

sudo pacman -S --needed --noconfirm lemurs
sudo systemctl disable display-manager.service
sudo systemctl enable lemurs.service

username=$(whoami)
sudo usermod -aG seat ${username}
sudo cp lemurs_hypr /etc/lemurs/wayland/hyprland
sudo chmod 755 /etc/lemurs/wayland/hyprland
