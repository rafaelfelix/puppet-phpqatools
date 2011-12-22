include pear

# If no version number is supplied, the latest stable release will be
# installed. In this case, upgrade PEAR to 1.9.2+ so it can use
# pear.drush.org without complaint.
pear::package { "PEAR": }
pear::package { "Console_Table": }

# Version numbers are supported.
pear::package { "drush":
  version => "4.5.0",
  repository => "pear.drush.org",
}
