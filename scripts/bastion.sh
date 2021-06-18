#!/bin/bash
# Author - Alexandre S. Cezar

# Installing kubectl
sudo apt-get update -y && sudo apt-get upgrade -y && \
sudo apt-get install -y apt-transport-https && \
sudo apt-get install -y nmap && \
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - && \
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list && \
sudo apt-get update -y && sudo apt-get install -y kubectl && sudo apt-get install -y mariadb-client