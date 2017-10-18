# tlp

A Puppet module for managing tlp. Note that right now setup of software 
repositories is not supported; in many of the recent distributions such as 
Debian 9 and Ubuntu 16.04 all the required packages are available in the 
official software repositories.

# Module usage

Install tlp using Hiera:

    classes:
        - tlp

For details, see

* [Class: tlp](manifests/init.pp)

# Dependencies

See [metadata.json](metadata.json).

# Operating system support

This module has been tested on

* Debian 8
* Fedora 25

It should also work on

* Debian 9
* Ubuntu 16.04

Any *NIX-style operating system should work out of the box or with small
modifications.

For details see [params.pp](manifests/params.pp).
