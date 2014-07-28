# Puppet module: zabbix_server

This is a Puppet module for zabbix_server based on the second generation layout ("NextGen") of Example42 Puppet Modules,
and also partially based on Chris Spence's Zabbix Puppet module (https://github.com/fiddyspence/puppet-zabbix).

Made by Monica Colangelo / monica.colangelo@gmail.com

Official git repository: https://github.com/Monyck/puppet_zabbix_server

Released under the terms of Apache 2 License.

This module requires functions provided by the Example42 Puppi module (you need it even if you don't use and install Puppi)

For detailed info about the logic and usage patterns of Example42 modules check the DOCS directory on Example42 main modules set.
Official site: http://www.example42.com

## USAGE - Notice

**Zabbix is made of several separate parts and can be installed on different hosts. Therefore, this module allows you to install the different parts separately. 
You are strongly advised to read the code to enable or disable the installation of the different parts.**


## USAGE - Basic management

* Install zabbix_server with default settings

        class { 'zabbix_server': }

* Install a specific version of zabbix_server package

        class { 'zabbix_server':
          version => '1.0.1',
        }

* Disable zabbix_server service.

        class { 'zabbix_server':
          disable => true
        }

* Remove zabbix_server package

        class { 'zabbix_server':
          absent => true
        }

* Enable auditing without without making changes on existing zabbix_server configuration *files*

        class { 'zabbix_server':
          audit_only => true
        }

* Module dry-run: Do not make any change on *all* the resources provided by the module

        class { 'zabbix_server':
          noops => true
        }


## USAGE - Overrides and Customizations
* Use custom sources for main config file

        class { 'zabbix_server':
          source => [ "puppet:///modules/example42/zabbix_server/zabbix_server.conf-${hostname}" , 
                      "puppet:///modules/example42/zabbix_server/zabbix_server.conf" ],
        }


* Use custom source directory for the whole configuration dir

        class { 'zabbix_server':
          source_dir       => 'puppet:///modules/example42/zabbix_server/conf/',
          source_dir_purge => false, # Set to true to purge any existing file not present in $source_dir
        }

* Use custom template for main config file. Note that template and source arguments are alternative.

        class { 'zabbix_server':
          template => 'example42/zabbix_server/zabbix_server.conf.erb',
        }

* Automatically include a custom subclass

        class { 'zabbix_server':
          my_class => 'example42::my_zabbix_server',
        }


## USAGE - Example42 extensions management
* Activate puppi (recommended, but disabled by default)

        class { 'zabbix_server':
          puppi    => true,
        }

* Activate puppi and use a custom puppi_helper template (to be provided separately with a puppi::helper define ) to customize the output of puppi commands

        class { 'zabbix_server':
          puppi        => true,
          puppi_helper => 'myhelper',
        }

* Activate automatic monitoring (recommended, but disabled by default). This option requires the usage of Example42 monitor and relevant monitor tools modules

        class { 'zabbix_server':
          monitor      => true,
          monitor_tool => [ 'nagios' , 'monit' , 'munin' ],
        }

* Activate automatic firewalling. This option requires the usage of Example42 firewall and relevant firewall tools modules

        class { 'zabbix_server':
          firewall      => true,
          firewall_tool => 'iptables',
          firewall_src  => '10.42.0.0/24',
          firewall_dst  => $ipaddress_eth0,
        }
