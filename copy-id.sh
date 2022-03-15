#!/bin/bash
password=123456

for host in `cat inventory | grep -v '\[\|\]\|^$'|sort|uniq`
do
	expect -c "
	spawn ssh-copy-id root@$host
	        expect {
	                \"*yes/no*\" { send \"yes\r\";exp_continue }
	                \"*password*\" { send \"$password\r\";exp_continue }
	        }
	"
done
