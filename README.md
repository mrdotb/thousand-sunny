# Thousand sunny
![thousand sunny logo](https://raw.githubusercontent.com/mrdotb/i/master/thousand-sunny.png)

## Features

- [SOPS](https://github.com/mozilla/sops) secrets stored in Git

## Usage

Setup and usage is inspired heavily by [this homelab gitops template](https://github.com/onedr0p/flux-cluster-template) and the [k8s-at-home](https://github.com/k8s-at-home) community.

### Requirements

- [asdf](https://asdf-vm.com/)
- [kubectl](https://kubernetes.io/docs/reference/kubectl/)
- [age](https://github.com/FiloSottile/age).
- [flux](https://fluxcd.io/flux/installation/#install-the-flux-cli)

### Setup

```sh
asdf install
pip3 install -r requirements.txt
./scripts/setup-age.sh
./scripts/install.sh
```

### Lint

```sh
./scripts/lint.sh
```
