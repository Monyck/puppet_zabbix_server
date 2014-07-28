class zabbix_server::java_gateway {
    
  package { 'zabbix-java-gateway':
    ensure => present
  }
  
}