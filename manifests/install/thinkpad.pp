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

    if $::operatingsystem == 'Fedora' {
        package { 'rpmfusion-free-release':
            ensure => 'present',
            source => "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-${facts['os']['release']['major']}.noarch.rpm",
        }
        package { 'tlp-release':
            ensure  => 'present',
            source  => "http://repo.linrunner.de/fedora/tlp/repos/releases/tlp-release.fc${facts['os']['release']['major']}.noarch.rpm",
            require => Package['rpmfusion-free-release'],
        }
        $package_require = Package['tlp-release']
    } else {
        $package_require = undef
    }

    package { $::tlp::params::thinkpad_packages:
        ensure  => $ensure,
        require => $package_require,
    }
}
