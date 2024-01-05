# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Set the Box to Ubuntu-22.04
  config.vm.box = "bento/ubuntu-22.04"
  # Set fixed private IP for the machine
  config.vm.network "private_network", ip: "192.168.56.10"
  # Configure the public network
  config.vm.network "public_network"
  # Configure the VirtualBox vm provider
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.cpus = 1
    vb.memory = "1024"
  end
  # Configure the Ansible provisioner
  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "provisioning/playbook.yml"
    ansible.compatibility_mode = "2.0"
  end
end
