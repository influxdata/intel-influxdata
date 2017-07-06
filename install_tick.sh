#!/bin/bash

INFLUXDB_VERSION="1.2.4"
KAPACITOR_VERSION="1.3.2"
TELEGRAF_VERSION="1.3.1"
CHRONOGRAF_VERSION="1.3.3.1"

# Install Dependancies 
sudo apt-get update && sudo apt-get install wget

# Install InfluxDB
wget https://dl.influxdata.com/influxdb/releases/influxdb_$(INFLUXDB_VERSION)_amd64.deb
sudo dpkg -i influxdb_$(INFLUXDB_VERSION)_amd64.deb

# Install Telegraf
wget https://dl.influxdata.com/telegraf/releases/telegraf_$(TELEGRAF_VERSION)-1_amd64.deb
sudo dpkg -i telegraf_$(TELEGRAF_VERSION)-1_amd64.deb

# Install Kapacitor
wget https://dl.influxdata.com/kapacitor/releases/kapacitor_$(KAPACITOR_VERSION)_amd64.deb
sudo dpkg -i kapacitor_$(KAPACITOR_VERSION)_amd64.deb

# Install Chronograf
wget https://dl.influxdata.com/chronograf/releases/chronograf_$(CHRONOGRAF_VERSION)_amd64.deb
sudo dpkg -i chronograf_$(CHRONOGRAF_VERSION)_amd64.deb

# Delete the debs after installation
sudo rm *.deb

# Copy config files to proper locations and then restart 
cp ./influxdb.conf /etc/influxdb/influxdb.conf
cp ./kapacitor.conf /etc/kapacitor/kapacitor.conf
cp ./telegraf.conf /etc/telegraf/telegraf.conf

# Restart all processes
sudo systemctl restart influxdb
sudo systemctl restart kapacitor
sudo systemctl restart telegraf
