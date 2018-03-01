# Class: xvfb
# ===========================
#
# This installs the Xvfb package and creates a service running a display :0
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
#    class { 'xvfb':
#    }
#
# Authors
# -------
#
# Mike Marseglia <mike@marseglia.org>
#
# Copyright
# ---------
#
# Copyright 2018 Mike Marseglia, unless otherwise noted.
#
class xvfb {

  package { 'Xvfb':
    ensure  => installed,
  }->
  file { '/etc/sysconfig/xvfb' :
    mode    => '0640',
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/xvfb/xvfb',
    notify  => Service['xvfb'],
  }->
  file { '/lib/systemd/system/xvfb.service':
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/xvfb/xvfb.service',
  }~>
  exec { 'xvfb-systemd-reload':
    command     => 'systemctl daemon-reload',
    path        => [ '/usr/bin', '/bin', '/usr/sbin' ],
    require     => File['/etc/sysconfig/xvfb'],
  }

  service { 'xvfb':
    ensure  => running,
    enable  => true,
    require => [File['/lib/systemd/system/xvfb.service'], File['/etc/sysconfig/xvfb']]
  }
}
