# Use Kali Linux as the base image
FROM kalilinux/kali-rolling

# Install Xfce desktop and other utilities
RUN apt-get update && apt-get install -y \
    xfce4 \
    xfce4-goodies \
    xorg \
    dbus-x11 \
    x11-xserver-utils \
    && rm -rf /var/lib/apt/lists/*

# Install your preferred applications
RUN apt-get update && apt-get install -y \
    firefox-esr 

# Install actual kali tools
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    kali-linux-default
    

# Set the default command to run
CMD ["startxfce4"]
