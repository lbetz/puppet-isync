# @summary Private class to install all needed packages and binaries.
#
class isync::install {

  assert_private()

  package { 'inotify-tools':
    ensure => installed,
  }

  file { '/etc/isync':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  file { '/usr/local/bin/isync.sh':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0750',
    source => 'puppet:///modules/isync/isync.sh',
  }

  systemd::unit_file { 'isync.service':
    source => 'puppet:///modules/isync/isync.service',
  }

}
