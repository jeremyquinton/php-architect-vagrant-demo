#!/bin/sh

#check if the epel package is present
rpm -qa | grep epel-release-6-5.noarch.rpm &> /dev/null
#if the exit status of the last command is not 0 download and install the epel package
if [ $? -ne 0 ]
then
    cd /tmp
	wget http://dl.iuscommunity.org/pub/ius/stable/CentOS/6/i386/epel-release-6-5.noarch.rpm
    rpm -Uvh epel-release-6-5.noarch.rpm
    rm -f epel-release-6-5.noarch.rpm
fi  

#check if the ius package is present 
rpm -qa | grep ius-release-1.0-11.ius.centos6.noarch &> /dev/null
#if the exit status of the last command is not 0 download and install the ius package
if [ $? -ne 0 ]
then
    cd /tmp
	wget http://dl.iuscommunity.org/pub/ius/stable/CentOS/6/i386/ius-release-1.0-11.ius.centos6.noarch.rpm
    rpm -Uvh ius-release-1.0-11.ius.centos6.noarch.rpm
    rm -f ius-release-1.0-11.ius.centos6.noarch.rpm
fi  

#Install the latest version of Apache 2 from the epel repository
yum -y install httpd
#Install the latest version of php 5.4 and Mysql 5.5 available from the IUS repository.
#The IUS Community Project is aimed at providing up to date and regularly maintained 
#RPM packages for the latest upstream versions of PHP and Mysql
yum -y install php54
yum -y install mysql55-server

#replace the default apache configuration
cp /vagrant/config/httpd.conf /etc/httpd/conf
#restart apache
service httpd restart
#replace the default iptables configuration so that port 80 is open
cp /vagrant/config/iptables /etc/sysconfig/iptables
service httpd restart
#the default virtual host in httpd.conf is vagrant-host.example.com
#add this to the hosts file
cat /etc/hosts | grep vagrant-host.example.com
if [ $? -ne 0 ]
then
	echo "127.0.0.1 vagrant-host.example.com" >> /etc/hosts
fi