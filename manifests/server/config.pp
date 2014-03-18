define graylog2::server::config (

){
  file { '/usr/local/graylog2-server/graylog2.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('graylog2/graylog2.erb'),
  }

}
