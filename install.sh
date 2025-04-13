#!/bin/bash

# Step 1: Install the latest version of Love
echo "Installing the latest version of Love..."
sudo apt update
sudo apt install -y love

# Step 2: Download game.zip
echo "Downloading game.zip from frownwithanf.github.io/fun/game.zip..."
wget -O game.zip "https://frownwithanf.github.io/fun/game.zip"

# Step 3: Extract the zip file
echo "Extracting game.zip..."
unzip game.zip -d game

# Step 4: Remove the zip file
echo "Removing the zip file..."
rm game.zip

# Step 5: Run game.love with Love
echo "Running game.love with Love..."
love game/game.love
