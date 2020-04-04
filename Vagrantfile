Vagrant.configure("2") do |config|
  config.vm.define "centos-inst1-192.168.0.100"
  config.vm.box = "centos/7"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network :private_network, ip: "192.168.0.100"

  
  config.vm.provider "virtualbox" do |v|
    v.cpus = 4
    v.memory = 4096
  end
  config.vm.provision "shell", inline: <<-SHELL
  		### disable seLinux 	
  		setenforce 0
  		sed -i 's/SELINUX=\(enforcing\|permissive\)/SELINUX=disabled/g' /etc/selinux/config
  SHELL

  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vm.provision "shell", path: "./ext/ansible.sh"
  config.vm.provision "shell", path: "./ext/docker.sh"
end
