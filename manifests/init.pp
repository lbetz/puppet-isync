# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   class { 'isync':
#     src_dir => '/etc/puppetlabs/code/environments',
#     user    => 'puppet',
#     dst_dir => '/etc/puppetlabs/code/environments',
#     servers => [ '192.168.56.61', '192.168.56.62' ],
#   }
#
# @param ensure
#   Manages if the service should be stopped or running.
#
# @param enable
#   If set to true the isync service will start on boot.
#
# @param src_dir
#   Source directory to sync.
#
# @param servers
#   List of destination servers.
#
# @param dst_dir
#   Destination director on all servers list items.
#
# @param user
#   Login user on all destinations.
#
# @param user_id
#   Path to a private key file. Defaults to user specific depends on the setting of `key_type`.
#
# @param key_type
#   Type of user key to use, if `user_id` is not set.
#
class isync(
  Stdlib::Absolutepath             $src_dir,
  Array[Stdlib::Host]              $servers,
  String                           $user,
  Stdlib::Absolutepath             $dst_dir,
  Optional[Stdlib::Absolutepath]   $user_id  = undef,
  Stdlib::Ensure::Service          $ensure   = 'running',
  Boolean                          $enable   = true,
  Enum['dsa', 'rsa', 'ed25519']    $key_type = 'rsa',
) {

  if $user_id {
    $_user_id = $user_id
  } else {
    $_user_id = "~/.ssh/id_${key_type}"
  }

  contain isync::install
  contain isync::config
  contain isync::service

  Class[isync::install] -> Class[isync::config] ~> Class[isync::service]
}
