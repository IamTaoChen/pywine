#!/bin/bash

# Set the git version to install
GIT_VERSION=2.45.2

# download the git installer
curl -Lo git-installer.exe https://github.com/git-for-windows/git/releases/download/v${GIT_VERSION}.windows.1/Git-${GIT_VERSION}-64-bit.exe

# use xvfb to run the installer, use a background process to avoid blocking the script
xvfb-run -a wine git-installer.exe /SILENT /NORESTART &

# wait for the installation to complete
echo "Waiting 60s for Git installation to complete..."
sleep 60

# kill all wine processes
echo "killing all wine processes..."
wineserver -k

# echo the git version
wine git --version

# rm the installer
rm git-installer.exe
