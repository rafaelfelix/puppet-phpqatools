# Class: phpqatools
#
# This module manages phpqatools
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class phpqatools {
	yumrepo { "IUS":
		baseurl => "http://dl.iuscommunity.org/pub/ius/stable/Redhat/5/$architecture",
		descr => "IUS Community repository",
		enabled => 1,
		gpgcheck => 0
	}
	    
	class { "pear":
		package => "php53u-pear",
		require => Yumrepo["IUS"],
	}
	
	# PEAR Package
    pear::package { "PEAR": }
    
    # PHPUnit
	pear::package { "PHPUnit":
		version => "latest",
		repository => "pear.phpunit.de",
		require => Pear::Package["PEAR"],
	}
    
    # Pdepend
    pear::package { "PHP_Depend":
		version => "beta",
		repository => "pear.pdepend.org",
		require => Pear::Package["PEAR"],
	}
    
    # PHPMD
    pear::package { "PHP_PMD":
		version => "latest",
		repository => "pear.phpmd.org",
		require => Pear::Package["PHP_Depend"],
	}
    
    # PHP CPD
    pear::package { "Base":
		version => "latest",
		repository => "components.ez.no",
		require => Pear::Package["PEAR"],
	}

    pear::package { "ConsoleTools":
		version => "latest",
		repository => "components.ez.no",
		require => Pear::Package["Base"],
	}

    pear::package { "File_Iterator":
		version => "latest",
		repository => "pear.phpunit.de",
		require => Pear::Package["PEAR"],
	}

    pear::package { "phpcpd":
		version => "latest",
		repository => "pear.phpunit.de",
		require => Pear::Package["Base"],
	}

    # PHPLOC
    pear::package { "phploc":
		version => "latest",
		repository => "pear.phpunit.de",
		require => Pear::Package["Base"],
	}

    # PHPDCD
    pear::package { "phpdcd":
		version => "latest",
		repository => "pear.phpunit.de",
		require => Pear::Package["Base"],
	}
    
    # PHP_CodeSniffer
    pear::package { "PHP_CodeSniffer":
		version => "latest",
		repository => "pear.php.net",
		require => Pear::Package["PEAR"],
	}
    
    # Bytekit
    pear::package { "bytekit":
		version => "latest",
		repository => "pear.phpunit.de",
		require => Pear::Package["File_Iterator"],
	}
    
    # Phing
    pear::package { "Phing":
		version => "latest",
		repository => "pear.phing.info",
		require => Pear::Package["PEAR"],
	}
}
