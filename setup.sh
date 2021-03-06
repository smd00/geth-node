#!/bin/bash

# =============================================
# Author: smd00
# URL: https://github.com/smd00/geth-node
# Cheat sheet: https://medium.com/@danielmontoyahd/cheat-sheet-parity-and-bitcoin-core-c370163fca44

# Usage:
# sudo chmod +x ./setup.sh
# ./setup.sh

# =============================================
# OPTIONAL: Setup additional volume to store data
echo "# START -----------------------------------------------------------------"
echo "# SMD00    mount volume"
echo "# END   -----------------------------------------------------------------"
lsblk #Check the volume name (i.e. xvdb)
sudo mkfs.ext4 /dev/xvdb #Format the volume to ext4 filesystem
sudo mkdir /dmdata #Create a directory to mount the new volume
sudo mount /dev/xvdb /dmdata/ #Mount the volume to dmdata directory
df -h /dmdata #Check the disk space to confirm the volume mount

#EBS Automount on Reboot
sudo cp /etc/fstab /etc/fstab.bak
echo "/dev/xvdb  /dmdata/  ext4    defaults,nofail  0   0" | sudo tee -a /etc/fstab #Make a new entry in /etc/fstab
sudo mount -a #Check if the fstab file has any errors

lsblk #List the available disks
sudo file -s /dev/xvdb #Check if the volume has any data

# =============================================
# SMD00
echo "# START -----------------------------------------------------------------"
echo "# SMD00    Enable Geth launchpad repository"
echo "# END   -----------------------------------------------------------------"
sudo add-apt-repository -y ppa:ethereum/ethereum

echo "# START -----------------------------------------------------------------"
echo "# SMD00    System updates"
echo "# END   -----------------------------------------------------------------"
sudo apt-get update

echo "# START -----------------------------------------------------------------"
echo "# SMD00    Install Geth"
echo "# END   -----------------------------------------------------------------"
sudo apt-get install ethereum -y

# echo "# START -----------------------------------------------------------------"
# echo "# SMD00    Copy parity.service and config.toml"
# echo "# END   -----------------------------------------------------------------"
# sudo mkdir /dmdata/io.parity.ethereum
# sudo mkdir -p $HOME/.local/share/io.parity.ethereum/
# cat $HOME/parity.service | sudo tee /etc/systemd/system/parity.service
# cat $HOME/config.toml | sudo tee $HOME/.local/share/io.parity.ethereum/config.toml

# sudo chmod +x /etc/systemd/system/parity.service

# sudo chown -R ubuntu:ubuntu /dmdata

# echo "# START -----------------------------------------------------------------"
# echo "# SMD00    Enable and start parity"
# echo "# END   -----------------------------------------------------------------"
# sudo systemctl enable parity
# sudo systemctl start parity

# sudo systemctl status parity
# journalctl -f -u parity.service