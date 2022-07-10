#!/bin/bash
# How do I SSH to machine A via B in one command?
cat >> .ssh/config << EPF
Host unibroker          # Machine B definition (the broker)
Hostname 12.34.45.56    # Change this IP address to the address of the broker
User myusername         # Change this default user accordingly 
                        # (`user@unibroker` can overwrite it)

Host internalmachine    # Machine A definition (the target host)
ProxyCommand ssh -q unibroker nc hostname.or.IP.address.internal.machine 22
IdentityFile your_key_on_local
# "Too many Authentication Failures" issue.
IdentitiesOnly=yes
EOF
