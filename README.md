# zabbix-nvidia-smi-multi-gpu
A zabbix template using nvidia-smi. Works with multiple GPUs. 

This is essentially a multi-GPU rewrite of RichardKav's template, as found here: https://github.com/RichardKav/zabbix-nvidia-smi-integration/

The following UserParameters need to be added to the zabbix-agent configuration: 

```
UserParameter=gpu.number,/usr/bin/nvidia-smi -L | /bin/grep GeForce | /usr/bin/wc -l
UserParameter=gpu.discovery,/etc/zabbix/scrips/get_gpus_info.sh
UserParameter=gpu.fanspeed[*],nvidia-smi --query-gpu=fan.speed --format=csv,noheader,nounits -i $1 | tr -d "\n"
UserParameter=gpu.power[*],nvidia-smi --query-gpu=power.draw --format=csv,noheader,nounits -i $1 | tr -d "\n"
UserParameter=gpu.temp[*],nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits -i $1 | tr -d "\n"
UserParameter=gpu.utilization[*],nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits -i $1 | tr -d "\n"
UserParameter=gpu.memfree[*],nvidia-smi --query-gpu=memory.free --format=csv,noheader,nounits -i $1 | tr -d "\n"
UserParameter=gpu.memused[*],nvidia-smi --query-gpu=memory.used --format=csv,noheader,nounits -i $1 | tr -d "\n"
UserParameter=gpu.memtotal[*],nvidia-smi --query-gpu=memory.total --format=csv,noheader,nounits -i $1 | tr -d "\n"
```

The get_gpus_info.sh file should be put in /etc/zabbix/scrips/ and made executable by running ```chmod +x get_gpus_info.sh```

If you feel like donating:

BTC: 165BPPrQSje6sUEaMCH9bFc35ioapjYZZh

XMR: 49K7M4EDgqPCx7o7WBc9keEdNdcj3asdNbHhJ69wbovc1s5v4UctEBLH8bF1byknVDUAB3D7p7w7oYiB4yBuNBPjVWwYHDD
