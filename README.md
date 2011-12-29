PHP Jenkins Server
=============

PHP Jenkins Server is a very simple project, which aims to provide a puppet manifest to provision a CI (Continuous Integration) Server with PHP-specific tools for measuring the quality of the code (see: http://phpqatools.org).

This project also provides a Vagrantfile (see: http://vagrantup.com), so you can test the provisioning scripts from scratch in your own machine. 

Dependencies
-------

- Ruby (tested against 1.8 version)
- Rubygems
- Puppet (>= 2.6)
- Virtualbox (>= 4.1)
- Vagrant (`gem install vagrant`)

REMEMBER: You don't actually need vagrant and virtualbox, but they're very handy tools to make a quick test on your own machine before committing, and risking to break the build due to environment issues. 

Tools
-------

Currently, the PHP Jenkins Server project is provisioning the following phpqa tools:

* PHP_PMD
* PDepend
* PHPCPD
* Phing
* PHPUnit
* PHPLOC
* PHPDCD
* PHP_CodeSniffer
* Bytekit

Known issues
------------

These manifest script were written to cover only CentOS 5.7. I would really appreciate some help to make then become more platform-indepent.

Usage
-----

Provisioning a VM using Vagrant:

    vagrant up ci_server

Or, provisioning any other kind of machine (from the project root dir):

    puppet apply manifests/ci.pp --modulepath modules/

Contributing
------------

Want to contribute? 

- Fork me on github! 
- Pull requests are very welcome!
- Submit any issue you might eventually find
