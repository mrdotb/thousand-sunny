<div align="center">

<img src="https://raw.githubusercontent.com/mrdotb/i/master/thousand-sunny.png" align="center" width="144px" height="144px" />

# Thousand sunny my operations repository
_... managed with Flux, Renovate, and GitHub Actions_ 🤖
<br />

</div>

[![Kubernetes](https://img.shields.io/badge/v1.28-blue?style=for-the-badge&logo=kubernetes&logoColor=white)](https://k3s.io/)&nbsp;&nbsp;&nbsp;

---

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

yaml is linted with [yamllint](https://github.com/adrienverge/yamllint) on `pre-commit`

### Dev

I use [kind](https://kind.sigs.k8s.io/)
Install the git hook with [lefthook](https://github.com/evilmartians/lefthook/tree/master)
