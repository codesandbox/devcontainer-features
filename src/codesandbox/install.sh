#!/bin/sh

DOCKER_VERSION=23.0.1

if [ "${TARGETARCH}" = "arm64" ]; then
    DOCKER_DOWNLOAD_ARCH="aarch64"
else
    DOCKER_DOWNLOAD_ARCH="x86_64"
fi

mkdir -p /tmp/devcontainer-install/
cd /tmp/devcontainer-install/

# Download docker cli and install
# curl -fsSL https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz -o get-docker.sh
curl -fsSL https://download.docker.com/linux/static/stable/${DOCKER_DOWNLOAD_ARCH}/docker-${DOCKER_VERSION}.tgz -o docker.tgz
tar xzvf docker.tgz
cp docker/docker /usr/local/bin
rm -rf docker docker.tgz


# Install docker-compose cli plugin
curl -fsSL https://github.com/docker/compose/releases/download/v2.16.0/docker-compose-linux-${DOCKER_DOWNLOAD_ARCH} -o docker-compose
chmod +x docker-compose
mkdir -p /usr/local/lib/docker/cli-plugins/
mv docker-compose /usr/local/lib/docker/cli-plugins/docker-compose

# Install devtools
apt update
apt install -y \
    curl \
    git \
    htop \
    less \
    locales \
    lsof \
    mc \
    nano \
    ncdu \
    vim \
    wget \
    zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh --shell /bin/zsh root

cd /
rm -rf /tmp/devcontainer-install/
