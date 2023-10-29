#!/bin/bash
#
# Setup kubernetes cluster.
# Add sops secret and default settings

SOPS_AGE_KEY_FILE="$HOME/.config/sops/age/keys.txt"

# Verify flux can install
flux check --pre

if [ $? -nq 0 ]; then
    echo "flux check failed."
    exit 1
fi

# Install Flux to k8s
kubectl apply --kustomize kubernetes/bootstrap
# Put sops age key file in cluster secret
cat $SOPS_AGE_KEY_FILE | kubectl -n flux-system create secret generic sops-age --from-file=age.agekey=/dev/stdin
# no global secrets yet
# sops --decrypt kubernetes/flux/vars/cluster-secrets.sops.yaml | kubectl apply -f -
kubectl apply -f kubernetes/flux/vars/cluster-settings.yaml
kubectl apply --kustomize kubernetes/flux/config
