# -*- mode: ruby -*-
# vi: set ft=ruby :
file_to_disk = "tmp/second_disk.vdi"

Vagrant.configure("2") do |config|
  # Base VM OS configuration.
  config.vm.box = "bento/centos-7.2"
  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.ssh.insert_key = false

  config.vm.provider :virtualbox do |v|
    v.memory = 256
    v.cpus = 1
  end

  # Define two VMs with static private IP addresses.
  boxes = [
    { 
      :name => "gluster1", 
      :ip => "192.168.29.2" 
    },
    { 
      :name => "gluster2", 
      :ip => "192.168.29.3" 
    },
    { 
      :name => "gluster3", 
      :ip => "192.168.29.4" 
    }
  ]

  # Provision each of the VMs.
  boxes.each do |opts|
    config.vm.define opts[:name] do |config|
#      config.proxy.http     = "http://172.17.172.72:3128"
#      config.proxy.https    = "http://172.17.172.72:3128"
#      config.proxy.no_proxy = "localhost,127.0.0.1"
      config.vm.hostname = opts[:name]
      config.vm.network :private_network, ip: opts[:ip]
      
      # Provision both VMs using Ansible after the last VM is booted.
      if opts[:name] == "gluster3"
        config.vm.provision "ansible" do |ansible|
          ansible.playbook = "playbooks/glustercftp.yml"
          ansible.inventory_path = "inventory"
          ansible.limit = "all"
        end
      end
    config.vm.provision :shell, path: "bootstrap-node.sh"
   end    
  end
end  
