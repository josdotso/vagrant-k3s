#!/usr/bin/env bash

## Enable strict bash settings.
set -euo pipefail

## Update apt cache.
apt update

## Install tools.
apt install -y curl

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
echo More info: https://github.com/josdotso/vagrant-k3s
echo
echo To see if pods have come up, run the following command.
echo
echo 'export KUBECONFIG="$(pwd)/kubeconfig" && kubectl get pods --all-namespaces'
