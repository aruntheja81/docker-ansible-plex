FROM ubuntu:14.04

MAINTAINER Larry Smith Jr. <mrlesmithjr@gmail.com>

# Update apt-cache
RUN apt-get update

# Install Ansible
RUN apt-get -y install git software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    apt-get update && \
    apt-get -y install ansible

# Copy Ansible Playbook
COPY playbook.yml /playbook.yml

# Run Ansible playbook
RUN ansible-playbook -i "localhost," -c local /playbook.yml

# Cleanup
RUN apt-get -y clean && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Setup volumes for exposing to your host
VOLUME [ "/var/lib/plexmediaserver","/movies","/music","/pictures","/tv_shows","/videos"]

#Mappings and ports
EXPOSE 32400 32400/udp 32469 32469/udp 5353/udp 1900/udp

# Copy Startup Script
COPY start.sh /start.sh
RUN chmod +x /start.sh

USER plex

CMD ["/start.sh"]
