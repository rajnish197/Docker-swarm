#!/bin/bash
vim /etc/hosts
132.92.41.4    manager
132.92.41.5    worker01
ping -c 3 manager
ping -c 3 worker01
sudo apt install apt-transport-https software-properties-common ca-certificates -y
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable" > /etc/apt/sources.list.d/docker-ce.list
sudo apt update
sudo apt install docker-ce -y
systemctl start docker
systemctl enable docker
useradd -m -s /bin/bash rajnish
sudo usermod -aG docker rajnish
su - rajnish
docker run hello-world
docker swarm init --advertise-addr 132.92.41.4
