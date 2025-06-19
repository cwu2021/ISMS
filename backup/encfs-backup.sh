#!/bin/bash
encfs ~/.encrypted ~/decrypted
fusermount -u ~/decrypted
# How likely is it to have encFS not recognize a valid password? #442
# https://github.com/vgough/encfs/issues/442
reboot
# Post-Quantum Cryptography with TutaCrypt https://www.admin-magazine.com/Archive/2025/86/Post-Quantum-Cryptography-with-TutaCrypt
