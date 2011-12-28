yumrepo { "IUS":
	baseurl => "http://dl.iuscommunity.org/pub/ius/stable/Redhat/5/$architecture",
	descr => "IUS Community repository",
	enabled => 1,
	gpgcheck => 0
}

## PHP Quality Tools

# PHP
package { "php53u-pear":
	ensure => present,
	require => Yumrepo["IUS"]
}

# PEAR Package
package { "PEAR": 
	provider => "pear",
	ensure => latest,
	require => Package["php53u-pear"]
}

# PHPUnit
package { "PHPUnit":
	provider => "pear",
	source => "pear.phpunit.de/PHPUnit",
	ensure => latest,
	require => Package["PEAR"]
}

# Pdepend
package { "PHP_Depend":
	provider => "pear",
	source => "pear.pdepend.org/PHP_Depend-beta",
	ensure => latest,
	require => Package["PEAR"]
}

# PHPMD
package { "PHP_PMD":
	provider => "pear",
	source => "pear.phpmd.org/PHP_PMD",
	ensure => latest,
	require => Package["PHP_Depend"]
}

# PHP CPD
package { "Base":
	provider => "pear",
	source => "components.ez.no/Base",
	ensure => latest,
	require => Package["PEAR"]
}

package { "ConsoleTools":
	provider => "pear",
	source => "components.ez.no/ConsoleTools",
	ensure => latest,
	require => Package["Base"]
}

package { "File_Iterator":
	provider => "pear",
	source => "pear.phpunit.de/File_Iterator",
	ensure => latest,
	require => Package["PEAR"]
}

package { "PHPCPD":
	provider => "pear",
	source => "pear.phpunit.de/phpcpd",
	ensure => latest,
	require => Package["Base"]
}

# PHPLOC
package { "PHPLOC":
	provider => "pear",
	source => "pear.phpunit.de/phploc",
	ensure => latest,
	require => Package["Base"]
}

# PHPDCD
package { "PHPDCD":
	provider => "pear",
	source => "pear.phpunit.de/phpdcd",
	ensure => latest,
	require => Package["Base"]
}

# PHP_CodeSniffer
package { "PHP_CodeSniffer":
	provider => "pear",
	source => "pear.php.net/PHP_CodeSniffer",
	ensure => latest,
	require => Package["PEAR"]
}

# Bytekit
package { "bytekit":
	provider => "pear",
	source => "pear.phpunit.de/bytekit",
	ensure => latest,
	require => Package["File_Iterator"]
}

# Phing
package { "Phing":
	provider => "pear",
	source => "pear.phing.info/phing",
	ensure => latest,
	require => Package["PEAR"]
}

## Jenkins CI Server

package { "java-1.6.0-openjdk":
	ensure => installed
}

include jenkins

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