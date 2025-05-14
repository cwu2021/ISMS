#!/bin/bash
# to list gmail SPF records with MX and TXT.
dig mx gmail.com
dig txt gmail.com
dig txt _spf.google.com
# AWS <- opensmtpd as smarthost relay to unblock.
# OpenSMTPD 7.7.0p0 released
