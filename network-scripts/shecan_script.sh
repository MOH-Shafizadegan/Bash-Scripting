#!/bin/bash
# This script changes the DNS server 

# Backup the current resolv.conf file
cp /etc/resolv.conf /etc/resolv.conf.bak

# Create a new resolv.conf file with the desired DNS server
echo "nameserver 178.22.122.100" > /etc/resolv.conf

echo Your DNS have changed successfully!
