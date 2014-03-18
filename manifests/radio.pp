class graylog2::radio (
  $version = '0.20.0',
  $source = 'https://github.com/Graylog2/graylog2-server/releases/download'
){
  exec { 'get-radio':
    path    => '/bin:/usr/bin',
    command => "wget ${source}/${version}/graylog2-radio-${version}.tgz",
    cwd     => '/tmp',
    creates => "/tmp/graylog2-radio-${version}.tgz",
    timeout => 10000,
    onlyif  => "test ! -d /usr/local/graylog2-radio-${version}",
  }

  exec { 'untar-radio':
    path    => '/bin:/usr/bin',
    command => "tar -zxf /tmp/graylog2-radio-${version}.tgz",
    cwd     => '/usr/local',
    creates => "/usr/local/graylog2-radio-${version}",
    timeout => 10000,
    require => Exec['get-radio'],
  }

}
