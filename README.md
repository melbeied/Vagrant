# Monter une VM Linux avec provisionning Ansible et Docker

## But

Monter une machine virtuelle avec OS Linuxn pré-provisionnée avec Ansible Ansible et Docker.

## Vagrant
Vagrant est un outil permettant la construction et la gestion des machines virtuelles, c'est  un moyen efficient pour automatiser le montage des environnements spécifiques à l'utilisation d'un ou plusieurs developpeurs, testeurs, administrateurs, etc.

le fichier central de vagrant est Vagrantfile qui support une synthaxe Ruby.
## Pré-requis

Dans l'order :
- VirtualBos ou Vmware installé
- Vagrant installé

## Configuration

Sur cet exemple plusieurs variables environnementaux sont externalisés sur le fichier vargant.yml, de ces variables il y'a par exemple :

- nom de la machine
- l'adresse ip à attribuer dans le réseau local
- nom de la box
- mode d'installation de docker : (cela par le paramétre "ansible-mode")
    * en mode shell : en se basant sur le fichier ext/ansible.sh
    * en mode ansible : en se basant sur le fichier : ext/playbook.yml

```YAML
                ip_address: 192.168.0.100
                box_name : centos/7
                vm_name: inst1-P3-centos7
                server_domain: projet3.dev
                host_name: volubilis
                user: vagrant
                ansible-mode: yes    # <<==== no for default mode : shell
```
çela augmente l'intérêt de réutilisation du même travail avec moins de modification utilisateur 

## Exécution

```shell 
    $ vagrant up --provision
```

## Test

Accéder à la machine en ssh

```shell 
    $ vagrant ssh
```
Une fois vous avez le prompt sur le home de votre utilisateur vagrant, passer les deux commandes suivantes :

- Pour vérifier la version installée de Ansible

```shell 
    $ ansible --version
```

- Pour vérifier la version installée de Docker

```shell 
    $ docker --version
 ```
      ou

```shell  
    $ docker info
```