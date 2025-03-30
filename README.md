# zabbix-nvidia-smi-multi-gpu
A Zabbix template using nvidia-smi. Works with multiple GPUs on Windows and Linux.

Fork from https://github.com/plambe/zabbix-nvidia-smi-multi-gpu.

## Features

- Low-level discovery of all the graphics cards
- Item prototypes for:
  - Fan speed
  - Total, free and used memory
  - Power draw in decawatts (tens of watts, so that it can fit in the graphs nicely)
  - Temperature
  - Utilization
- A graph prototype showing fan speed, power draw and temperature in one graph
- Trigger prototypes set at different GPU temperatures
- A batch script for low-level discovery on Windows
- A Bash script for low-level discovery on Linux

Events caused by the triggers:
![Triggers:](https://steemitimages.com/DQmNbgRSxa7LRbaaJszCdHbDEPM5wwCpKGUFJtibWEsBwTY/image.png)

And the graphs: 
![Graphs](https://steemitimages.com/DQmPSwfNoERQ13wrR8YeqdjSfDJpAiECXKSMzUjwaoLYkaG/image.png)

This is essentially a multi-GPU rewrite of RichardKav's template, as found here: https://github.com/RichardKav/zabbix-nvidia-smi-integration/

## Configuration

### On Windows

* Add the contents of the file `userparameter_nvidia-smi.conf.windows` to your `zabbix_agentd.conf` file.
* The Windows script `get_gpus_info.bat` file should be placed in `C:\scripts\`.
* It doesn't have any dependencies other than having `nvidia-smi.exe`.
* Of course, it is possible to use other paths, but: 
  * If you change `C:\scripts\`, you need to update the `UserParameter=gpu.discovery` line in `zabbix_agentd.conf`.
  * If you have installed `nvidia-smi.exe` in an alternate location, you need to update both the `get_gpus_info.bat` and the `zabbix_agentd.conf`.

### On Linux

The following UserParameters need to be added to the zabbix-agent configuration: 
* Add the contents of the file `userparameter_nvidia-smi.conf.linux` to your `zabbix_agentd.conf` file.
* The `get_gpus_info.sh` file should be placed in `/etc/zabbix/scripts/` and made executable by running `chmod +x get_gpus_info.sh`.

### Using the Makefile on Linux

To simplify the setup process on Linux, a Makefile is provided. Follow these steps:
1. Navigate to the project directory:
2. Run the following command to install the necessary files:
   ```bash
   make install
   ```
This will:
- Copy `userparameter_nvidia-smi.conf.linux` to the appropriate Zabbix configuration directory.
- Copy `get_gpus_info.sh` to `/etc/zabbix/scripts/` and set the executable permission.
3. Restart the Zabbix agent to apply the changes:
   ```bash
   sudo systemctl restart zabbix-agent
   ```
