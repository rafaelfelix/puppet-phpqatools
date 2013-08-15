PHP QA Tools
=============

PHP QA Tools enables provisioning most of the quality tools for PHP using Puppet. Refer to http://phpqatools.org for more information.

Dependencies
------------

- Ruby (tested against 1.8 version)
- Rubygems
- Puppet (>= 2.6)
- vcsrepo (git/subversion/...) (if additional coding standard is need, https://github.com/puppetlabs/puppetlabs-vcsrepo)

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

    $ puppet module install rafaelfc/phpqatools

It will download and install the latest release from the official Puppet Modules Repository, under the `phpqatools` directory.
Watch for the dependency listed in the Modulefile (`rafaelfc/pear`), in case you run into `can't find class pear` errors.


Usage
-----

Inside of a puppet manifest file (let's call it init.pp):

    include phpqatools

Then:

    $ puppet apply init.pp

Using Hiera with additional coding standard:

    classes:
        - phpqatools
        - git
    phpqatools::standard_hash:
        '/usr/share/pear/PHP/CodeSniffer/Standards/Symfony2':
            ensure: latest
            provider: git
            source: 'git://github.com/opensky/Symfony2-coding-standard.git'
            revision: 'master'
	'/usr/share/pear/PHP/CodeSniffer/Standards/MyCompany':
	    ensure: latest
	    provider: git
	    source: 'git://github.com/MyCompany/coding-standard.git'
	    revision: 'master'
    phpqatools::default_standard: Symfony2

Known issues
------------

This module was written to cover only CentOS and Redhat distros (it's tested against CentOS 5.9 and CentOS 6.4). I would really appreciate some help to make it more platform-indepent.

Contributing
------------


Want to contribute?

* Fork me on github!
* Pull requests are very welcome!
* Submit any issue you might eventually find
