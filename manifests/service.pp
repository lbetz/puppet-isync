# @summary Private class to manage the service isync
#
class isync::service {

  $ensure = $isync::ensure
  $enable = $isync::enable

  service { 'isync':
    ensure => $ensure,
    enable => $enable,
  }

}
