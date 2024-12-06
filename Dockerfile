FROM ubuntu:latest

# Install TFTP server and dependencies
RUN apt-get update && \
    apt-get install -y tftpd-hpa && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Configure TFTP server
RUN mkdir -p /var/tftpboot && chmod 777 /var/tftpboot

# Copy default TFTP configuration (if needed)
COPY tftpd-hpa.conf /etc/default/tftpd-hpa

# Set entry point
CMD ["/usr/sbin/in.tftpd", "--foreground", "--create", "--secure", "/var/tftpboot"]
