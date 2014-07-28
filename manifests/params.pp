# Class: zabbix_server::params
#
# This class defines default parameters used by the main module class zabbix_server
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to zabbix_server class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class zabbix_server::params {

  ### Application related parameters

  $package = $::operatingsystem ? {
    default => 'zabbix-server',
  }

  $service = $::operatingsystem ? {
    default => 'zabbix-server',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'zabbix_server',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    default => 'zabbix',
  }

  $config_dir = $::operatingsystem ? {
    default => '/etc/zabbix',
  }

  $config_file = $::operatingsystem ? {
    default => '/etc/zabbix/zabbix_server.conf',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'zabbix',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/zabbix_server',
    default                   => '/etc/sysconfig/zabbix_server',
  }

  $pid_file = $::operatingsystem ? {
    default => '/var/run/zabbix_server.pid',
  }

  $data_dir = $::operatingsystem ? {
    default => '/etc/zabbix',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log/zabbix_server',
  }

  $log_file = $::operatingsystem ? {
    default => '/var/log/zabbix_server/zabbix_server.log',
  }

  $port = '10051'
  $protocol = 'tcp'
  
  $install_server = true
  $install_frontend = true
  $frontend_template = 'zabbix_server/zabbix_vhost.conf.erb'
  $install_db = false
  $install_java_gateway = false
  $db_server = $zabbix_server::install_db ? {
    true    => 'localhost',
    default => ''
  }
  $db_type     = 'mysql'
  $db_database = ''
  $db_user     = ''
  $db_password = ''
  $backend_server = $::fq

  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = ''
  $options = ''
  $service_autorestart = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false
  $noops = false

}
