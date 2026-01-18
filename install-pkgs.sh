echo 'Updating repositories...'
echo

sudo pacman -Syu

echo
echo 'Installing pkgs...'
echo

sudo pacman -S hyprpaper swaync mpd fastfetch ncmpcpp wofi waybar kitty hyprshot resources nemo nemo-fileroller brightnessctl nwg-look code gedit hyprland

xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search # Set Nemo as default file browser
gsettings set org.cinnamon.desktop.default-applications.terminal exec kitty # Change the default terminal emulator for Nemo

yay -S opentabletdriver min-browser-bin 

echo 
echo 'Installing fonts'
echo

sudo pacman -S ttf-jetbrains-mono ttf-font-awesome ttf-indic-otf ttf-arphic-uming noto-fonts-emoji ttf-croscore ttf-dejavu ttf-droid gnu-free-fonts ttf-input-nerd noto-fonts ttf-jetbrains-mono ttf-roboto ttf-roboto-mono noto-fonts-cjk adobe-source-han-sans-jp-fonts adobe-source-han-serif-jp-fonts nerd-fonts

yay -S otf-openmoji ttf-symbola-free ttf-twemoji ttf-joypixels

echo 
echo 'Installing theme'
echo

yay -S tokyonight-gtk-theme-git 

echo 
echo 'Done! Pkgs are installed.'
echo
