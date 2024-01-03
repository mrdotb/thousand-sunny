#!/bin/bash
#
# Wrapper around ansible commands

# Configuration
ANSIBLE_CONFIG="/home/john/Projects/thousand-sunny/ansible.cfg"
ANSIBLE_DIR="./provision/ansible"
ANSIBLE_PLAYBOOK_DIR="$ANSIBLE_DIR/playbooks"
ANSIBLE_INVENTORY_DIR="$ANSIBLE_DIR/inventory"

init() {
  ansible-galaxy install -r "$ANSIBLE_DIR/requirements.yaml" -f
}

setup() {
  ansible-playbook -i "$ANSIBLE_INVENTORY_DIR/hosts.yaml" "$ANSIBLE_PLAYBOOK_DIR/setup.yaml"
}

list() {
  ansible \
    --ask-become-pass \
    all -i "$ANSIBLE_INVENTORY_DIR/hosts.yaml" --list-hosts \
    --extra-vars "$(sops --decrypt provision/ansible/vars.sops.env)"
}

ping() {
  ansible \
    --ask-become-pass \
    all -i "${ANSIBLE_INVENTORY_DIR}/hosts.yaml" --one-line -m 'ping' \
    --extra-vars "$(sops --decrypt provision/ansible/vars.sops.env)"
}

kubernetes() {
  ansible-playbook \
    --ask-become-pass \
    -i "$ANSIBLE_INVENTORY_DIR/hosts.yaml" "$ANSIBLE_PLAYBOOK_DIR/kubernetes.yaml" \
    --extra-vars "$(sops --decrypt provision/ansible/vars.sops.env)"
}

backup() {
  ansible-playbook \
    --ask-become-pass \
    -i "$ANSIBLE_INVENTORY_DIR/hosts.yaml" "$ANSIBLE_PLAYBOOK_DIR/backup.yaml" \
    --extra-vars "$(sops --decrypt provision/ansible/vars.sops.env)"
}

status() {
  ansible-playbook \
    --ask-become-pass \
    -i "$ANSIBLE_INVENTORY_DIR/hosts.yaml" "$ANSIBLE_PLAYBOOK_DIR/status.yaml" \
    --extra-vars "$(sops --decrypt provision/ansible/vars.sops.env)"
}

case "$1" in
  init)
    init
    ;;
  setup)
    setup
    ;;
  list)
    list
    ;;
  ping)
    ping
    ;;
  kubernetes)
    kubernetes
    ;;
  backup)
    backup
    ;;
  status)
    status
    ;;
  *)
    echo "Usage: $0 {init|list|setup|kubernetes|backup|status|ping}"
    exit 1
esac
