# Thousand sunny

## Features

- [SOPS](https://github.com/mozilla/sops) secrets stored in Git

## Usage

Setup and usage is inspired heavily by [this homelab gitops template](https://github.com/onedr0p/flux-cluster-template) and the [k8s-at-home](https://github.com/k8s-at-home) community.

### Install

- [kubectl](https://kubernetes.io/docs/reference/kubectl/)
- [age](https://github.com/FiloSottile/age).
- [flux](https://fluxcd.io/flux/installation/#install-the-flux-cli)

### Setup

```sh
./scripts/setup-age.sh
```
