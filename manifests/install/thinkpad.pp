#
# == Class: tlp::install::thinkpad
#
# Install Thinkpad-specific packages for TLP
#
class tlp::install::thinkpad
(
    $ensure,

) inherits tlp::params
{
    package { $::tlp::params::thinkpad_packages:
        ensure => $ensure,
    }
}
