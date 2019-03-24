# vagrant-k3s
[bento/ubuntu-18.04](https://app.vagrantup.com/bento/boxes/ubuntu-18.04) + [k3s](https://github.com/rancher/k3s) + minimal glue

## Getting Started

Start using [vagrant-k3s](https://github.com/josdotso/vagrant-k3s) by running the following commands.

```bash
git clone https://github.com/josdotso/vagrant-k3s.git

cd vagrant-k3s

vagrant up

export KUBECONFIG="$(pwd)/kubeconfig"

kubectl get pods --all-namespaces
```

## Prerequisites

Tools required to boot the VM and run `kubectl` commands against
from it from the host machine:

- kubectl
- vagrant
- virtualbox

Optional:

- make

## Factory Reset

**WARNING: Completely destroys the VM and all data therein.**

```bash
make reset
```
