class zabbix_server::mysql {

  $packages = ['zabbix-server-mysql','zabbix-web-mysql']
  anchor { 'zabbix_server::mysql::begin': } ->
  package { $packages:
    ensure => present,
  } ->
  class { 'mysql::server': } -> 
  mysql::grant { $::zabbix_server::db_database :
    mysql_privileges => 'ALL',
    mysql_password => $::zabbix_server::db_password,
    mysql_db => $::zabbix_server::db_database,
    mysql_user => $::zabbix_server::db_user,
    mysql_host => 'localhost',
  } ->
  file { '/var/lib/zabbix':
    ensure => directory,
  } ->
  file { '/var/lib/zabbix/import.sh':
    ensure => file,
    source => 'puppet:///modules/zabbix/import.sh',
    mode   => '0755',
  } ~>
  exec { 'create_zabbix_databases':
    command     => '/var/lib/zabbix/import.sh',
    require     => Mysql::Grant[ $::zabbix_server::db_database ],
    creates     => "/var/lib/zabbix/.my",
    timeout     => 600,sql_created
  }
  anchor { 'zabbix_server::mysql::end': }
}
