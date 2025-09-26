#!/bin/bash

# Install script for kickstart-fork dependencies

set -e

echo "Detecting OS..."

if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "macOS detected. Using Homebrew."
    brew install ripgrep fd neovim git make unzip gcc
    # Install codelldb for debugging
    brew install codelldb
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if command -v apt &> /dev/null; then
        echo "Ubuntu/Debian detected. Using apt."
        sudo apt update
        sudo apt install -y ripgrep fd-find neovim git make unzip gcc
        # codelldb not in apt, download from releases
        echo "Installing codelldb..."
        curl -L https://github.com/vadimcn/codelldb/releases/latest/download/codelldb-x86_64-linux.vsix -o codelldb.vsix
        unzip codelldb.vsix
        # Assume tools/ exists or create it
        mkdir -p tools
        mv extension tools/codelldb-linux
        rm codelldb.vsix
    elif command -v pacman &> /dev/null; then
        echo "Arch Linux detected. Using pacman."
        sudo pacman -S --noconfirm ripgrep fd neovim git make unzip gcc
        # codelldb via AUR or download
        echo "Installing codelldb..."
        curl -L https://github.com/vadimcn/codelldb/releases/latest/download/codelldb-x86_64-linux.vsix -o codelldb.vsix
        unzip codelldb.vsix
        mkdir -p tools
        mv extension tools/codelldb-linux
        rm codelldb.vsix
    else
        echo "Unsupported Linux distro. Please install manually: ripgrep, fd, neovim, git, make, unzip, gcc, codelldb"
        exit 1
    fi
else
    echo "Unsupported OS. Please install manually: ripgrep, fd, neovim, git, make, unzip, gcc, codelldb"
    exit 1
fi

echo "Installation complete. Run 'nvim' to start."