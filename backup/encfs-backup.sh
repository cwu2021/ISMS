#!/bin/bash
encfs ~/.encrypted ~/decrypted
fusermount -u ~/decrypted
# How likely is it to have encFS not recognize a valid password? #442
# https://github.com/vgough/encfs/issues/442
reboot
# Post-Quantum Cryptography with TutaCrypt https://www.admin-magazine.com/Archive/2025/86/Post-Quantum-Cryptography-with-TutaCrypt
# https://www.ithome.com.tw/news/171941 Cloudflare與Chrome啟動Merkle Tree Certificates（MTCs）測試，測試能否在不增加延遲的情況下導入後量子安全性，當實驗結果正面，便可納入WebPKI作為後量子認證的過渡方案
:'
Sensitive data should never be stored in the clear, but encrypting data often requires dealing with the GnuPG juggernaut. v02enc takes the worries out of encryption with a simple process, shell-based access, and storage in Git directories.
'
