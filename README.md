PHP QA Tools
=============

PHP QA Tools enables provisioning most of the quality tools for PHP using Puppet. Refer to http://phpqatools.org for me information.

This project also provides a Vagrantfile (see: http://vagrantup.com), so you can test the provisioning scripts from scratch in your own machine. 

Dependencies
------------

- Ruby (tested against 1.8 version)
- Rubygems
- Puppet (>= 2.6)
- Virtualbox (>= 4.1)
- Vagrant (`gem install vagrant`)

REMEMBER: You don't actually need vagrant and virtualbox, but they're very handy tools to make a quick test on your own machine before committing, and risking to break the build due to environment issues. 

Tools
-----

Currently, the PHP QA Tools project is provisioning the following tools:

* PHP_PMD
* PDepend
* PHPCPD
* Phing
* PHPUnit
* PHPLOC
* PHPDCD
* PHP_CodeSniffer
* Bytekit

Installation
------------

From the command line:

    $ puppet-module install rafaelfc/phpqatools

It will download and install the latest release from the official Puppet Modules Repository, under the `phpqatools` directory.

Usage
-----

Inside of a puppet manifest file (let's call it `init.pp`):

```puppet
include phpqatools
```

Then:

	$ puppet apply init.pp
	
That should do the job.

Testing
_______

Just run the tests/init.pp on a sample machine to test the module.
Although you can use Vagrant to do the testing in a very simple way:

	$ vagrant up test

Known issues
------------

	These manifest script were written to cover only CentOS 5.7 and other Redhat-based distros (it's only tested against CentOS 5.7). I would really appreciate some help to make then become more platform-indepent.


Contributing
------------

Want to contribute?

- Fork me on github! 
- Pull requests are very welcome!
- Submit any issue you might eventually find
