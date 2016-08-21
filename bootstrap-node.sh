rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm

# configure hosts file for our internal network defined by Vagrantfile
cat >> /etc/hosts <<EOL

# vagrant environment nodes
192.168.29.2  gluster1
192.168.29.3  gluster2
192.168.29.4  gluster3


#Configuring Gluster repository
yum -y install centos-release-gluster

#Installing GlusterFS
yum -y install glusterfs-server

#enabling GlusterFS daemon to start
systemctl enable glusterd.service
systemctl start glusterd.service

