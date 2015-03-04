#!/bin/bash

sudo yum -y install ansible sshpass
cat <<- EOF > ~/.ansible.cfg
[defaults]
host_key_checking = False
EOF
git clone https://github.com/nzwulfin/ansible-atomic.git -b live 
cd ansible-atomic/
git fetch; git merge
ansible -i inventory all -m ping
