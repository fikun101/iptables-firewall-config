# Firewall Ruleset Test Cases

This document outlines the steps used to validate each iptables ruleset. All tests were performed using a second VM on the same virtual network.

---

## Test Environment
- **Target System:** Kali Linux with applied iptables rules
- **Attacker/Test VM:** Ubuntu or Kali
- **Network Mode:** Bridged or NAT with host-only adapter
- **Tools:** `ping`, `nmap`, `curl`, `ssh`, `tcpdump`

---

## 1. Ping Test
### Purpose:
Check if ICMP traffic is blocked (by default, not allowed)
```bash
ping <target_ip>
```
**Expected Result:** No reply (Request timed out)

---

## 2. SSH Access Test
### Purpose:
Validate if port 22 is open for remote login
```bash
ssh user@<target_ip>
```
**Expected Result:** SSH connection succeeds if allowed by ruleset

---

## 3. Web Access Test (HTTP/HTTPS)
### Purpose:
Check if web ports are open when expected
```bash
curl http://<target_ip>
curl https://<target_ip>
```
**Expected Result:** Web content retrieved (if allowed), else connection refused

---

## 4. Port Scan Test
### Purpose:
Detect which ports are visible externally
```bash
nmap -Pn -sS <target_ip>
```
**Expected Result:** Only allowed ports (e.g., 22, 80, 443) are shown; others are filtered

---

## 5. Log File Review
### Purpose:
Ensure dropped traffic is being logged properly
```bash
sudo tail -f /var/log/syslog | grep IPTables
```
**Expected Result:** Dropped packets logged with matching prefix

---

## Notes
- Run tests **after each ruleset change**
- Use `iptables -L -v` to confirm rule counters update during testing
- Always backup iptables state before switching rulesets
