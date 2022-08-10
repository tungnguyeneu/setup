#!/usr/bin/env bash

# update
sudo apt -y update && sudo apt -y upgrade

# Install ansible
sudo apt -y install ansible

# Generate ssh key if not exists
if test -f ~/.ssh/id_ed25519; then
    echo "Ssh key is already genrated."
else
    ssh-keygen -t ed25519 -C "ntt188@gmail.com"
fi

# Show ssh key
cat ~/.ssh/id_ed25519.pub
read -p "Please add ssh key to Github, then press enter to continue."

# Clone playbook repository
cd
git clone git@github.com:tungnguyeneu/ansible-playbooks.git
ansible-playbook ansible-playbooks/wsl_ubuntu/playbook.yaml