#!/bin/bash

sudo apt-get update && sudo apt-get install wget

# First install each of the components
# Each comes with systemd unit files to manage

# Install InfluxDB
wget https://dl.influxdata.com/influxdb/releases/influxdb_1.2.4_amd64.deb
sudo dpkg -i influxdb_1.2.4_amd64.deb

# Install Telegraf
wget https://dl.influxdata.com/telegraf/releases/telegraf_1.3.2-1_amd64.deb
sudo dpkg -i telegraf_1.3.2-1_amd64.deb

# Install Kapacitor
wget https://dl.influxdata.com/kapacitor/releases/kapacitor_1.3.1_amd64.deb
sudo dpkg -i kapacitor_1.3.1_amd64.deb

# Install Chronograf
wget https://dl.influxdata.com/chronograf/releases/chronograf_1.3.3.1_amd64.deb
sudo dpkg -i chronograf_1.3.3.1_amd64.deb

# Delete the debs after installation
# sudo rm *.deb
