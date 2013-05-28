##PHP Architect Vagrant demo

A demo project for PHP Architect using Virtual Box as the Provider and Bash as the Provisioner.

##Installation instructions

###Install dependancies
1. Download and Install Vagrant 1.2.2 http://downloads.vagrantup.com/tags/v1.2.2
2. Download and Install VirtualBox 4.2.12 https://www.virtualbox.org/wiki/Downloads. You can find older builds here https://www.virtualbox.org/wiki/Download_Old_Builds

###To run the project
1. Add 127.0.0.1 vagrant-host.example.com to your hosts file
2. Checkout the project and run it

~~~~
$ git clone http://www.github.com/jeremyquinton/php_architect_vagrant_demo
$ cd php_architect_vagrant_demo
$ vagrant up
~~~~

3. Once the vagrant up process is finished you should be able to browse to http://vagrant-host.example.com
