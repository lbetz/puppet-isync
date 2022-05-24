# @summary Private class to configure the service
#
class isync::config {

  $src     = $isync::src_dir
  $servers = join($isync::servers, ' ')
  $dst     = $isync::dst_dir
  $user    = $isync::user
  $user_id = $isync::_user_id

  file { '/etc/isync/isync.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('isync/isync.conf.erb'),
  }

}
