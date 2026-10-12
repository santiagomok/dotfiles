#!/usr/bin/env bash
# vim: ft=bash

# Run:bash -x ./nvim_move_appname.sh 
# Action
# mv ~/.config/nvim ~/.config/nvim.bak
# mv ~/.local/share/nvim ~/.local/share/nvim.bak
# mv ~/.local/state/nvim ~/.local/state/nvim.bak
# mv ~/.cache/nvim ~/.cache/nvim.bak

# Exit immediately if a command exits with a non-zero status
set -e

echo "=========================================="
echo " Neovim Configuration Migration Script   "
echo "=========================================="

# 1. Get the custom NVIM_APPNAME from the user
read -p "Enter the NVIM_APPNAME you want to migrate to main nvim: " APP_NAME

if [ -z "$APP_NAME" ]; then
    echo "Error: No app name provided. Exiting."
    exit 1
fi

# Define paths
CONFIG_DIR="$HOME/.config"
SHARE_DIR="$HOME/.local/share"
STATE_DIR="$HOME/.local/state"
CACHE_DIR="$HOME/.cache"

echo ""
echo ">>> Checking if custom application directories exist..."
if [ ! -d "$CONFIG_DIR/$APP_NAME" ]; then
    echo "Error: Configuration directory '$CONFIG_DIR/$APP_NAME' does not exist."
    exit 1
fi

# 2. Backup existing main Neovim configurations safely
echo ""
echo ">>> Backing up existing main Neovim directories (if any)..."
for dir in "$CONFIG_DIR/nvim" "$SHARE_DIR/nvim" "$STATE_DIR/nvim" "$CACHE_DIR/nvim"; do
    if [ -d "$dir" ] || [ -L "$dir" ]; then
        bak_suffix="-0.10.0"
        echo "  Backing up $dir to ${dir}${bak_suffix}"
        # Overwrite previous backup if it exists to allow fresh run, or exit if unsafe
        rm -rf "${dir}${bak_suffix}"
        mv "$dir" "${dir}${bak_suffix}"
    fi
done

# 3. Move custom NVIM_APPNAME to main nvim
echo ""
echo ">>> Migrating '$APP_NAME' to default 'nvim' slots..."

if [ -d "$CONFIG_DIR/$APP_NAME" ]; then
    echo "  Moving $CONFIG_DIR/$APP_NAME -> $CONFIG_DIR/nvim"
    mv "$CONFIG_DIR/$APP_NAME" "$CONFIG_DIR/nvim"
fi

if [ -d "$SHARE_DIR/$APP_NAME" ]; then
    echo "  Moving $SHARE_DIR/$APP_NAME -> $SHARE_DIR/nvim"
    mv "$SHARE_DIR/$APP_NAME" "$SHARE_DIR/nvim"
fi

if [ -d "$STATE_DIR/$APP_NAME" ]; then
    echo "  Moving $STATE_DIR/$APP_NAME -> $STATE_DIR/nvim"
    mv "$STATE_DIR/$APP_NAME" "$STATE_DIR/nvim"
fi

if [ -d "$CACHE_DIR/$APP_NAME" ]; then
    echo "  Moving $CACHE_DIR/$APP_NAME -> $CACHE_DIR/nvim"
    mv "$CACHE_DIR/$APP_NAME" "$CACHE_DIR/nvim"
fi

echo ""
echo "========================================="
echo " Migration Completed Successfully!        "
echo "========================================="
echo "Next steps:"
echo "1. Remove any 'export NVIM_APPNAME=$APP_NAME' lines or aliases from your shell config (~/.zshrc, ~/.bashrc, etc.)."
echo "2. Run 'nvim' to test your configuration."
echo "========================================="

