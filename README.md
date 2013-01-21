PHP QA Tools
=============

PHP QA Tools enables provisioning most of the quality tools for PHP using Puppet. Refer to http://phpqatools.org for more information.

Dependencies
------------

- Ruby (tested against 1.8 version)
- Rubygems
- Puppet (>= 2.6)

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
Watch for the dependency listed in the Modulefile (`rafaelfc/pear`), in case you run into `can't find class pear` errors.


