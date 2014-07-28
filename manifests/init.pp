# = Class: zabbix_server
#
# This is the main zabbix_server class
#
#
# == Parameters
#
# Specific class parameters
# Define the specific class behaviour and customizations
#
# [*install_server*]
#   Whether install the Zabbix server or not. Even if it seems to be the main purpose
#   of this module, it can be also used for a only-proxy or a only-frontend installation.
#   Default: true
#
# [*install_frontend*]
#   Whether install the frontend or not. You can use this parameter for separate frontend
#   installation from application server.
#   Default: true
#
# [*frontend_template*]
#   Sets the path to the template to use as content for frontend Apache configuration.
#
# [*install_java_gateway*]
#   Wheter install java gateway or not.
#   Default: false
#
# [*install_db*]
#   Whether install a local db or not (you may prefer to use a separate db).
#   This module only support mysql and pgsql database.
#   Default: false (so you must explicitly enable it and specify db_type)
#
# [*db_type*]
#   DB type to install if install_db is set to true. 
#   This module currently supports only mysql.
#
# [*db_server*]
#   Name of host with DB to connect to. It sets to 'localhost' if install_db is set to true.
#
# [*db_database*]
#   Name of the DB schema to connect to.
#
# [*db_user*]
#   User to connect to DB.
#
# [*db_password*]
#   Password of the DB user.
#
# [*backend_server*]
#   When installing frontend separately, you can set backend to connect to.
#   Default: fqdn
#
# [*managerepo*]
#   Whether add Zabbix official repositories or not.
#   Default: true
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, zabbix_server class will automatically "include $my_class"
#   Can be defined also by the (top scope) variable $zabbix_server_myclass
#
# [*source*]
#   Sets the content of source parameter for main configuration file
#   If defined, zabbix_server main config file will have the param: source => $source
#   Can be defined also by the (top scope) variable $zabbix_server_source
#
# [*source_dir*]
#   If defined, the whole zabbix_server configuration directory content is retrieved
#   recursively from the specified source
#   (source => $source_dir , recurse => true)
#   Can be defined also by the (top scope) variable $zabbix_server_source_dir
#
# [*source_dir_purge*]
#   If set to true (default false) the existing configuration directory is
#   mirrored with the content retrieved from source_dir
#   (source => $source_dir , recurse => true , purge => true)
#   Can be defined also by the (top scope) variable $zabbix_server_source_dir_purge
#
# [*template*]
#   Sets the path to the template to use as content for main configuration file
#   If defined, zabbix_server main config file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#   Can be defined also by the (top scope) variable $zabbix_server_template
#
# [*options*]
#   An hash of custom options to be used in templates for arbitrary settings.
#   Can be defined also by the (top scope) variable $zabbix_server_options
#
# [*service_autorestart*]
#   Automatically restarts the zabbix_server service when there is a change in
#   configuration files. Default: true, Set to false if you don't want to
#   automatically restart the service.
#
# [*version*]
#   The package version, used in the ensure parameter of package type.
#   Default: present. Can be 'latest' or a specific version number.
#   Note that if the argument absent (see below) is set to true, the
#   package is removed, whatever the value of version parameter.
#
# [*absent*]
#   Set to 'true' to remove package(s) installed by module
#   Can be defined also by the (top scope) variable $zabbix_server_absent
#
# [*disable*]
#   Set to 'true' to disable service(s) managed by module
#   Can be defined also by the (top scope) variable $zabbix_server_disable
#
# [*disableboot*]
#   Set to 'true' to disable service(s) at boot, without checks if it's running
#   Use this when the service is managed by a tool like a cluster software
#   Can be defined also by the (top scope) variable $zabbix_server_disableboot
#
# [*monitor*]
#   Set to 'true' to enable monitoring of the services provided by the module
#   Can be defined also by the (top scope) variables $zabbix_server_monitor
#   and $monitor
#
# [*monitor_tool*]
#   Define which monitor tools (ad defined in Example42 monitor module)
#   you want to use for zabbix_server checks
#   Can be defined also by the (top scope) variables $zabbix_server_monitor_tool
#   and $monitor_tool
#
# [*monitor_target*]
#   The Ip address or hostname to use as a target for monitoring tools.
#   Default is the fact $ipaddress
#   Can be defined also by the (top scope) variables $zabbix_server_monitor_target
#   and $monitor_target
#
# [*puppi*]
#   Set to 'true' to enable creation of module data files that are used by puppi
#   Can be defined also by the (top scope) variables $zabbix_server_puppi and $puppi
#
# [*puppi_helper*]
#   Specify the helper to use for puppi commands. The default for this module
#   is specified in params.pp and is generally a good choice.
#   You can customize the output of puppi commands for this module using another
#   puppi helper. Use the define puppi::helper to create a new custom helper
#   Can be defined also by the (top scope) variables $zabbix_server_puppi_helper
#   and $puppi_helper
#
# [*firewall*]
#   Set to 'true' to enable firewalling of the services provided by the module
#   Can be defined also by the (top scope) variables $zabbix_server_firewall
#   and $firewall
#
# [*firewall_tool*]
#   Define which firewall tool(s) (ad defined in Example42 firewall module)
#   you want to use to open firewall for zabbix_server port(s)
#   Can be defined also by the (top scope) variables $zabbix_server_firewall_tool
#   and $firewall_tool
#
# [*firewall_src*]
#   Define which source ip/net allow for firewalling zabbix_server. Default: 0.0.0.0/0
#   Can be defined also by the (top scope) variables $zabbix_server_firewall_src
#   and $firewall_src
#
# [*firewall_dst*]
#   Define which destination ip to use for firewalling. Default: $ipaddress
#   Can be defined also by the (top scope) variables $zabbix_server_firewall_dst
#   and $firewall_dst
#
# [*debug*]
#   Set to 'true' to enable modules debugging
#   Can be defined also by the (top scope) variables $zabbix_server_debug and $debug
#
# [*audit_only*]
#   Set to 'true' if you don't intend to override existing configuration files
#   and want to audit the difference between existing files and the ones
#   managed by Puppet.
#   Can be defined also by the (top scope) variables $zabbix_server_audit_only
#   and $audit_only
#
# [*noops*]
#   Set noop metaparameter to true for all the resources managed by the module.
#   Basically you can run a dryrun for this specific module if you set
#   this to true. Default: false
#
# Default class params - As defined in zabbix_server::params.
# Note that these variables are mostly defined and used in the module itself,
# overriding the default values might not affected all the involved components.
# Set and override them only if you know what you're doing.
# Note also that you can't override/set them via top scope variables.
#
# [*package*]
#   The name of zabbix_server package
#
# [*service*]
#   The name of zabbix_server service
#
# [*service_status*]
#   If the zabbix_server service init script supports status argument
#
# [*process*]
#   The name of zabbix_server process
#
# [*process_args*]
#   The name of zabbix_server arguments. Used by puppi and monitor.
#   Used only in case the zabbix_server process name is generic (java, ruby...)
#
# [*process_user*]
#   The name of the user zabbix_server runs with. Used by puppi and monitor.
#
# [*config_dir*]
#   Main configuration directory. Used by puppi
#
# [*config_file*]
#   Main configuration file path
#
# [*config_file_mode*]
#   Main configuration file path mode
#
# [*config_file_owner*]
#   Main configuration file path owner
#
# [*config_file_group*]
#   Main configuration file path group
#
# [*config_file_init*]
#   Path of configuration file sourced by init script
#
# [*pid_file*]
#   Path of pid file. Used by monitor
#
# [*data_dir*]
#   Path of application data directory. Used by puppi
#
# [*log_dir*]
#   Base logs directory. Used by puppi
#
# [*log_file*]
#   Log file(s). Used by puppi
#
# [*port*]
#   The listening port, if any, of the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Note: This doesn't necessarily affect the service configuration file
#   Can be defined also by the (top scope) variable $zabbix_server_port
#
# [*protocol*]
#   The protocol used by the the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Can be defined also by the (top scope) variable $zabbix_server_protocol
#
#
# See README for usage patterns.
#
class zabbix_server (
  $install_server         = params_lookup( 'install_server'),
  $install_frontend       = params_lookup( 'install_frontend'),
  $install_db             = params_lookup( 'install_db'),
  $install_java_gateway   = params_lookup( 'install_java_gateway'),
  $frontend_template      = params_lookup( 'frontend_template'),
  $managerepo             = params_lookup( 'managerepo' ),
  $backend_server         = params_lookup( 'backend_server' ),
  $db_server              = params_lookup( 'db_server' ),
  $db_type                = params_lookup( 'db_type' ),
  $db_database            = params_lookup( 'db_database' ),
  $db_user                = params_lookup( 'db_user' ),
  $db_password            = params_lookup( 'db_password' ),
  $my_class               = params_lookup( 'my_class' ),
  $source                 = params_lookup( 'source' ),
  $source_dir             = params_lookup( 'source_dir' ),
  $source_dir_purge       = params_lookup( 'source_dir_purge' ),
  $template               = params_lookup( 'template' ),
  $service_autorestart    = params_lookup( 'service_autorestart' , 'global' ),
  $options                = params_lookup( 'options' ),
  $version                = params_lookup( 'version' ),
  $absent                 = params_lookup( 'absent' ),
  $disable                = params_lookup( 'disable' ),
  $disableboot            = params_lookup( 'disableboot' ),
  $monitor                = params_lookup( 'monitor' , 'global' ),
  $monitor_tool           = params_lookup( 'monitor_tool' , 'global' ),
  $monitor_target         = params_lookup( 'monitor_target' , 'global' ),
  $puppi                  = params_lookup( 'puppi' , 'global' ),
  $puppi_helper           = params_lookup( 'puppi_helper' , 'global' ),
  $firewall               = params_lookup( 'firewall' , 'global' ),
  $firewall_tool          = params_lookup( 'firewall_tool' , 'global' ),
  $firewall_src           = params_lookup( 'firewall_src' , 'global' ),
  $firewall_dst           = params_lookup( 'firewall_dst' , 'global' ),
  $debug                  = params_lookup( 'debug' , 'global' ),
  $audit_only             = params_lookup( 'audit_only' , 'global' ),
  $noops                  = params_lookup( 'noops' ),
  $package                = params_lookup( 'package' ),
  $service                = params_lookup( 'service' ),
  $service_status         = params_lookup( 'service_status' ),
  $process                = params_lookup( 'process' ),
  $process_args           = params_lookup( 'process_args' ),
  $process_user           = params_lookup( 'process_user' ),
  $config_dir             = params_lookup( 'config_dir' ),
  $config_file            = params_lookup( 'config_file' ),
  $config_file_mode       = params_lookup( 'config_file_mode' ),
  $config_file_owner      = params_lookup( 'config_file_owner' ),
  $config_file_group      = params_lookup( 'config_file_group' ),
  $config_file_init       = params_lookup( 'config_file_init' ),
  $pid_file               = params_lookup( 'pid_file' ),
  $data_dir               = params_lookup( 'data_dir' ),
  $log_dir                = params_lookup( 'log_dir' ),
  $log_file               = params_lookup( 'log_file' ),
  $port                   = params_lookup( 'port' ),
  $protocol               = params_lookup( 'protocol' )
  ) inherits zabbix_server::params {

  $bool_source_dir_purge=any2bool($source_dir_purge)
  $bool_service_autorestart=any2bool($service_autorestart)
  $bool_absent=any2bool($absent)
  $bool_disable=any2bool($disable)
  $bool_disableboot=any2bool($disableboot)
  $bool_monitor=any2bool($monitor)
  $bool_puppi=any2bool($puppi)
  $bool_firewall=any2bool($firewall)
  $bool_debug=any2bool($debug)
  $bool_audit_only=any2bool($audit_only)
  $bool_noops=any2bool($noops)

  
  if $zabbix_server::install_frontend == true {
    include zabbix_server::frontend
  }
  
  if $zabbix_server::install_proxy == true {
    include zabbix_server::proxy
  }
  
  if $zabbix_server::install_java_gateway == true {
    include zabbix_server::java_gateway
  }

  if $zabbix_server::install_server == true {

    ### Definition of some variables used in the module
    $manage_package = $zabbix_server::bool_absent ? {
      true  => 'absent',
      false => $zabbix_server::version,
    }

    $manage_service_enable = $zabbix_server::bool_disableboot ? {
      true    => false,
      default => $zabbix_server::bool_disable ? {
        true    => false,
        default => $zabbix_server::bool_absent ? {
          true  => false,
          false => true,
        },
      },
    }

    $manage_service_ensure = $zabbix_server::bool_disable ? {
      true    => 'stopped',
      default =>  $zabbix_server::bool_absent ? {
        true    => 'stopped',
        default => 'running',
      },
    }

    $manage_service_autorestart = $zabbix_server::bool_service_autorestart ? {
      true    => Service[zabbix_server],
      false   => undef,
    }

    $manage_file = $zabbix_server::bool_absent ? {
      true    => 'absent',
      default => 'present',
    }

    if $zabbix_server::bool_absent == true
    or $zabbix_server::bool_disable == true
    or $zabbix_server::bool_disableboot == true {
      $manage_monitor = false
    } else {
      $manage_monitor = true
    }

    if $zabbix_server::bool_absent == true
    or $zabbix_server::bool_disable == true {
      $manage_firewall = false
    } else {
      $manage_firewall = true
    }

    if $zabbix_server::managerepo == true {
      include zabbix_server::repo
    }
  
    if $zabbix_server::install_db == true {
      case $zabbix_server::db_type {
        'mysql': { include zabbix_server::mysql }
        default: { fail("Currently this module only supports mysql db type") }
      }
    }
  
    $manage_audit = $zabbix_server::bool_audit_only ? {
      true  => 'all',
      false => undef,
    }

    $manage_file_replace = $zabbix_server::bool_audit_only ? {
      true  => false,
      false => true,
    }

    $manage_file_source = $zabbix_server::source ? {
      ''        => undef,
      default   => $zabbix_server::source,
    }

    $manage_file_content = $zabbix_server::template ? {
      ''        => undef,
      default   => template($zabbix_server::template),
    }

    ### Managed resources
    package { $zabbix_server::package:
      ensure  => $zabbix_server::manage_package,
      noop    => $zabbix_server::bool_noops,
    }

    service { 'zabbix_server':
      ensure     => $zabbix_server::manage_service_ensure,
      name       => $zabbix_server::service,
      enable     => $zabbix_server::manage_service_enable,
      hasstatus  => $zabbix_server::service_status,
      pattern    => $zabbix_server::process,
      require    => Package[$zabbix_server::package],
      noop       => $zabbix_server::bool_noops,
    }

    file { 'zabbix_server.conf':
      ensure  => $zabbix_server::manage_file,
      path    => $zabbix_server::config_file,
      mode    => $zabbix_server::config_file_mode,
      owner   => $zabbix_server::config_file_owner,
      group   => $zabbix_server::config_file_group,
      require => Package[$zabbix_server::package],
      notify  => $zabbix_server::manage_service_autorestart,
      source  => $zabbix_server::manage_file_source,
      content => $zabbix_server::manage_file_content,
      replace => $zabbix_server::manage_file_replace,
      audit   => $zabbix_server::manage_audit,
      noop    => $zabbix_server::bool_noops,
    }

    # The whole zabbix_server configuration directory can be recursively overriden
    if $zabbix_server::source_dir {
      file { 'zabbix_server.dir':
        ensure  => directory,
        path    => $zabbix_server::config_dir,
        require => Package[$zabbix_server::package],
        notify  => $zabbix_server::manage_service_autorestart,
        source  => $zabbix_server::source_dir,
        recurse => true,
        purge   => $zabbix_server::bool_source_dir_purge,
        force   => $zabbix_server::bool_source_dir_purge,
        replace => $zabbix_server::manage_file_replace,
        audit   => $zabbix_server::manage_audit,
        noop    => $zabbix_server::bool_noops,
      }
    }

    ### Include custom class if $my_class is set
    if $zabbix_server::my_class {
      include $zabbix_server::my_class
    }

    ### Provide puppi data, if enabled ( puppi => true )
    if $zabbix_server::bool_puppi == true {
      $classvars=get_class_args()
      puppi::ze { 'zabbix_server':
        ensure    => $zabbix_server::manage_file,
        variables => $classvars,
        helper    => $zabbix_server::puppi_helper,
        noop      => $zabbix_server::bool_noops,
      }
    }

    ### Service monitoring, if enabled ( monitor => true )
    if $zabbix_server::bool_monitor == true {
      if $zabbix_server::port != '' {
        monitor::port { "zabbix_server_${zabbix_server::protocol}_${zabbix_server::port}":
          protocol => $zabbix_server::protocol,
          port     => $zabbix_server::port,
          target   => $zabbix_server::monitor_target,
          tool     => $zabbix_server::monitor_tool,
          enable   => $zabbix_server::manage_monitor,
          noop     => $zabbix_server::bool_noops,
        }
      }
      if $zabbix_server::service != '' {
        monitor::process { 'zabbix_server_process':
          process  => $zabbix_server::process,
          service  => $zabbix_server::service,
          pidfile  => $zabbix_server::pid_file,
          user     => $zabbix_server::process_user,
          argument => $zabbix_server::process_args,
          tool     => $zabbix_server::monitor_tool,
          enable   => $zabbix_server::manage_monitor,
          noop     => $zabbix_server::bool_noops,
        }
      }
    }

    ### Firewall management, if enabled ( firewall => true )
    if $zabbix_server::bool_firewall == true and $zabbix_server::port != '' {
      firewall { "zabbix_server_${zabbix_server::protocol}_${zabbix_server::port}":
        source      => $zabbix_server::firewall_src,
        destination => $zabbix_server::firewall_dst,
        protocol    => $zabbix_server::protocol,
        port        => $zabbix_server::port,
        action      => 'allow',
        direction   => 'input',
        tool        => $zabbix_server::firewall_tool,
        noop        => $zabbix_server::bool_noops,
      }
    }

    ### Debugging, if enabled ( debug => true )
    if $zabbix_server::bool_debug == true {
      file { 'debug_zabbix_server':
        ensure  => $zabbix_server::manage_file,
        path    => "${settings::vardir}/debug-zabbix_server",
        mode    => '0640',
        owner   => 'root',
        group   => 'root',
        content => inline_template('<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime.*|path|timestamp|free|.*password.*|.*psk.*|.*key)/ }.to_yaml %>'),
        noop    => $zabbix_server::bool_noops,
      }
    }
  
  }

}
