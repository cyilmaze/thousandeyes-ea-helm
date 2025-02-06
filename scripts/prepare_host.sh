#!/bin/bash

# Prepare host for ThousandEyes BrowserBot Container
curl -Os https://downloads.thousandeyes.com/bbot/configure_docker.sh
chmod +x configure_docker.sh
sudo ./configure_docker.sh

# Kubernetes requires seccomp profiles files under directory /var/lib/kubelet/seccomp. Crete the seccomp directory.
sudo mkdir /var/lib/kubelet/seccomp
sudo cp /var/docker/configs/te-seccomp.json /var/lib/kubelet/seccomp/
