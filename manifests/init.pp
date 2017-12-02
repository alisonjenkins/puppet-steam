# Class: steam
# ===========================
#
# Full description of class steam here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'steam':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class steam (
  Array $required_packages = [
    'gtk3',
    'lib32-curl',
    'lib32-dbus-glib',
    'lib32-gdk-pixbuf2',
    'lib32-glib2',
    'lib32-gtk2',
    'lib32-gtk3',
    'lib32-libnm-glib',
    'lib32-libpulse',
    'lib32-libudev0-shim',
    'lib32-libvdpau',
    'lib32-libxrandr',
    'lib32-libxtst',
    'lib32-openal',
    'libudev0-shim',
    'libvdpau',
    'libxrandr',
    'libxtst',
    'steam',
  ],
){

  if ( has_key($facts['steam']['gpu_vendors'], 'NVIDIA') ) {
    $install_packages = concat($required_packages, 'lib32-nvidia-utils')
  } else {
    $install_packages = $required_packages
  }

  ensure_resource('package', $install_packages, { 'ensure' => 'present' })

}
