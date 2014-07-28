# Class: zabbix_server::spec
#
# This class is used only for rpsec-puppet tests
# Can be taken as an example on how to do custom classes but should not
# be modified.
#
# == Usage
#
# This class is not intended to be used directly.
# Use it as reference
#
class zabbix_server::spec inherits zabbix_server {

  # This just a test to override the arguments of an existing resource
  # Note that you can achieve this same result with just:
  # class { "zabbix_server": template => "zabbix_server/spec.erb" }

  File['zabbix_server.conf'] {
    content => template('zabbix_server/spec.erb'),
  }

}
