require 'yaml'
settings = YAML.load_file('vagrant.yml')

Vagrant.configure("2") do |config|
  config.vm.define settings['vm_name']
  config.vm.box = settings['box_name']
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 22, host: 2222

  config.vm.network :private_network, ip: settings['ip_address']
  config.vm.synced_folder '.', '/vagrant', owner: "vagrant", group: "vagrant", disabled: false
  config.vm.host_name = settings['host_name']

  config.vm.provider "virtualbox" do |v|
    v.cpus = 4
    v.memory = 4096
  end
  config.vm.provision "shell", inline: <<-SHELL
                ### disable seLinux
                sed -i 's/SELINUX=\(enforcing\|permissive\)/SELINUX=disabled/g' /etc/selinux/config
  SHELL

 config.vm.provision "shell", path: "./ext/ansible.sh"
 if (settings['ansible-mode']=="no") then
	config.vm.provision "shell", path: "./ext/docker.sh"
 else
	config.vm.provision "ansible" do |ansible|
		ansible.playbook = "ext/playbook-docker.yml"
		#ansible.verbose = 'vvv'
		## For debugging
		# ansible.start_at_task = 'system'
		# ansible.start_at_task = 'latest node'
		# ansible.start_at_task = 'grunt'
   end
 end

end