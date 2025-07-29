#!/bin/bash
set -ex
# Remove ansible 
sudo dnf erase -y ansible-core
# fix umask
sed -i 's/umask 077/umask 022/g' /etc/profile /etc/*rc
