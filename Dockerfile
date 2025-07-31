FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Install shellinabox and other tools
RUN apt-get update && \
    apt-get install -y shellinabox sudo curl net-tools vim openssh-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set root password to 'root'
RUN echo 'root:root' | chpasswd

# Expose shellinabox web terminal
EXPOSE 4200

# Run shellinabox in insecure mode (no SSL, for Render compatibility)
CMD ["/usr/bin/shellinaboxd", "-t", "--no-beep", "--disable-ssl", "-s", "/:LOGIN"]
