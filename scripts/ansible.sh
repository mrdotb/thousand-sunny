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

list() {
  ansible all -i "$ANSIBLE_INVENTORY_DIR/hosts.yaml" --list-hosts
}

ping() {
  ansible all -i "${ANSIBLE_INVENTORY_DIR}/hosts.yaml" --one-line -m 'ping'
}

setup() {
  ansible-playbook -i "$ANSIBLE_INVENTORY_DIR/hosts.yaml" "$ANSIBLE_PLAYBOOK_DIR/setup.yaml"
}

kubernetes() {
  ansible-playbook -i "$ANSIBLE_INVENTORY_DIR/hosts.yaml" "$ANSIBLE_PLAYBOOK_DIR/kubernetes.yaml"
}

status() {
  ansible-playbook -i "$ANSIBLE_INVENTORY_DIR/hosts.yaml" "$ANSIBLE_PLAYBOOK_DIR/status.yaml"
}

case "$1" in
  init)
    init
    ;;
  list)
    list
    ;;
  setup)
    setup
    ;;
  kubernetes)
    kubernetes
    ;;
  status)
    status
    ;;
  ping)
    ping
    ;;
  reboot)
    reboot
    ;;
  update|upgrade)
    update_deps
    ;;
  *)
    echo "Usage: $0 {init|list|setup|kubernetes|status|ping|reboot|update|upgrade}"
    exit 1
esac
