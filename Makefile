# installation makefile - 
# tested against zabbix.com 3.x packages on ubuntu 16.04

all:
	@echo "usage: make install"

install: install-agent-config install-script

install-agent-config:
	@installed=false; \
	if [ -d "/etc/zabbix/zabbix_agent2.d" ]; then \
		install -o root -g root -m 644 userparameter_nvidia-smi.conf.linux \
			/etc/zabbix/zabbix_agent2.d/userparameter_nvidia-smi.conf; \
		installed=true; \
	fi; \
	if [ -d "/etc/zabbix/zabbix_agentd.d" ]; then \
		install -o root -g root -m 644 userparameter_nvidia-smi.conf.linux \
			/etc/zabbix/zabbix_agentd.d/userparameter_nvidia-smi.conf; \
		installed=true; \
	fi; \
	if [ "$$installed" = "false" ]; then \
		echo "Error: Neither zabbix-agent nor zabbix-agent2 directory found"; \
		exit 1; \
	fi

install-script:
	install -d -o root -g root -m 755 /etc/zabbix/scripts
	install -o root -g root -m 755 get_gpus_info.sh /etc/zabbix/scripts

