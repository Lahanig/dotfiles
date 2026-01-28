sudo pacman -S sddm qt6-svg qt6-virtualkeyboard qt6-multimedia-ffmpeg

sudo git clone -b master --depth 1 https://github.com/keyitdev/sddm-astronaut-theme.git /usr/share/sddm/themes/sddm-astronaut-theme

sudo cp -r /usr/share/sddm/themes/sddm-astronaut-theme/Fonts/* /usr/share/fonts/

echo "[Theme]
Current=sddm-astronaut-theme" | sudo tee /etc/sddm.conf

echo "[General]
InputMethod=qtvirtualkeyboard" | sudo tee /etc/sddm.conf.d/virtualkbd.conf

sudo cp -f ~/dotfiles/wallpapers/sddm/ngnl_wallpaper.png /usr/share/sddm/themes/sddm-astronaut-theme/Backgrounds/
sudo cp -f ~/dotfiles/ngnl.conf /usr/share/sddm/themes/sddm-astronaut-theme/Themes/
sudo mv -f ~/dotfiles/metadata.desktop /usr/share/sddm/themes/sddm-astronaut-theme/metadata.desktop
