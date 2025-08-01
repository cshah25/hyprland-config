# #!/usr/bin/env bash

set -e

# List of packages to install
PACKAGES=(
    flatpak
    ghostty
    hyprland
    hyprlock
    hyprpaper
    kitty
    waybar
    wlogout
    wofi
    steam
    zsh
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-theme-powerlevel10k-git
)

echo "░▒▓███████▓▒░ ░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░                                
░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░                                
░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░                                
░▒▓███████▓▒░░▒▓████████▓▒░░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░                                
░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░                                
░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░                                
░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░    ░▒▓██████▓▒░                                 
                                                                                     
                                                                                     
░▒▓█▓▒░▒▓███████▓▒░ ░▒▓███████▓▒░▒▓████████▓▒░▒▓██████▓▒░░▒▓█▓▒░      ░▒▓█▓▒░        
░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░         ░▒▓█▓▒░  ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░        
░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░         ░▒▓█▓▒░  ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░        
░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓██████▓▒░   ░▒▓█▓▒░  ░▒▓████████▓▒░▒▓█▓▒░      ░▒▓█▓▒░        
░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░  ░▒▓█▓▒░  ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░        
░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░  ░▒▓█▓▒░  ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░        
░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓███████▓▒░   ░▒▓█▓▒░  ░▒▓█▓▒░░▒▓█▓▒░▒▓████████▓▒░▒▓████████▓▒░ 
                                                                                     
                                                                                     
 ░▒▓███████▓▒░░▒▓██████▓▒░░▒▓███████▓▒░░▒▓█▓▒░▒▓███████▓▒░▒▓████████▓▒░              
░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░                  
░▒▓█▓▒░      ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░                  
 ░▒▓██████▓▒░░▒▓█▓▒░      ░▒▓███████▓▒░░▒▓█▓▒░▒▓███████▓▒░  ░▒▓█▓▒░                  
       ░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░        ░▒▓█▓▒░                  
       ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░        ░▒▓█▓▒░                  
░▒▓███████▓▒░ ░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░        ░▒▓█▓▒░                  
"
# Detect distro
detect_distro() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        echo "$ID"
    else
        echo "unknown"
    fi
}

# Install yay
install_yay_arch() {
    if ! command -v yay &>/dev/null; then
        echo "yay not found. Installing yay..."
        sudo pacman -S --needed --noconfirm git base-devel
        git clone https://aur.archlinux.org/yay.git /tmp/yay
        (cd /tmp/yay && makepkg -si --noconfirm)
    else
        echo "yay already installed."
    fi
}

install_packages() {
    yay -Syu --noconfirm "${PACKAGES[@]}"
    echo "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

prompt_config_backup() {
    read -p "Do you want to back up your existing ~/.config directory? (y/n): " response
    case "$response" in
        [Yy]* )
            BACKUP_DIR="$HOME/.config.bak"
            echo "Backing up ~/.config to $BACKUP_DIR..."
            rm -rf "$BACKUP_DIR"
            cp -r ~/.config "$BACKUP_DIR"
            echo "Backup complete."
            ;;
        [Nn]* )
            echo "Skipping backup."
            ;;
        * )
            echo "Invalid response. Skipping backup."
            ;;
    esac
}

clone_and_copy_config() {
    REPO_URL="https://github.com/cshah25/hyprland-config.git"
    TEMP_DIR="/tmp/hyprland-config"

    wget https://github.com/aquasecurity/tfsec/releases/latest/download/tfsec-linux-amd64

    flatpak install dev.vencord.Vesktop --assumeyes

    echo "Cloning config repo..."
    git clone "$REPO_URL" "$TEMP_DIR"

    echo "Copying config files to ~/.config/..."
    mkdir -p ~/.config
    cp -r "$TEMP_DIR"/* ~/.config/

    echo "Please configure powerlevel10k using the command p10k configure"

    # p10k configure

    cp "$TEMP_DIR"/.zshrc ~/

    echo "Config files copied successfully."
}


main() {
    distro=$(detect_distro)
    echo "Detected distro: $distro"

    case "$distro" in
        arch | endeavouros | artix)
            install_yay_arch
            install_packages
            ;;
        *)
            echo "This script currently supports only Arch-based distros using yay."
            exit 1
            ;;
    esac
    prompt_config_backup
    clone_and_copy_config

    echo "Installation complete."
}

main
