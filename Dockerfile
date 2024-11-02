FROM arm32v7/debian:latest

# Install necessary packages to run box86 script
RUN apt-get update && apt-get install -y wget gpg

# Script to add box86 repo
COPY add-repo.sh /usr/local/bin/add-repo.sh
RUN chmod +x /usr/local/bin/add-repo.sh
RUN /usr/local/bin/add-repo.sh

# Install all other necessary packages
RUN apt-get update && apt-get install -y \
    sudo \
    tigervnc-standalone-server \
    lxde-core \
    xfce4 \
    supervisor \
    box86-generic-arm \
    && rm -rf /var/lib/apt/lists/*

# Create user 'bjoern'
RUN useradd -m -d /home/bjoern -s /bin/bash bjoern && \
    echo 'bjoern ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Set the working directory
WORKDIR /home/bjoern

# Switch to user 'bjoern'
USER bjoern

# Set VNC password
RUN mkdir ~/.vnc && echo "mypassword" | vncpasswd -f > ~/.vnc/passwd

# Setup supervisor
RUN mkdir -p /home/bjoern/supervisor
COPY supervisord.conf /home/bjoern/supervisor/supervisord.conf
CMD ["/usr/bin/supervisord"]

# Configure VNC server
RUN echo ":1=bjoern" | sudo tee -a /etc/tigervnc/vncserver.users && \
    echo '$localhost = "no";' | sudo tee -a /etc/tigervnc/vncserver-config-defaults && \
    echo '$SecurityTypes = "VncAuth,Plain";' | sudo tee -a /etc/tigervnc/vncserver-config-defaults

# Run wine install script
COPY install-wine.sh /usr/local/bin/install-wine.sh
USER root
RUN chmod +x /usr/local/bin/install-wine.sh
RUN /usr/local/bin/install-wine.sh
USER bjoern

# Boot wine (make fresh wineprefix in ~/.wine )
# RUN wine wineboot

# Expose VNC port
EXPOSE 5901

# Start process manager
CMD ["/usr/bin/supervisord", "-n", "-c", "/home/bjoern/supervisor/supervisord.conf"]
