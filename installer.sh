#!/usr/bin/env bash

sudo pacman -Syu
sudo pacman -S --needed --noconfirm base-devel

git clone https://aur.archlinux.org/yay.git /tmp/buildyay
cd /tmp/buildyay
makepkg -si --noconfirm

cd $HOME/dotfiles

PKG_FILE="pckgs.txt"

while IFS= read -r pkg; do
    [[ -z "$pkg" || "$pkg" =~ ^# ]] && continue
    yay -S --needed --noconfirm "$pkg" || {
        echo "Failed to install: $pkg"
        exit 1
    }
done < "$PKG_FILE"

systemctl enable sddm
systemctl enable reflector.service

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/Alexays/Waybar
cd Waybar
meson setup build
ninja -C build install
cd ..
sudo rm -rf Waybar/

cd
sudo rm -rf .config/
cd dotfiles
mv .config .git .gitignore .zshrc ../

cd $HOME/.config/hypr/confs
sudo mkdir -p /etc/sddm.conf.d
sudo mv autologin.conf /etc/sddm.conf.d/
sudo mkdir -p /etc/xdg/reflector
sudo mv reflector.conf /etc/xdg/reflector/
cd ..
rmdir confs

cd
rm -rf dotfiles/
