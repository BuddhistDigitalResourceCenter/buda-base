# buda-base
Base platform for BUDA development

The base platform is built using Vagrant and VirtualBox.

1) Install [Vagrant](https://www.vagrantup.com/downloads.html) and [VirtualBox](https://www.virtualbox.org/wiki/Downloads). 

2) [Download](https://github.com/BuddhistDigitalResourceCenter/buda-base/archive/master.zip) or 
    
    git clone

this repository.

3) cd into the project

4) and run the command:

    vagrant up

This will grind awhile installing the following:

* Ubuntu 14.04 LTS
* Oracle JDK 8
* couchdb and its dependencies
* node.js
* tomcat
* RabbitMQ.

Once the initial install has completed the command:

    vagrant ssh
will connect to the instance where development, customization of the environment and so on can be performed as for any headless server. The command:

    vagrant halt
will shut the instance down, and

    vagrant destroy
will completely remove the instance. After halting (or suspending the instance) a further:

    vagrant up
will simply boot the instance without further downloads.
