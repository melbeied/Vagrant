#!/usr/bin/env bash

# Install Docker on CentOS 7 

set -e # Exit if any subcommand fails
set -x # Print commands for troubleshooting

# 1. Install required packages.

sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

# 2. Set up the stable repository. 

sudo yum-config-manager --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo


# INSTALL DOCKER CE

# 1. Install the latest version of Docker CE

sudo yum install -y docker-ce

# 2. Start Docker. Report if it failed.

sudo systemctl start docker || sudo systemctl status docker.service

# 3. Verify that docker is installed correctly by running the hello-world image.

sudo docker run --rm hello-world

# Configure Docker to start on boot
sudo systemctl enable docker

# 4. Optional : Install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose