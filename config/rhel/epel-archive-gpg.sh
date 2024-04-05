# https://www.centos.org/keys/#centos-6-keys 
# https://community.tenable.com/s/article/How-to-resolve-the-error-message-Header-V4-RSA-SHA1-Signature-key-ID-1c0c4a5d-NOKEY?language=en_US 
# https://wiki.centos.org/zh(2d)tw(2f)Download(2f)Verify.html 
gpg --import RPM-GPG-KEY-CentOS-6.txt gpg --verify ./sha256sum.txt.asc
# https://vault.centos.org/6.10/isos/i386/ # https://dl.fedoraproject.org/pub/archive/epel/
