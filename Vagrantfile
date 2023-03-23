# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "generic/ubuntu2204"
  config.ssh.insert_key = false

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
    vb.cpus = 2
  end

  config.vm.define "master" do |c|
    c.vm.hostname = "master"
    c.vm.network "private_network", ip: "192.168.56.61"
  end
  config.vm.define "worker" do |c|
    c.vm.hostname = "worker"
    c.vm.network "private_network", ip: "192.168.56.62"
  end
end
