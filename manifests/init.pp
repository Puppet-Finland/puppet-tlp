# == Class: tlp
#
# This class sets up tlp
#
# Currently functionality is limited to installing or removing the package.
#
# == Parameters
#
# [*manage*]
#   Whether to manage tlp using Puppet. Valid values are true (default) 
#   and false.
# [*ensure*]
#   Status of tlp. Valid values are 'present' (default) and 'absent'.
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
# == License
#
# BSD-license. See file LICENSE for details.
#
class tlp
(
    Boolean                  $manage = true,
    Enum['present','absent'] $ensure = 'present'

) inherits tlp::params
{

if $manage {
    class { '::tlp::install':
        ensure => $ensure,
    }

    $manufacturer = $::facts['dmi']['manufacturer']
    $chassis = $::facts['dmi']['chassis']['type']

    if $manufacturer == 'LENOVO' and $chassis == 'Notebook' {
        class { '::tlp::install::thinkpad':
            ensure => $ensure,
        }

        class { '::tlp::config::thinkpad':
            ensure => $ensure,
        }

    }
}
}
