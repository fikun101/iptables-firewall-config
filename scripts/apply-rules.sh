#!/bin/bash

# Script to safely apply an iptables ruleset from file

RULESET_FILE="$1"

if [ -z "$RULESET_FILE" ]; then
  echo "Usage: $0 <ruleset-file>"
  exit 1
fi

if [ ! -f "$RULESET_FILE" ]; then
  echo "Error: File '$RULESET_FILE' not found."
  exit 2
fi

echo "Backing up current iptables rules..."
sudo iptables-save > /etc/iptables/backup.rules

echo "Applying rules from $RULESET_FILE..."
sudo iptables-restore < "$RULESET_FILE"

echo "Saving new rules permanently..."
sudo iptables-save > /etc/iptables/rules.v4

echo "Firewall rules applied and saved."


