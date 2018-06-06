# installation makefile - 
# tested against zabbix.com 3.x packages on ubuntu 16.04

all:
	@echo "usage: make install"

install: install-agent-config install-script

install-agent-config:
	install -o root -g root -m 644 userparameter_nvidia-smi.conf.linux \
		/etc/zabbix/zabbix_agentd.d/userparameter_nvidia-smi.conf

install-script:
	install -d -o root -g root -m 755 /etc/zabbix/scripts
	install -o root -g root -m 755 get_gpus_info.sh /etc/zabbix/scripts

