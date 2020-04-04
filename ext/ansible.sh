#!/usr/bin/env bash
    
	## update ansible repo configuration
	sudo yum -y update
	yum install -y software-properties-common
	sudo yum -y install epel-repo
	
	### install ansible 	
	sudo yum -y install ansible
	