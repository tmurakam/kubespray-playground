# -*- mode: ruby -*-
# vi: set ft=ruby :

MULTI_NODE = false
if ENV['MULTI_NODE'] == "true" then
  MULTI_NODE = true
end

Vagrant.configure("2") do |config|
  #config.vm.box = "generic/ubuntu2204"
  config.vm.box = "bento/ubuntu-24.04"
  #config.vm.box = "generic/rocky8"
  #config.vm.box = "generic/rocky9"
  
  config.ssh.insert_key = false

  #config.vm.provider :virtualbox do |vb|
  #  vb.memory = 4096
  #  vb.cpus = 2
  #end
  
  config.vm.provider :libvirt do |vb|
    vb.memory = 4096
    vb.cpus = 2
  end

  config.vm.define "node1" do |c|
    c.vm.hostname = "node1"
    c.vm.network "private_network", ip: "192.168.56.61"
  end

  if MULTI_NODE then
    config.vm.define "node2" do |c|
      c.vm.hostname = "node2"
      c.vm.network "private_network", ip: "192.168.56.62"
    end

    config.vm.define "node3" do |c|
      c.vm.hostname = "node3"
      c.vm.network "private_network", ip: "192.168.56.63"
    end
  end

  if Vagrant.has_plugin?("vagrant-proxyconf")
    config.proxy.enabled  = true
    config.proxy.http     = "#{ENV['http_proxy']}"
    config.proxy.https    = "#{ENV['https_proxy']}"
    #config.proxy.no_proxy = "#{ENV['no_proxy']}"
  end
end
