define graylog2::radio::config (
  $node_id_file = '/etc/graylog2-radio-node-id',
  $graylog2_server_uri = '',
  $rest_listen_uri = '',
  $rest_transport_uri = '',
  $kafka_brokers = '',
  $kafka_producer_type = 'async',
  $kafka_batch_size = '200',
  $kafka_batch_max_wait_ms = '250',
  $kafka_required_acks = '0',
  $processbuffer_processors = '5',
  $processor_wait_strategy = 'blocking',
  $ring_size = '1024'
){
  file { '/usr/local/graylog2-radio/graylog2-radio.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('graylog2/graylog2-radio.erb'),
  }

}
