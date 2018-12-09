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

    # The (chassis) type fact has been shuffled around - work around it
    if $::type {
        $chassis_type = $::type
    } else {
        $chassis_type = $facts['dmi']['chassis']['type']
    }

    if $::manufacturer == 'LENOVO' and $chassis_type == 'Notebook' {
        class { '::tlp::install::thinkpad':
            ensure => $ensure,
        }

        class { '::tlp::config::thinkpad':
            ensure => $ensure,
        }

    }
}
}
