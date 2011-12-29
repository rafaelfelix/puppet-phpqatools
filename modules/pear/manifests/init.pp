class pear(
  $package = $pear::params::package
) inherits pear::params {

  # Install the PEAR package.
  package { $package:
    ensure => installed,
  }
}

