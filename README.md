# Creating an Atomic fleet using Ansible

This is a blunt stick to create a set of Atomic hosts in a Kubernetes cluster from a Fedora 21 Server using Ansible.  Docker is configured to use Flannel for container networking.  I started with the eparis ansible kubernetes repo [https://github.com/eparis/kubernetes-ansible] as an example and there are some remnants of that code.  I expect to change / remove most of that in the near future.  

Right now, I've used this for testing in a local KVM (virt-manager) environment and in EC2.

This is a high level (and poor) diagram of the components.
!(network_diagram.png)

## To use this playbook:

* Build an F21 Server, update it, create an ssh key, and install git and ansible
* Create the Atomic hosts, set up the fedora user with the ssh key
* Modify the inventory to reflect the IPs of the environment, master and etcd are the F21 server
* Update the group_vars/all.yml to reflect any needed changes
* Run 'ansible -i inventory all -m ping' to make sure ansible can ssh to all the systems
* Run the playbook
* Run 'kubectl get minions'
* ???
* Profit!

At this point you can clone the Kubernetes git repo and run the playbook examples.

## TODO:

* Make the firewall detection stuff work
* Assumes that masters are F21 and minions are Atomic, add OS detection to make cleaner
* Only 3 roles, could there be a better split (move updates to common?)
* Add CentOS, RHEL support cleanly
