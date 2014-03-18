define graylog2::radio::config (

){
  file { '/usr/local/graylog2-radio/graylog2-radio.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('graylog2/graylog2-radio.erb'),
  }

}
