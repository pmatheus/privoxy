#!/bin/bash
sudo apt update
sudo apt install -y docker.io
sudo usermod -a -G docker $USER
sudo cp ./changeip /usr/local/bin/changeip
sudo chmod +x /usr/local/bin/changeip
sudo docker build -t torproxy .
sudo docker run --restart unless-stopped -d -p 8118:8118 -p 9050:9050 torproxy
