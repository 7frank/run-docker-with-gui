#!/bin/sh

# Setup Nix environment
nix-channel --add https://nixos.org/channels/nixos-20.03 nixos
nix-channel --update

# Install and configure XRDP and dependencies
# nix-env -iA nixos.xrdp
nix-env -iA nixos.xorg.xserver
nix-env -iA nixos.sddm
nix-env -iA nixos.plasma5

# Configure the XRDP service
echo "
services.xserver.enable = true;
services.xserver.displayManager.sddm.enable = true;
services.xserver.desktopManager.plasma5.enable = true;

services.xrdp.enable = true;
services.xrdp.defaultWindowManager = \"startplasma-x11\";
services.xrdp.openFirewall = true;
" > /etc/nixos/configuration.nix

# Rebuild NixOS configuration
nixos-rebuild switch

# Start the XRDP service
/etc/init.d/xrdp start

# Keep the container running
tail -f /dev/null
