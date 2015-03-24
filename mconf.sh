#!/bin/bash

sudo yum -y install ansible sshpass git
cat <<- EOF > ~/.ansible.cfg
[defaults]
host_key_checking = False
[ssh_connection]
#ssh_args = -o ControlMaster=auto -o ControlPersist=60s
#ssh_args = 
pipelining = True
EOF
git clone https://github.com/nzwulfin/ansible-atomic.git -b f22
cd ansible-atomic/
git fetch; git merge
ansible -i inventory all -m ping -k
