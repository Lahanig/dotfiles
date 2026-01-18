#!/bin/bash

backup_and_link() {
    local source=$1
    local target=$2
    
    # If target exists and is not already the correct symlink
    if [ -e "$target" ] || [ -L "$target" ]; then
        if [ -L "$target" ] && [ "$(readlink -f "$target")" = "$(readlink -f "$source")" ]; then
            echo "✓ $target already linked correctly"
            return
        fi
        
        echo -n "Replace $target? [b]ackup/[o]verwrite/[s]kip (default: overwrite) "
        read -r response
        response=${response:-o}  # Default to overwrite if just Enter
        
        case $response in
            [Bb]*)
                if [ ! -L "$target" ]; then
                    if [ ! -e "$target.backup" ]; then
                        echo "Backing up to $target.backup"
                        mv "$target" "$target.backup"
                    else
                        echo "Backup already exists at $target.backup"
                        echo -n "Overwrite backup? [y/N] "
                        read -r overwrite
                        if [[ $overwrite =~ ^[Yy]$ ]]; then
                            rm -rf "$target.backup"
                            mv "$target" "$target.backup"
                            echo "Backed up to $target.backup"
                        else
                            echo "Removing current $target without backup"
                            rm -rf "$target"
                        fi
                    fi
                else
                    echo "$target is a symlink, removing it"
                    rm "$target"
                fi
                ;;
            [Oo]*)
                echo "Overwriting $target"
                rm -rf "$target"
                ;;
            [Ss]*)
                echo "Skipped $target"
                return
                ;;
            *)
                echo "Invalid option, skipping $target"
                return
                ;;
        esac
    fi
    
    ln -sf "$source" "$target"
    echo "✓ Linked $target"
}

echo "Installing dotfiles..."
echo

backup_and_link ~/dotfiles/fastfetch ~/.config/fastfetch
backup_and_link ~/dotfiles/hypr ~/.config/hypr
backup_and_link ~/dotfiles/kitty ~/.config/kitty
backup_and_link ~/dotfiles/mpd ~/.config/mpd
backup_and_link ~/dotfiles/ncmpcpp ~/.config/ncmpcpp
backup_and_link ~/dotfiles/wofi ~/.config/wofi
backup_and_link ~/dotfiles/waybar ~/.config/waybar
backup_and_link ~/dotfiles/swaync ~/.config/swaync
backup_and_link ~/dotfiles/OpenTabletDriver ~/.config/OpenTabletDriver

backup_and_link ~/dotfiles/user-dirs.dirs ~/.config/user-dirs.dirs

backup_and_link ~/dotfiles/wallpapers ~/wallpapers
backup_and_link ~/dotfiles/scripts ~/scripts
backup_and_link ~/dotfiles/.icons ~/.icons

echo
echo "Done! Dotfiles installed."

./install-pkgs.sh