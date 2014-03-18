class graylog2::web (
  $version = '0.20.1',
  $source = 'https://github.com/Graylog2/graylog2-server/releases/download'
){
  exec { 'get-web':
    path    => '/bin:/usr/bin',
    command => "wget ${source}/${version}/graylog2-web-interface-${version}.tgz",
    cwd     => '/tmp',
    creates => "/tmp/graylog2-web-interface-${version}.tgz",
    timeout => 10000,
    onlyif  => "test ! -d /usr/local/graylog2-web-interface-${version}",
  }

  exec { 'untar-web':
    path    => '/bin:/usr/bin',
    command => "tar -zxf /tmp/graylog2-web-interface-${version}.tgz",
    cwd     => '/usr/local',
    creates => "/usr/local/graylog2-web-interface-${version}",
    timeout => 10000,
    require => Exec['get-web'],
  }

}
