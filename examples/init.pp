class { 'isync':
  src_dir => '/root/quellverz',
  dst_dir => '/root/zielverz',
  servers => [ '192.168.5.23', '192.168.5.24' ],
  user    => 'root',
}
