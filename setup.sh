#!/bin/bash

echo "UPDATING PACKAGES"
sudo apt-get update

echo "INSTALLING DOCKER"
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

# echo "INSTALLING NODEJS"
# curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash 
# nvm install node 
# node -e "console.log('Running Node.js ' + process.version)"

echo "DOWNLOADING REPO"
git clone https://github.com/ericz1232/static-website.git &&
cd static-website &&
sudo docker build -t ericz99/static-website:latest . --no-cache &&
sudo docker run -d -p 80:8080 ericz99/static-website:latest
# private_ip=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)
# curl "http://$private_ip.com"
