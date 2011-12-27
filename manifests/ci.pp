#include pear

yumrepo { "IUS":
	baseurl => "http://dl.iuscommunity.org/pub/ius/stable/Redhat/5/$architecture",
	descr => "IUS Community repository",
	enabled => 1,
	gpgcheck => 0
}

# PHP
package { "php53u-pear":
	ensure => present
}

# PEAR
package { "PEAR": 
	provider => "pear",
	require => Package["php53u-pear"]
}
package { "Console_Table": 
	provider => "pear"
}

package { "PHP_Depend":
	provider => "pear",
	source => "pear.pdepend.org/PHP_Depend-beta",
	ensure => installed
}

package { "PHP_PMD":
	provider => "pear",
	source => "pear.phpmd.org/PHP_PMD",
	ensure => installed,
	require => Package["PHP_Depend"]
}
