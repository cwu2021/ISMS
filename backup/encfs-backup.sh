#!/bin/bash
encfs ~/.encrypted ~/decrypted
fusermount -u ~/decrypted
# How likely is it to have encFS not recognize a valid password? #442
# https://github.com/vgough/encfs/issues/442
reboot
# Post-Quantum Cryptography with TutaCrypt https://www.admin-magazine.com/Archive/2025/86/Post-Quantum-Cryptography-with-TutaCrypt
:'
Sensitive data should never be stored in the clear, but encrypting data often requires dealing with the GnuPG juggernaut. v02enc takes the worries out of encryption with a simple process, shell-based access, and storage in Git directories.
'
