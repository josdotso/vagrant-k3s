#!/bin/bash

## Enable strict bash settings.
set -euo pipefail

## Update apt cache.
apt update

## Install generic apt packages.
apt install -y apt-transport-https ca-certificates curl \
  software-properties-common

## Add apt key for Google's apt packages.
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg \
  | apt-key add -

## Add Kubernetes apt repo to apt sources list.
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" \
  | sudo tee /etc/apt/sources.list.d/kubernetes.list

## Update apt cache.
apt update

## Install kubectl apt package.
apt install -y kubectl

## Install k3s.
curl -sfL https://get.k3s.io -o install-k3s.sh
chmod 0755 install-k3s.sh
./install-k3s.sh

## Copy k3s KUBECONFIG to /vagrant.
##
## This allows users to use k3s from outside this VM.
cp /etc/rancher/k3s/k3s.yaml /vagrant/kubeconfig

echo OK
echo
echo Project Home: https://github.com/josdotso/vagrant-k3s
echo
echo Start using k3s by running the following commands.
echo
echo '$ export KUBECONFIG="$(pwd)/kubeconfig" && kubectl get pods --all-namespaces'
