#!/bin/bash

# Script para Sway en CachyOS (proveniente de XFCE)

# Actualizar e instalar paquetes necesarios
# Se incluyen qt-wayland y polkit-gnome ya que XFCE no los garantiza para Wayland
sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm fastfetch btop pavucontrol sway swaylock swayidle wl-clipboard xorg-xwayland foot waybar wofi swaybg nwg-look grim slurp swappy ttf-font-awesome ttf-fira-code qt5-wayland qt6-wayland qt5ct qt6ct polkit-gnome xdg-desktop-portal-wlr chafa nwg-look

while true; do
    read -p "¿Quiere instalar brightnessctl? (notebooks) [s/n]: " respuesta
    respuesta=$(echo "$respuesta" | tr '[:upper:]' '[:lower:]')

    case "$respuesta" in
        [s]* ) 
            echo "Instalando brightnessctl..."
            sudo pacman -S --needed --noconfirm brightnessctl
            sudo usermod -aG video $USER
            break
            ;;
        [n]* ) 
            echo "Omitido."
            break
            ;;
        * ) 
            echo "Respuesta no válida."
            ;;
    esac
done
