#!/bin/bash
apt-get update
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    zip \
    unzip \
    wget \
    dnsutils


# install docker cli
if [[ $(uname -m) == "arm64" || $(uname -m) == "aarch64" ]]; then
    wget --no-check-certificate "https://download.docker.com/linux/ubuntu/dists/focal/pool/stable/arm64/docker-ce-cli_20.10.17~3-0~ubuntu-focal_arm64.deb"
    dpkg -i "docker-ce-cli_20.10.17~3-0~ubuntu-focal_arm64.deb"
else
    wget --no-check-certificate "https://download.docker.com/linux/ubuntu/dists/focal/pool/stable/amd64/docker-ce-cli_20.10.17~3-0~ubuntu-focal_amd64.deb"
    dpkg -i "docker-ce-cli_20.10.17~3-0~ubuntu-focal_amd64.deb"
fi
nslookup DOCKER_HOST
nslookup docker
export DOCKER_HOST=tcp://172.17.0.1:2375
docker info
# install aws cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip
./aws/install
aws --version
aws sts get-caller-identity