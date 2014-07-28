{"filter":false,"title":"import.sh","tooltip":"/files/import.sh","undoManager":{"mark":40,"position":40,"stack":[[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":0,"column":0},"end":{"row":0,"column":11}},"text":"#!/bin/bash"},{"action":"insertText","range":{"start":{"row":0,"column":11},"end":{"row":1,"column":0}},"text":"\n"},{"action":"insertLines","range":{"start":{"row":1,"column":0},"end":{"row":35,"column":0}},"lines":["# a comment that I amended","cd /usr/share/doc/zabbix-server-mysql-$(rpm -q zabbix-server-mysql | awk -F- '{print $4}')/create","","if [ ! $? -eq 0 ]; then","  echo \"Could not cd to $(/usr/share/doc/zabbix-server-mysql-$(rpm -q zabbix-server-mysql | awk -F- '{print $4}')/create)\"","  exit 1","fi","if [ -f .done ]; then","  exit 0","fi","FOO=0","sql[0]=schema.sql","sql[1]=images.sql","sql[2]=data.sql","echo $sql[0]","for i in {0..2}; do","  echo \"Processing ${sql[$i]}\"","  if [ ! -f ${sql[$i]}.done ]","    then","      mysql -uroot zabbix < ${sql[$i]}","      if [ $? -eq 0 ]; then","        touch ${sql[$i]}.done","      else","        FOO=1","      fi","  fi","done","","if [ ! $FOO -eq 1 ]","  then","    touch .done","    exit 0","  else","    exit 1"]},{"action":"insertText","range":{"start":{"row":35,"column":0},"end":{"row":35,"column":2}},"text":"fi"}]}],[{"group":"doc","deltas":[{"action":"removeText","range":{"start":{"row":1,"column":2},"end":{"row":1,"column":26}},"text":"a comment that I amended"},{"action":"insertText","range":{"start":{"row":1,"column":2},"end":{"row":1,"column":3}},"text":"f"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":3},"end":{"row":1,"column":4}},"text":"i"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":4},"end":{"row":1,"column":5}},"text":"l"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":5},"end":{"row":1,"column":6}},"text":"e"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":6},"end":{"row":1,"column":7}},"text":" "}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":7},"end":{"row":1,"column":8}},"text":"m"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":8},"end":{"row":1,"column":9}},"text":"a"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":9},"end":{"row":1,"column":10}},"text":"n"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":10},"end":{"row":1,"column":11}},"text":"a"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":11},"end":{"row":1,"column":12}},"text":"g"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":12},"end":{"row":1,"column":13}},"text":"e"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":13},"end":{"row":1,"column":14}},"text":"d"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":14},"end":{"row":1,"column":15}},"text":" "}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":15},"end":{"row":1,"column":16}},"text":"b"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":16},"end":{"row":1,"column":17}},"text":"y"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":17},"end":{"row":1,"column":18}},"text":" "}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":18},"end":{"row":1,"column":19}},"text":"P"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":19},"end":{"row":1,"column":20}},"text":"u"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":20},"end":{"row":1,"column":21}},"text":"p"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":21},"end":{"row":1,"column":22}},"text":"p"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":22},"end":{"row":1,"column":23}},"text":"e"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":23},"end":{"row":1,"column":24}},"text":"t"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":24},"end":{"row":1,"column":25}},"text":" "}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":25},"end":{"row":1,"column":26}},"text":"-"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":26},"end":{"row":1,"column":27}},"text":" "}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":27},"end":{"row":1,"column":28}},"text":"d"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":28},"end":{"row":1,"column":29}},"text":"o"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":29},"end":{"row":1,"column":30}},"text":" "}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":30},"end":{"row":1,"column":31}},"text":"n"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":31},"end":{"row":1,"column":32}},"text":"t"}]}],[{"group":"doc","deltas":[{"action":"removeText","range":{"start":{"row":1,"column":31},"end":{"row":1,"column":32}},"text":"t"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":31},"end":{"row":1,"column":32}},"text":"o"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":32},"end":{"row":1,"column":33}},"text":"t"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":33},"end":{"row":1,"column":34}},"text":" "}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":34},"end":{"row":1,"column":35}},"text":"m"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":35},"end":{"row":1,"column":36}},"text":"o"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":36},"end":{"row":1,"column":37}},"text":"d"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":37},"end":{"row":1,"column":38}},"text":"i"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":38},"end":{"row":1,"column":39}},"text":"f"}]}],[{"group":"doc","deltas":[{"action":"insertText","range":{"start":{"row":1,"column":39},"end":{"row":1,"column":40}},"text":"y"}]}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":1,"column":40},"end":{"row":1,"column":40},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1406538327501,"hash":"783152376173db0052fa68eb25a4df9b4ac12655"}