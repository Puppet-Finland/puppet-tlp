#
# == Class: tlp::config::thinkpad
#
# Ensure that Thinkpad features (e.g. battery charging thresholds) can be used
#
class tlp::config::thinkpad
(
    $ensure

) inherits tlp::params
{
    # Fedora does not seem to load the tp_smapi module automatically
    if $::facts['os']['family'] == 'RedHat' {
        file { 'tlp.modules':
            ensure  => $ensure,
            name    => '/etc/sysconfig/modules/tlp.modules',
            owner   => 'root',
            group   => 'root',
            mode    => '0755',
            content => template('tlp/tlp.modules.erb'),
            require => Class['::tlp::install::thinkpad'],
        }
    }
}
