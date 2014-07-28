{"filter":false,"title":"yumrepo.pp","tooltip":"/manifests/yumrepo.pp","undoManager":{"mark":2,"position":2,"stack":[[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":0,"column":0},"end":{"row":0,"column":20}},"text":"class zabbix::repo ("},{"action":"insertText","range":{"start":{"row":0,"column":20},"end":{"row":1,"column":0}},"text":"\r\n"},{"action":"insertLines","range":{"start":{"row":1,"column":0},"end":{"row":40,"column":0}},"lines":["  $gpgkeypath = '/etc/pki/rpm-gpg/RPM-GPG-KEY-ZABBIX',","){","","  anchor { 'zabbix::repo::start': }->","","  yumrepo { 'zabbix':","    baseurl  => \"http://repo.zabbix.com/zabbix/2.0/rhel/${::operatingsystemmajrelease}/\\$basearch/\",","    descr    => 'Zabbix Official Repository - $basearch',","    enabled  => '1',","    gpgcheck => '1',","    gpgkey   => \"file://${zabbix::repo::gpgkeypath}\",","  } ->","","  yumrepo { 'zabbix-non-supported':","    baseurl  => \"http://repo.zabbix.com/non-supported/rhel/${::operatingsystemmajrelease}/\\$basearch/\",","    descr    => 'Zabbix Official Repository non-supported - $basearch ',","    enabled  => '1',","    gpgcheck => '1',","    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-ZABBIX',","  } -> ","","  file { $zabbix::repo::gpgkeypath:","    ensure => file,","    owner  => 'root',","    group  => 'root',","    mode   => '0644',","    source => 'puppet:///modules/zabbix/RPM-GPG-KEY-ZABBIX',","  } ~>","","  exec {  \"import_zabbix_gpgkey\":","    path      => '/bin:/usr/bin:/sbin:/usr/sbin',","    command   => \"rpm --import ${zabbix::repo::gpgkeypath}\",","    unless    => \"rpm -q gpg-pubkey-$(echo $(gpg --throw-keyids < ${zabbix::repo::gpgkeypath}) | cut --characters=11-18 | tr '[A-Z]' '[a-z]')\",","    logoutput => 'on_failure',","  } ->","","  anchor { 'zabbix::repo::end': }","",""]},{"action":"insertText","range":{"start":{"row":40,"column":0},"end":{"row":40,"column":1}},"text":"}"}]}],[{"group":"doc","deltas":[{"action":"removeText","range":{"start":{"row":0,"column":6},"end":{"row":0,"column":18}},"text":"zabbix::repo"},{"action":"insertText","range":{"start":{"row":0,"column":6},"end":{"row":0,"column":28}},"text":"zabbix_server::yumrepo"},{"action":"removeText","range":{"start":{"row":4,"column":12},"end":{"row":4,"column":24}},"text":"zabbix::repo"},{"action":"insertText","range":{"start":{"row":4,"column":12},"end":{"row":4,"column":34}},"text":"zabbix_server::yumrepo"},{"action":"removeText","range":{"start":{"row":11,"column":26},"end":{"row":11,"column":38}},"text":"zabbix::repo"},{"action":"insertText","range":{"start":{"row":11,"column":26},"end":{"row":11,"column":48}},"text":"zabbix_server::yumrepo"},{"action":"removeText","range":{"start":{"row":22,"column":10},"end":{"row":22,"column":22}},"text":"zabbix::repo"},{"action":"insertText","range":{"start":{"row":22,"column":10},"end":{"row":22,"column":32}},"text":"zabbix_server::yumrepo"},{"action":"removeText","range":{"start":{"row":32,"column":33},"end":{"row":32,"column":45}},"text":"zabbix::repo"},{"action":"insertText","range":{"start":{"row":32,"column":33},"end":{"row":32,"column":55}},"text":"zabbix_server::yumrepo"},{"action":"removeText","range":{"start":{"row":33,"column":68},"end":{"row":33,"column":80}},"text":"zabbix::repo"},{"action":"insertText","range":{"start":{"row":33,"column":68},"end":{"row":33,"column":90}},"text":"zabbix_server::yumrepo"},{"action":"removeText","range":{"start":{"row":37,"column":12},"end":{"row":37,"column":24}},"text":"zabbix::repo"},{"action":"insertText","range":{"start":{"row":37,"column":12},"end":{"row":37,"column":34}},"text":"zabbix_server::yumrepo"}]}],[{"group":"doc","deltas":[{"action":"removeLines","range":{"start":{"row":39,"column":0},"end":{"row":40,"column":0}},"nl":"\r\n","lines":[""]}]}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":39,"column":0},"end":{"row":39,"column":0},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1404054047758,"hash":"9a6d94e798cd73c8777ad258fc368dfd6d442237"}