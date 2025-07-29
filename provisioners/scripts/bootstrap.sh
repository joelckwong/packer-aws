#!/bin/bash
set -ex
sudo dnf install -y ansible-core
ansible-galaxy collection install community.general
ansible-galaxy collection install ansible.posix
