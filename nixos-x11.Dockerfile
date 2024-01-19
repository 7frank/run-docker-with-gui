# Use a base image with Nix installed
FROM nixos/nix

# Update Nix packages and install necessary packages
RUN nix-channel --update \
    && nix-env -iA \
        # Core Usage
        nixpkgs.git \
        nixpkgs.vim \
        nixpkgs.htop \
        # For x11docker / X11 Support
        nixpkgs.xorg.xorgserver \
        nixpkgs.xorg.xf86inputevdev \
        nixpkgs.xorg.xf86inputsynaptics \
        nixpkgs.xorg.xf86inputlibinput \
        nixpkgs.xorg.xf86videointel \
        nixpkgs.xorg.xf86videoati \
        nixpkgs.xorg.xf86videonouveau \
        # Desktop Environment
        nixpkgs.gnused \
        nixpkgs.dbus \
        nixpkgs.xfce.xfce4-panel \
        nixpkgs.xfce.xfce4-session \
        nixpkgs.xfce.xfce4-settings \
        # User-Level Applications
        nixpkgs.firefox

# Set up the DISPLAY environment variable
ENV DISPLAY=:0

RUN dbus-uuidgen > /etc/machine-id

# Set the default command to start XFCE
CMD ["startxfce4"]
