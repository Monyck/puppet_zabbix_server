class zabbix_server::frontend (
  $vhost_template = $::zabbix_server::frontend_template ) {

  $packages = [ 'zabbix-web', "zabbix-web-${::zabbix_server::db_type}" ]
  
  package { $packages:
    ensure => present
  }
  
  apache::vhost { 'zabbix':
    template => $vhost_template
  }
  
  file { '/etc/zabbix/web/zabbix.conf.php':
    content => template('zabbix_server/zabbix_frontend.php.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644'
  }
  
}