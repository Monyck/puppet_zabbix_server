{"filter":false,"title":"spec.pp","tooltip":"/manifests/spec.pp","undoManager":{"mark":0,"position":0,"stack":[[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":0,"column":0},"end":{"row":0,"column":28}},"text":"# Class: zabbix_server::spec"},{"action":"insertText","range":{"start":{"row":0,"column":28},"end":{"row":1,"column":0}},"text":"\r\n"},{"action":"insertLines","range":{"start":{"row":1,"column":0},"end":{"row":22,"column":0}},"lines":["#","# This class is used only for rpsec-puppet tests","# Can be taken as an example on how to do custom classes but should not","# be modified.","#","# == Usage","#","# This class is not intended to be used directly.","# Use it as reference","#","class zabbix_server::spec inherits zabbix_server {","","  # This just a test to override the arguments of an existing resource","  # Note that you can achieve this same result with just:","  # class { \"zabbix_server\": template => \"zabbix_server/spec.erb\" }","","  File['zabbix_server.conf'] {","    content => template('zabbix_server/spec.erb'),","  }","","}"]}]}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":22,"column":0},"end":{"row":22,"column":0},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1404053137186,"hash":"f46bb5613e386d63452e34bdc506e7ae07e0bfd2"}