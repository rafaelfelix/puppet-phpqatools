## PHP Quality Tools
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

class php::qatools {
    
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

## Jenkins CI Server
class php::jenkins-ci inherits jenkins {

    package { "java-1.6.0-openjdk":
    	ensure => installed
    }
    
    # Jenkins plugins
    install-jenkins-plugin {
    	"git-plugin" :
    		name => "git";
    }
    
    install-jenkins-plugin {
    	"checkstyle" :
    		name => "checkstyle";
    }
    
    install-jenkins-plugin {
    	"cobertura" :
    		name => "cobertura";
    }
    
    install-jenkins-plugin {
        "cloverphp" :
            name => "cloverphp";
    }
    
    install-jenkins-plugin {
        "dry" :
            name => "dry";
    }
    
    install-jenkins-plugin {
        "htmlpublisher" :
            name => "htmlpublisher";
    }
    
    install-jenkins-plugin {
        "jdepend" :
            name => "jdepend";
    }
    
    install-jenkins-plugin {
        "plot" :
            name => "plot";
    }
    
    install-jenkins-plugin {
        "pmd" :
            name => "pmd";
    }
    
    install-jenkins-plugin {
        "violations" :
            name => "violations";
    }
    
    install-jenkins-plugin {
        "xunit" :
            name => "xunit";
    }
}

include php::qatools
include php::jenkins-ci

Class["php::qatools"] -> Class["php::jenkins-ci"]