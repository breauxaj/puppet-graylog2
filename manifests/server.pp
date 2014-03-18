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

  file { '/usr/local/graylog2-server':
    ensure  => 'link',
    owner   => 'root',
    group   => 'root',
    target  => "/usr/local/graylog2-server-${version}",
    require => Exec['untar-server'],
  }

  file { '/etc/init.d/graylog2-server':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    source => 'puppet:///modules/graylog2/server.init'
  }

}
