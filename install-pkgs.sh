echo 'Updating repositories...'
echo

sudo pacman -Syu

echo
echo 'Installing pkgs...'
echo

sudo pacman -S hyprpaper swaync mpd fastfetch ncmpcpp wofi waybar kitty hyprshot resources nemo nemo-fileroller 

xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search # Set Nemo as default file browser
gsettings set org.cinnamon.desktop.default-applications.terminal exec kitty # Change the default terminal emulator for Nemo

yay -S opentabletdriver min-browser-bin 

