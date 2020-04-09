# Monter une VM Linux avec provisionning Ansible et Docker
## But

Monter une machine virtuelle avec OS Linuxn pré-provisionnée avec Ansible Ansible et Docker.

## Vagrant
Vagrant est un outil permettant la construction et la gestion des machines virtuelles, c'est  un moyen efficient pour automatiser le montage des environnements spécifiques à l'utilisation d'un ou plusieurs developpeurs, testeurs, administrateurs, etc.

le fichier central de vagrant est Vagrantfile qui support une synthaxe Ruby.

## Coonfiguration

Sur cet exemple plusieurs variables environnementaux sont externalisés sur le fichier vargant.yml, par exemple :
- nom de la machine
- l'adresse ip à attribuer dans le réseau local
- nom de la box
- mode d'installation de docker : (cela par par le paramétre )
    * en mode shell : en se basant sur ext/ansible.sh
    * en mode ansible : en se basant sur le fichier : ext/playbook.yml

            ```
                ip_address: 192.168.0.100
                box_name : centos/7
                vm_name: inst1-P3-centos7
                server_domain: projet3.dev
                host_name: volubilis
                user: vagrant
                ansible-mode: yes    # <<==== no for default mose : shell
            ```
çela augmente l'intérêt de réutilisation du même travail avec moins de modification utilisateur 

## Exécution

    ```shell 
    $ vagrant up --provision
    ```

## Test

Accés à la machine en ssh

    ```shell 

    $ vagrant ssh

    ```
Une fois vous avez le prompt, passer les deux commandes suivantes :

- Pour vérifier la version installée d'Ansible

    ```shell 
    
    $ ansible --version

    ```

- Pour vérifier la version installé de Docker

```shell 
 
 $ docker --version
 
 ```
    or

```shell 
 
 $ docker info
 
```