define graylog2::server::service (
  $ensure,
  $enable
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'graylog2-server',
  }

  service { $service:
    ensure  => $ensure,
    enable  => $enable,
    require => File['/etc/init.d/graylog2-server'],
  }

}
