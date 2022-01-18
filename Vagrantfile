# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.hostname = "testRampUp"
  config.vm.network "forwarded_port", guest: 80, host: 8080 # the request by port 8080, redirect to 80 in vm
  config.vm.network "public_network", ip:"192.168.100.20"   # DCHP ip by bridge


  # Configuration of VM
    config.vm.provider ("virtualbox") do |vb|
      vb.name ="testvb"  # change name of VM on Virtualbox.
      vb.memory = 512
      vb.cpus = 2
      #vb.gui = true     # enable GUI VM
    end

  # Provisioning

    config.vm.provision "shell", path: "provision.sh"
    #config.vm.provision "file", source: "../devops-rampup", destination "/home/vagrant/devops-rampup"
    
    end


