# Use the official Arch Linux base image
FROM archlinux:base

# Update and upgrade the system
RUN pacman -Syu --noconfirm

# Install XFCE and X11-related packages
RUN pacman -S --noconfirm \
    xorg-server \
    xorg-xinit \
    xfce4 \
    xfce4-goodies

# Additional setup commands go here
RUN pacman -S --noconfirm \
    firefox 


# Set the default command to start XFCE
CMD ["startxfce4"]
