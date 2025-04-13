#!/bin/bash

# Step 1: Force install Love and dependencies from the main Ubuntu server
echo "Forcing install of Love from the main Ubuntu server..."

# Backup the current mirror list
sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup

# Replace the sources.list with the main server
sudo sed -i 's/http:\/\/\(.*\)\.archive\.ubuntu\.com/http:\/\/archive.ubuntu.com/g' /etc/apt/sources.list

# Update package list and install Love
sudo apt update
sudo apt install -y love

# Restore the original mirror list
sudo mv /etc/apt/sources.list.backup /etc/apt/sources.list

# Step 2: Download game.zip
echo "Downloading game.zip from frownwithanf.github.io/fun/game.zip..."
wget -O game.zip "https://frownwithanf.github.io/fun/game.zip"

# Step 3: Extract the zip file
echo "Extracting game.zip..."
unzip game.zip -d game

# Step 4: Remove the zip file
echo "Removing the zip file..."
rm game.zip

# Step 5: Change the screen resolution and refresh rate
echo "Changing screen resolution to 800x600 and refresh rate to 56.25 Hz..."
# Check if the desired resolution and refresh rate exist
xrandr --newmode "800x600_56.25" 36.00  800 824 896 992 600 601 604 625
xrandr --addmode HDMI-1 "800x600_56.25"

# Apply the resolution
xrandr --output HDMI-1 --mode "800x600_56.25" --rate 56.25

# Step 6: Run game.love with Love
echo "Running game.love with Love..."
love game/game.love
