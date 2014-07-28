class zabbix_server::java_gateway {
    
  package { 'zabbix-java-gateway':
    ensure => present
  }
  
  file { '/etc/zabbix/zabbix_java_gateway.conf':
    content => template('zabbix_server/zabbix_java_gateway.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644'
  }
  
  
}