# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box_check_update = false

  config.vm.define "deliver-it-master" do |deliver|
    deliver.vm.box = "ubuntu/trusty64"
    deliver.vm.box_url = "https://atlas.hashicorp.com/ubuntu/boxes/trusty64"
    deliver.vm.hostname = "vagrant-deliver-it-master.vm"
    deliver.vm.network "private_network", ip:"192.168.56.104" #, virtualbox__intnet:true
    deliver.vm.synced_folder "./", "/vagrant", disabled:false
    deliver.vm.provider "virtualbox" do |vb|
      vb.name = "vagrant-deliver-it-master"
      vb.cpus = 2
      vb.memory = 4*1024
    end
  end

  config.vm.define "deliver-it-slave" do |deliver|
    deliver.vm.box = "centos/7"
    deliver.vm.box_url = "https://atlas.hashicorp.com/centos/boxes/7"
    deliver.vm.hostname = "vagrant-deliver-it-slave.vm"
    deliver.vm.network "private_network", ip:"192.168.56.105" #, virtualbox__intnet:true
    deliver.vm.synced_folder "./", "/vagrant", disabled:false
    deliver.vm.provider "virtualbox" do |vb|
      vb.name = "vagrant-deliver-it-slave"
      vb.cpus = 1
      vb.memory = 2*1024
    end
    deliver.vm.provision :ansible do |ansible|
      ansible.inventory_path = "inventory.ini"
      ansible.playbook = "site.yml"
      ansible.extra_vars = { user:"vagrant", proxy:"no", proxy_mock:"no", __proxy_host:"192.168.56.104" }
      ansible.sudo = true
      ansible.limit = 'all'
      ansible.verbose = 'vv'
    end
  end

end
