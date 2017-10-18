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
        ensure   => $ensure,
    }

    # Packages that only make sense on Lenovo laptops
    $manufacturer = $facts['dmi']['manufacturer']
    $chassis = $facts['dmi']['chassis']['type']

    if $manufacturer == 'LENOVO' and $chassis == 'Notebook' {
        package { $::tlp::params::thinkpad_packages:
            ensure => $ensure,
        }
    }
}
