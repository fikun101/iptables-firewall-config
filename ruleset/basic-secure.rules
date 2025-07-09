*filter

# Flush existing rules
-F

# Default policies
-P INPUT DROP
-P FORWARD DROP
-P OUTPUT ACCEPT

# Allow loopback interface
-A INPUT -i lo -j ACCEPT

# Allow established and related incoming connections
-A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Drop invalid packets
-A INPUT -m conntrack --ctstate INVALID -j DROP

# Allow SSH
-A INPUT -p tcp --dport 22 -j ACCEPT

# Log dropped packets (rate-limited)
-A INPUT -m limit --limit 5/min -j LOG --log-prefix "IPTables-Dropped: " --log-level 4

COMMIT
