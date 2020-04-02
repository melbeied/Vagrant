Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.provision "shell" do |s|
    s.inline = "echo $1"
    s.args   = "'Bonjour Module3'"
  end
  
  #config.vm.provision "shell", inline 'sudo yum remove --auto-remove nano'
  #config.vm.provision "shell", inline 'sudo yum install nano'
  
  config.vm.provider "virtualbox" do |v|
    v.cpus = 4
    v.memory = 4096
  end
  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vm.provision "shell", path : "./ext/ansible.sh"
  
  config.vm.provision "shell", inline: <<-SHELL
	
    echo ******************************* install et provisioner Docker CE **********************
	sudo yum install -y yum-utils device-mapper-persistent-data lvm2
	sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
	sudo yum-config-manager --enable docker-ce-edge
	sudo yum-config-manager --enable docker-ce-test
	sudo yum install -y docker-ce docker-ce-cli containerd.io
	usermod -aG docker vagrant
	systemctl start docker
	systemctl enable docker
	echo ******************************* install de Docker Compose : Optional ******************
	sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose
	sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

	echo ******************************* install GIT  ******************************************
	sudo yum install -y git
  SHELL

  #config.vm.provision :docker
  #config.vm.provision :docker_compose
end
