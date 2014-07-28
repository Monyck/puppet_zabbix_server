class zabbix_server::repo (
  $gpgkeypath = '/etc/pki/rpm-gpg/RPM-GPG-KEY-ZABBIX',
  ){

  case $::operatingsystem {
    'RedHat', 'CentOS': {

      anchor { 'zabbix_server::repo::start': }->

      yumrepo { 'zabbix':
        baseurl  => "http://repo.zabbix.com/zabbix/2.2/rhel/${::operatingsystemmajrelease}/\$basearch/",
        descr    => 'Zabbix Official Repository - $basearch',
        enabled  => '1',
        gpgcheck => '1',
        gpgkey   => "file://${zabbix_server::repo::gpgkeypath}",
      } ->

      yumrepo { 'zabbix-non-supported':
        baseurl  => "http://repo.zabbix.com/non-supported/rhel/${::operatingsystemmajrelease}/\$basearch/",
        descr    => 'Zabbix Official Repository non-supported - $basearch ',
        enabled  => '1',
        gpgcheck => '1',
        gpgkey   => "file://${zabbix_server::repo::gpgkeypath}",
      } -> 

      file { $zabbix_server::yumrepo::gpgkeypath:
        ensure => file,
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
        source => 'puppet:///modules/zabbix_server/RPM-GPG-KEY-ZABBIX',
      } ~>

      exec { "import_zabbix_gpgkey":
        path      => '/bin:/usr/bin:/sbin:/usr/sbin',
        command   => "rpm --import ${zabbix_server::yumrepo::gpgkeypath}",
        unless    => "rpm -q gpg-pubkey-$(echo $(gpg --throw-keyids < ${zabbix_server::yumrepo::gpgkeypath}) | cut --characters=11-18 | tr '[A-Z]' '[a-z]')",
        logoutput => 'on_failure',
      } ->

      anchor { 'zabbix_server::repo::end': }

    }
    /(Ubuntu|Debian)/:{
      apt::source { 'zabbix':
        location   => "http://repo.zabbix.com/zabbix/2.2/${::operatingsystem}/",
        release    => ${::lsbdistcodename},
        repos      => 'main',
        key        => '79EA5ED4',
        key_source => 'http://repo.zabbix.com/zabbix-official-repo.key',
      }
  }
    default: { fail("Unsupported/Untested platform: ${::operatingsystem} - ${::lsbmajdistrelease} ") }
  }
}