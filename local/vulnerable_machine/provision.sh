# Docker
apt-get update && apt-get install  -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" && apt-get update
apt-get install -y docker-ce npm git python2 php python
# Right kernel version for privilege escalaiton
apt-get install -y linux-image-5.8.0-48-generic
apt-get -y purge 5.4.0-73-generic

# Adding focker to make it possible to esclate to root
groupadd docker
usermod -aG docker vagrant
newgrp docker 
