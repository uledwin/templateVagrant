# -*- mode: ruby -*-
# vi: set ft=ruby :
### configuration parameters ###
# which host port to forward box SSH port to
  LOCAL_SSH_PORT = "2222"
# Vagrant base box to use
  BOX_BASE = "hashicorp/bionic64"
# amount of RAM for Vagrant box
  BOX_RAM_MB = "512"
# number of CPUs for Vagrant box
  BOX_CPU_COUNT = "1"
# name of vm1 nodo1 
  NAME_NODO1= "frontend"
  IP_NODO1="192.168.100.20"
# name of vm2 nodo2
  NAME_NODO2= "backend"
  IP_NODO2="192.168.100.21"
### /configuration parameters ###

Vagrant.configure("2") do |config|
  # Configuration of VM
  config.vm.provider ("virtualbox") do |vb1|
    vb1.name = "frontend"  # change name of VM on Virtualbox.
    vb1.memory = "512"
    vb1.cpus = "1"
    #vb.gui = true     # enable GUI VM
  end

  config.vm.define :nodo1 do |nodo1| 
    nodo1.vm.box = BOX_BASE
    nodo1.vm.box_version = "1.0.282"
    nodo1.vm.hostname = NAME_NODO1
    nodo1.vm.network "forwarded_port", guest: 80, host: 8080 # the request by port 8080, redirect to 80 in vm
    nodo1.vm.network "forwarded_port", guest: 3030, host: 3030 # the request by port 8080, redirect to 80 in vm
    nodo1.vm.network "public_network", ip:IP_NODO1   # DCHP ip by bridge
    # Provisioning
    nodo1.vm.provision "shell", path: "provision.sh"
    #config.vm.provision "file", source: "../devops-rampup", destination "/home/vagrant/devops-rampup"
  end

=begin  #################################
  #### Configuration of resources on VM 2 ######
  config.vm.provider ("virtualbox") do |vb2|
    vb2.name ="backend"  # change name of VM on Virtualbox.
    vb2.memory = "512"
    vb2.cpus = "1"
    #vb.gui = true     # enable GUI VM
  end

  #### Configuration VM 2 ######
  config.vm.define :nodo2 do |nodo2| 
    nodo2.vm.box = BOX_BASE
    nodo2.vm.box_version = "1.0.282"
    nodo2.vm.hostname = NAME_NODO2
    nodo2.vm.network "forwarded_port", guest: 90, host: 9090 # the request by port 8080, redirect to 80 in vm
    nodo2.vm.network "public_network", ip:IP_NODO2   # DCHP ip by bridge
    # Provisioning
    nodo2.vm.provision "shell", path: "provision.sh"  # If the configuration will be diferent, can create another .sh with instructions
    #config.vm.provision "file", source: "../devops-rampup", destination "/home/vagrant/devops-rampup"
  end
  #################################
=end  
end


