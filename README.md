# iptables-firewall-ruleset

## Overview
This project demonstrates how to configure a secure Linux firewall using `iptables`. It includes rulesets for blocking unauthorized traffic, allowing essential services like SSH and HTTP, and logging dropped packets. All configurations were tested in a virtual lab environment.

## Objectives
- Set up a default-deny firewall using `iptables`
- Allow specific services (e.g., SSH, HTTP)
- Log dropped packets for monitoring
- Persist and restore rules using `iptables-persistent`
- Test firewall behavior with real-world tools

## Environment
- OS: Kali Linux / Debian-based VM
- Tools: `iptables`, `iptables-persistent`, `nmap`, `curl`, `tcpdump`
- Optional: Second VM for testing blocked/allowed traffic

## File Structure
```
iptables-firewall-ruleset/
├── README.md
├── ruleset/
│   ├── basic-secure.rules
│   ├── ssh-only.rules
│   ├── webserver.rules
├── scripts/
│   └── apply-rules.sh
├── tests/
│   ├── test-cases.md
├── report/
│   └── iptables_firewall_report.md
```

## How to Use
1. Clone the repository
2. Apply a ruleset using the script or manually
3. Test access from another machine or VM
4. Review logs and adjust rules as needed

## Example
```bash
sudo iptables-restore < ruleset/basic-secure.rules
```

