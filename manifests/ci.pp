yumrepo { "IUS":
	baseurl => "http://dl.iuscommunity.org/pub/ius/stable/Redhat/5/$architecture",
	descr => "IUS Community repository",
	enabled => 1,
	gpgcheck => 0
}

# PHP
package { "php53u-pear":
	ensure => present,
	require => Yumrepo["IUS"]
}

# PEAR Packages
package { "PEAR": 
	provider => "pear",
	require => Package["php53u-pear"]
}

package { "PHP_Depend":
	provider => "pear",
	source => "pear.pdepend.org/PHP_Depend-beta",
	ensure => installed,
	require => Package["PEAR"]
}

package { "PHP_PMD":
	provider => "pear",
	source => "pear.phpmd.org/PHP_PMD",
	ensure => installed,
	require => Package["PHP_Depend"]
}
