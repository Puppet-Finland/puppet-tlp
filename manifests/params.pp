#
# == Class: tlp::params
#
# Defines some variables based on the operating system
#
class tlp::params {

    include ::os::params

    $codename = $facts['os']['distro']['codename']

    case $codename  {
        'TwentyFive': {
            $base_packages = ['tlp','tlp-rdw']
            $thinkpad_packages = ['akmod-tp_smapi','akmod-acpi_call','kernel-devel']
        }
        /(jessie|stretch|xenial)/: {
            $base_packages = ['tlp','tlp-rdw']
            $thinkpad_packages = ['tp-smapi-dkms', 'acpi-call-dkms']
        }
        default: {
            fail("Unsupported distribution: ${codename}")
        }
    }
}
