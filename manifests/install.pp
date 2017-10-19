# == Class: tlp::install
#
# This class installs tlp
#
class tlp::install
(
    $ensure

) inherits tlp::params
{
    # Base packages that can and should always be installed (on laptops)
    package { $::tlp::params::base_packages:
        ensure => $ensure,
    }
}
