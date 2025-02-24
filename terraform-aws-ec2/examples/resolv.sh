#!/bin/bash
# Update /etc/resolv.conf with new nameservers
cat > /etc/resolv.conf <<EOL
search ec2.internal
search us-gov-west-1.compute.internal
nameserver 8.8.8.8
nameserver 8.8.4.4
# Test successful
EOL
