class graylog2::server (
  $version = '0.20.1',
  $source = 'https://github.com/Graylog2/graylog2-server/releases/download'
){
  exec { 'get-server':
    path    => '/bin:/usr/bin',
    command => "wget ${source}/${version}/graylog2-server-${version}.tgz",
    cwd     => '/tmp',
    creates => "/tmp/graylog2-server-${version}.tgz",
    timeout => 10000,
    onlyif  => "test ! -d /usr/local/graylog2-server-${version}",
  }

  exec { 'untar-server':
    path    => '/bin:/usr/bin',
    command => "tar -zxf /tmp/graylog2-server-${version}.tgz",
    cwd     => '/usr/local',
    creates => "/usr/local/graylog2-server-${version}",
    timeout => 10000,
    require => Exec['get-server'],
  }

}
