# glusterfs-pacemakerHA

Playbooks created to deploy Centos 7.2 on via Vagrant and Ansible

This playbook will create 3 node glusterfs with Active-passive clustering using pacemaker

gluster1
gluster2 ==> 3 node gluster ==> clustering (active-passive)
gluster3

Requirements:

Vagrant - 1.8.x
Vagrant plugins - vagrant-hostmanager
                - vagrant-vbguest
Ansible: 2.0.x
Virtualbox: latest
           
Ansible Modules used:
 - pcs_auth.py from https://github.com/styopa/ansible-pacemaker
 - pcs_resource.py from https://github.com/styopa/ansible-pacemaker




