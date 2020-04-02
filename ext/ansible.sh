#!/bin/sh
    ### disable seLinux 	
	setenforce 0
	sed -i 's/SELINUX=\(enforcing\|permissive\)/SELINUX=disabled/g' /etc/selinux/config
	
	## update ansible repo configuration
	sudo yum -y update
	yum install -y software-properties-common
	sudo yum -y install epel-repo
	
	### install ansible 	
	sudo yum -y install ansible
	