#!/usr/bin/env ksh
#
# Copyright (c) 2018-2021 Jordan Geoghegan <jordan@geoghegan.ca>
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE
# OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.

# Version 0.5 "Psychological Operations" -- Released January 10, 2021

# In loving memory of Ron Sather

# Obnoxious until they shoot me on the day I retire

# This script downloads some of the most popular IP Blocklists, but you can add
# any lists you like.

# IPv4 or IPv6 lists containing individual addresses or CIDR blocks are supported.
# The address parser also supports mixed lists.

# Scroll down to to the "User Configuration Area" - there you can configure:
#    IPv6, Authlog Analysis, GeoIP/Country Blacklisting, Bogon Filtering,
#    Tor filtering as well as configure custom rules and blocklists

# IPv6 Notes:
# pf-badhost requires IPv6 lists to be preformatted to be RFC-5952 compliant.
# Example preprocessors have been written for the default list providers included in this script.
# If adding your own IPv6 lists, the addresses must be RFC 5952 compliant and
# have one address per line with no leading or trailing whitespace.

version='0.5p0'
release_date='2021-01-10'
release_name='Psychological Operations'

set -ef #-o pipefail

# ###########################################################################
# ------------------------------------------------------------------------------
# User Configuration Area -- BEGIN
# ------------------------------------------------------------------------------

# Configure additional lists as you see fit
# Custom IPv4 lists should "Just Work"
# Custom IPv6 lists may require preprocessing due to
# strict/difficult regex matching and validation logic

# Set to '1' to enable
# Set to '0' to disable

# pf-badhost requires a modern shell that has support for
# the non-POSIX 'typeset' feature and ksh array syntax.
# ---
# By default pf-badhost looks for 'ksh' in the users $PATH
# pf-badhost also supports the following shells:
#     oksh, ksh93, bash, or zsh
#
# To use a shell other than ksh:
#    1) Update the shebang line (line 1) of this script to that of the new shell you've installed

# HTTP user agent override (Pretend to be Firefox on Win10 by default)
# Note: The "fetch" utility on FreeBSD and Dragonfly doesnt support user agent override. Use 'curl' instead
_AGENT="Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:83.0) Gecko/20100101 Firefox/83.0"

# Enable Logging to /var/log/pf-badhost/
_LOG=1

# Enable Strict Mode
# (This option tells pf-badhost to abort if it exceeds maximum retrys)
_STRICT=1

# Max Download Attempts (How many times we'll attempt to download a file before giving up)
_RETRY=3

# Enable IPv4
_IPV4=1

# Enable IPv6
_IPV6=0

# Enable Subnet Aggregation
_AGGREGATE=0

# Enable Geoblocking / Country Blacklisting
_GEOBLOCK=0

# Enable IPv4 Bogon Filter (Blocks unassigned/reserved/martian addresses)
_BOGON_4=0

# Enable IPv6 Bogon Filter (Blocks unassigned/reserved/martian addresses)
_BOGON_6=0

###################################################################
# Hail Mary Cloud Bruteforcer Mitigation (SSH authlog analysis)
# Searches SSH authlog for bruteforcers
#
# Set to '1' to enable
  _HAIL_MARY=0
#
# Set failed log-in limit for bans
  _LOGIN_LIMIT=25
###################################################################

###################################################################
# Country GeoIP Blacklist
# Enter any ISO-3166 Country Codes you want to block (1 per line)
# Lines below starting with '#' or ';' will be ignored
_COUNTRY_CODES=$(cat <<'__EOT'
# CN
# IR
# KP
__EOT
)
###################################################################

###################################################################
# ASN Filtering
# Enter any network ASN you want to block (1 per line)
# Lines below starting with '#' or ';' will be ignored
_ASN_LIST=$(cat <<'__EOT'
# AS64496
__EOT
)
###################################################################

###################################################################
# Block Lists
# Enter URL to any IP blocklist
# IPv4 Supports arbitrary list formating including: JSON, XML, CSV, HTML
# IPv6 Requires preformatted lists (1 address per line)
# Lines below starting with '#' or ';' will be ignored
# Lists may optionally be gzip compressed
#---
# NOTE: DO NOT put quotes in here, as there is a bug in most pdksh
# (including default shells of NetBSD and OpenBSD) that makes the
# shell puke when quotes are used within a HEREDOC statement as below
# See: https://marc.info/?l=openbsd-misc&m=160560808529209&w=2
_BLOCKLISTS=$(cat <<'__EOT'
### Local File Example
# file:/path/to/local/file

### Download popular IPv4 blocklists
https://www.binarydefense.com/banlist.txt
https://rules.emergingthreats.net/blockrules/compromised-ips.txt
https://rules.emergingthreats.net/fwrules/emerging-Block-IPs.txt
https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/firehol_level1.netset
https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/firehol_level2.netset
### Firehol level 3 can be a little aggressive.
### Ill leave it up to users to choose to enable.
# https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/firehol_level3.netset

### Spamhause DROP lists (Dont Route Or Peer)
https://www.spamhaus.org/drop/drop.txt
https://www.spamhaus.org/drop/edrop.txt
https://www.spamhaus.org/drop/dropv6.txt

### Block Shodan
https://isc.sans.edu/api/threatlist/shodan/?text

### Block botnets + command and control servers
https://feodotracker.abuse.ch/downloads/ipblocklist.txt
https://sslbl.abuse.ch/blacklist/sslipblacklist.txt

### Optional lists -- uncomment to enable

### Block IPv4 Martians
# https://www.team-cymru.org/Services/Bogons/bogon-bn-agg.txt

### Ozgur Kazancci Community Block List
### This is a list of IPs that Ozgur has found
### to have been missed by the pf-badhost default lists
# https://ozgur.kazancci.com/ban-me.txt

### StopForumSpam.com Toxic IP Ranges
### Download Rate limited to 24/day, so disabled by default
# https://www.stopforumspam.com/downloads/toxic_ip_cidr.txt
# https://www.stopforumspam.com/downloads/listed_ip_1_ipv46.gz

### Blocklist.de - uncomment to enable

### Combined list of all blocklist.de lists
# https://lists.blocklist.de/lists/all.txt

### SSH attackers
# https://lists.blocklist.de/lists/22.txt
# https://lists.blocklist.de/lists/ssh.txt
# https://lists.blocklist.de/lists/bruteforcelogin.txt

### FTP attackers
# https://lists.blocklist.de/lists/21.txt
# https://lists.blocklist.de/lists/ftp.txt
# https://lists.blocklist.de/lists/proftpd.txt

### HTTP/Apache attackers
# https://lists.blocklist.de/lists/80.txt
# https://lists.blocklist.de/lists/443.txt
# https://lists.blocklist.de/lists/apache.txt

### SMTP/E-Mail Attackers
# https://lists.blocklist.de/lists/25.txt
# https://lists.blocklist.de/lists/110.txt
# https://lists.blocklist.de/lists/143.txt
# https://lists.blocklist.de/lists/993.txt
# https://lists.blocklist.de/lists/email.txt
# https://lists.blocklist.de/lists/mail.txt
# https://lists.blocklist.de/lists/imap.txt
# https://lists.blocklist.de/lists/courierimap.txt
# https://lists.blocklist.de/lists/courierpop3.txt
# https://lists.blocklist.de/lists/pop3.txt
# https://lists.blocklist.de/lists/postfix.txt

### VOIP/SIP Attackers
# https://lists.blocklist.de/lists/asterisk.txt
# https://lists.blocklist.de/lists/sip.txt

### IRC / Bots
# https://lists.blocklist.de/lists/ircbot.txt
# https://lists.blocklist.de/lists/bots.txt

__EOT
)
###################################################################

###################################################################
# User Defined Rules: (add or negate addresses and ranges from block list)
# You can add as many rules as you like here
# Lines below starting with '#' or ';' will be ignored
_USER_RULES=$(cat <<'__EOT'

### Examples: (uncomment to enable)
# !169.254.169.254
# !2001:19f0:ffff::1
# !255.255.255.255

# Multicast
# 224.0.0.0/3

### NAT64/DNS64 Discovery
# !192.0.0.170
# !192.0.0.171

### Carrier Grade NAT (RFC 6598) Address Space
# !100.64.0.0/10

### Unique Local IPv6
# !fc00::/7

__EOT
)
###################################################################

###################################################################
# Tor Filtering
#
# Please be aware that Tor whitelisting/blacklisting options
# are mutually exclusive - ie enabling multiple Tor options is considered
# an error condition and the script will abort
#
# This will ensure traffic to and from Tor is permitted to pass freely
  _TOR_WHITELIST=0
#
# Block Tor
# Think VERY carefully before enabling this, as you will
# inevitably piss off a lot of people
  _TOR_BLOCK_ALL=0   # Block ALL tor nodes (exit, relay etc)
  _TOR_BLOCK_EXIT=0  # Block Tor exit nodes
###################################################################

###################################################################
# Global Whitelist and List Filtering
# Supports IPv4 and IPv6 addresses with optional CIDR notation
#
# By default pf-badhost does not permit the address ranges specified
# in RFC3330 & RFC5156 unless manually specified as a custom rule.
# To disable this behavior, set the 2 options below to '0' 
  _RFC3330=1
  _RFC5156=1
#
# Manual filtering and whitelisting:
# It usually makes more sense to negate an address using a custom
# rule (specified above) rather than using the whitelist.
#
# The whitelist function can be used to perform arbitrary filtering
# Use at your own risk.
#
  _WHITELIST=0	# Set to '1' to enable
WHITELIST() {
	# Add as many entries to the whitelist as you like
	mygrep -v -e '192\.0\.2\.5' -e '2001:db8::/69'
}
#
###################################################################

###################################################################
# Preprocessor Functions
# Add any IP list formating/preprocessing logic you like here
#
# SpamHause IPv6 Preprocessor
EXAMPLE_PROC() {
	awk '{print $1}'
}
###################################################################

###################################################################
# Custom Lists
#
# Add any lists here that require preformatting or special treatment
#
CUSTOM_LISTS() {
	# Custom List Example:
	# URL_FETCH https://www.example.com/example.txt - | EXAMPLE_PROC > "$(TMP_FILE)"

	true
}
# ------------------------------------------------------------------------------
# User Configuration Area -- END
# ------------------------------------------------------------------------------
###################################################################

# (Do not edit below this line unless you know what you're doing)

# ------------------------------------------------------------------------------
# Abort Sequences and Housekeeping
# ------------------------------------------------------------------------------

ABORT() {
	WARN_ERR "ERROR: '/etc/pf-badhost.txt' contains invalid data! Reverting changes and bailing out..."
	OLD_CONF_RESET
	TRAPPER
}

CLEANUP() {
	rm -rf -- "${listdir}" "${geodir}" "${scratchdir}" "${workdir}" || WARN_ERR 'ERROR: Failed to delete temporary files!'
}

ERR() {
	echo '' 1>&2 ; printf 'ERROR: %s\nBailing out without making changes...\n' "$*" | logger -t 'pf-badhost' -s
	TRAPPER
}

HELP_MESSAGE() {
	printf '\n###################################################################\n'
	printf '# pf-badhost %s (%s)  Released on: %s\n' "${version}" "${release_name}" "${release_date}"
	printf '# Copyright 2018-2021 Jordan Geoghegan <jordan@geoghegan.ca>\n#\n'
	printf '# pf-badhost blocks malicious IP addresses using the power of the PF firewall\n#\n'
	printf '# Supported Operating Systems:\n#\n# * OpenBSD\n# * FreeBSD\n# * NetBSD\n# * DragonflyBSD\n# * MacOS\n#\n'
	printf '# OS Type Can Be Specified As An Argument:\n'
	printf '# Example: "pf-badhost -O DragonflyBSD"\n#\n'
	printf '# NOTE: OS arguments are case insensitive\n#\n'
	printf '# The man page can be found at:\n'
	printf '#    https://geoghegan.ca/pub/pf-badhost/0.5/man/man.txt\n'
	printf '###################################################################\n\n'
}

OLD_CONF_RESET() {
	cp -- "${oldconf}" /etc/pf-badhost.txt || WARN_ERR 'ERROR: Failed to to restore previous blocklist!'
	if ! "${getroot}" -- "${pfctl}" -nf /etc/pf.conf ; then
		WARN_ERR 'ERROR: old pf-badhost.txt also has bad data!'
		WARN_ERR 'Clearing /etc/pf-badhost.txt and bailing out...'
		cp /dev/null /etc/pf-badhost.txt || WARN_ERR "ERROR: Failed to clear '/etc/pf-badhost.txt'"
	fi
}

TMP_FILE_ABORT() {
	ERR 'Failed to create and/or write to a temporary file! Please ensure that "/tmp" has free space!'
}

TRAP_ABORT() {
	ERR "Interupt or uncaught error detected.."
}

TRAPPER() {
	CLEANUP ; exit 1
}

WARNING() {
	if [ "${_VERBOSE}" -eq 0 ] && [ "${_LOG}" -eq 1 ]; then
		WARN_ERR "$*" >/dev/null 2>&1
	elif [ "${_VERBOSE}" -eq 1 ] && [ "${_LOG}" -eq 0 ]; then
		printf '\n%s\n\n' "$*" 1>&2
	elif [ "${_VERBOSE}" -eq 0 ] && [ "${_LOG}" -eq 0 ]; then
		true
	else
		WARN_ERR "$*"
	fi
}

WARN_ERR() {
	# Force printing and logging of error messages
	echo '' 1>&2
	logger -t 'pf-badhost' -s -- "$*"
	echo '' 1>&2
}

# ------------------------------------------------------------------------------
# Alias functions
# ------------------------------------------------------------------------------

# Opportunistically use mawk or GNU awk if they're available
myawk() {
	if command -v mawk >/dev/null 2>&1 ; then
		nice mawk "$@" -
	elif command -v gawk >/dev/null 2>&1 ; then
		nice gawk "$@" -
	else
		nice awk "$@" -
	fi
}

# Users must expicitely set the "netget" var to overide platform default fetch util
# Use '-F' to set fetch util preference from commandline
myfetch() {
	typeset _cmd="$(CHECK_CMD "${netget}")"
	case "${netget}" in
	    curl)  nice "${_cmd}" -o - -s -A "${_AGENT}" -m 900 -- "$@" ;;
	    fetch) nice "${_cmd}" -o - -q -- "$@" ;;
	    ftp)   nice "${_cmd}" -o - -V -U "${_AGENT}" -w 30 -- "$@" ;;
	    wget)  nice "${_cmd}" -O - -q -U "${_AGENT}" --timeout=900 -- "$@" ;;
	    *)     ERR "${_cmd} not found!"
	esac
}

# Opportunistically use RipGrep or GNU grep if they're available
mygrep() {
	if command -v rg >/dev/null 2>&1 ; then
		nice rg "$@" - || true
	elif command -v ggrep >/dev/null 2>&1 ; then
		nice ggrep -E "$@" - || true
	else
		nice grep -E "$@" - || true
	fi
}

# Opportunistically use GNU sort if available (needed for NetBSD support)
mysort() {
	if command -v gsort >/dev/null 2>&1 ; then
		nice gsort "$@" -
	else
		nice sort "$@" -
	fi
}

# ------------------------------------------------------------------------------
# Authlog Analysis Functions
# ------------------------------------------------------------------------------

# Hail Mary Mitigation preproccessor
AUTHLOG_PROC() {
	myawk -- '{if ($6 !~ "Disconnected|Accepted" && $7 !~ "disconnect") printf("%s\n%s\n%s\n%s\n%s\n%s\n", $9, $10, $11, $12, $13, $14)}'
}

HAIL_MARY_MITIGATE() {
	# Check OSTYPE
	if [ "${_OS_TYPE}" != 'macos' ]; then
		# IPv4 Authlog List Gen
		if [ "${_IPV4}" -eq 1 ]; then
			"${getroot}" -- "${authlog_unzip}" -f "${authlog_path1}" "${authlog_path2}" | AUTHLOG_PROC | PARSE_V4 | WHITELIST_FILTER | myawk -- '{ a[$0]++ }END{ for(i in a) print a[i],i }' | myawk -v LOGIN_LIMIT="${_LOGIN_LIMIT}" -- '$1>LOGIN_LIMIT {print $2}' | mysort -uV
		fi
		# IPv6 Authlog List Gen
		if [ "${_IPV6}" -eq 1 ]; then
			"${getroot}" -- "${authlog_unzip}" -f "${authlog_path1}" "${authlog_path2}" | AUTHLOG_PROC | PARSE_V6 | WHITELIST_FILTER | myawk '{ a[$0]++ }END{ for(i in a) print a[i],i }' | myawk -v LOGIN_LIMIT="${_LOGIN_LIMIT}" -- '$1>LOGIN_LIMIT {print $2}' | mysort -uV
		fi
	else
		echo 'MacOS does not support authlog analysis :(' 1>&2
	fi > "${authlog}"
}

# ------------------------------------------------------------------------------
# Geoblock Functions
# ------------------------------------------------------------------------------

GEO_ASN() {
	# Parse GeoIP data registered as ASN rather than IP range (prints ASN to feed to _asn_array[])
	typeset -u _cc
	for _cc in "${_country_code[@]}" ; do
		find "${geodir}" -type f -exec cat -- {} + | myawk -v country="${_cc}" -F '|' -- '{if ($2 == country && $3 == "asn") printf("AS%s\n", $4)}'
	done | mysort -u
}

GEOBLOCKER() {
	typeset -u _cc
	# Test if awk includes patch from June 12 2020: [ https://github.com/onetrueawk/awk/pull/80 ]
	if [ "${awk_patch}" -eq 1 ]; then
		# Generate Country IP CIDR Blocks
		for _cc in "${_country_code[@]}" ; do
			find "${geodir}" -type f -exec cat -- {} + | myawk -v country="${_cc}" -v IPV4="${_IPV4}" -v IPV6="${_IPV6}" -F '|' -- '{if (IPV4 == 1 && $2 == country && $3 == "ipv4") printf("%s/%d\n", $4, 32-log($5)/log(2))} {if (IPV6 == 1 && $2 == country && $3 == "ipv6") printf("%s/%d\n", $4, $5)}'
		done > "$(TMP_FILE)"
	else
		# [Workaround] Generate Country IP CIDR Blocks
		WARNING 'awk does not appear to have June 12 2020 patches installed.'
		WARNING 'Using workaround geoblock function...'
		for _cc in "${_country_code[@]}" ; do
			if [ "${_IPV4}" -eq 1 ]; then
				find "${geodir}" -type f -exec cat -- {} + | myawk -v country="${_cc}" -F '|' -- '{if ($2 == country && $3 == "ipv4") print($4, $5)}' | myawk -- '{printf("%s/%d\n", $1, 32-log($2)/log(2))}'
			fi
			if [ "${_IPV6}" -eq 1 ]; then
				find "${geodir}" -type f -exec cat -- {} + | myawk -v country="${_cc}" -F '|' -- '{if ($2 == country && $3 == "ipv6") printf("%s/%d\n", $4, $5)}'
			fi
		done > "$(TMP_FILE)"
	fi
}

# ------------------------------------------------------------------------------
# IP Validator Functions and Input Sanitization
# ------------------------------------------------------------------------------

# Validates IPv4 addresses (can pull addresses from arbitrarily formatted text, thanks to "grep -o"
PARSE_V4() {
	# Replace use of grep with ripgrep or GNU grep for a large performance increase
	mygrep -o -- '((25[0-5]|(2[0-4]|1{0,1}[[:digit:]]){0,1}[[:digit:]])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[[:digit:]]){0,1}[[:digit:]])(/(3[0-2]|[1-2][[:digit:]]|[1-9]))?'
}

# Validates IPv6 addresses (Addresses must be RFC-5952 Compliant and have one address per line)
# Many IPv6 address lists require a preprocessor to format the lists/addresses correctly for validation
PARSE_V6() {
	# Replace use of grep with ripgrep or GNU grep for a large performance increase
	SANITIZE_ARRAY_NO_SORT | mygrep -x -- '(([[:xdigit:]]{1,4}:){7,7}[[:xdigit:]]{1,4}|([[:xdigit:]]{1,4}:){1,7}:|([[:xdigit:]]{1,4}:){1,6}:[[:xdigit:]]{1,4}|([[:xdigit:]]{1,4}:){1,5}(:[[:xdigit:]]{1,4}){1,2}|([[:xdigit:]]{1,4}:){1,4}(:[[:xdigit:]]{1,4}){1,3}|([[:xdigit:]]{1,4}:){1,3}(:[[:xdigit:]]{1,4}){1,4}|([[:xdigit:]]{1,4}:){1,2}(:[[:xdigit:]]{1,4}){1,5}|[[:xdigit:]]{1,4}:((:[[:xdigit:]]{1,4}){1,6})|:((:[[:xdigit:]]{1,4}){1,7}|:)|[fF][eE]80:(:[[:xdigit:]]{0,4}){0,4}%[[:alnum:]]{1,}|::([fF]{4}(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[[:digit:]]){0,1}[[:digit:]])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[[:digit:]]){0,1}[[:digit:]])|([[:xdigit:]]{1,4}:){1,4}:((25[0-5]|(2[0-4]|1{0,1}[[:digit:]]){0,1}[[:digit:]])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[[:digit:]]){0,1}[[:digit:]]))(/(12[0-8]|1[0-1][[:digit:]]|[1-9][[:digit:]]{0,1}))?'
}

PRIVATE_ADDRESS_FILTER() {
	# Allow all private address ranges in blocklist by default (may break stuff)
	if [ "${_RFC3330}" -ne 1 ] && [ "${_RFC5156}" -ne 1 ]; then
		# Pipe through cat to avoid wasting cpu cycles on grep
		cat
	# Allow RFC5156 addresses in blocklist, filter out RFC3330 addresses 
	elif [ "${_RFC3330}" -eq 1 ] && [ "${_RFC5156}" -ne 1 ]; then
		RFC3330_FILTER
	# Allow RFC3330 addresses in blocklist, filter out RFC5156 addresses 
	elif [ "${_RFC3330}" -ne 1 ] && [ "${_RFC5156}" -eq 1 ]; then
		RFC5156_FILTER
	# Make sure RFC 3330 & 5156 addresses are not in blocklist	
	else
		RFC3330_FILTER | RFC5156_FILTER
	fi
}

RFC3330_FILTER() {
	mygrep -v '^0\.0\.0\.0/8|^10\.0\.0\.0/8|^14\.0\.0\.0/8|^24\.0\.0\.0/8|^39\.0\.0\.0/8|^127\.0\.0\.0/8|^128\.0\.0\.0/16|^169\.254\.0\.0/16|^172\.16\.0\.0/12|^191\.255\.0\.0/16|^192\.0\.0\.0/24|^192\.0\.2\.0/24|^192\.88\.99\.0/24|^192\.168\.0\.0/16|^198\.18\.0\.0/15|^223\.255\.255\.0/24|^224\.0\.0\.0/4|^224\.0\.0\.0/3|^240\.0\.0\.0/4'
}

RFC5156_FILTER() {
	mygrep -vi '^::FFFF:0:0/96|^fe80::/10|^fc00::/7|^2001:db8::/32|^2002::/16|^2001::/32|^5f00::/8|^3ffe::/16|^2001:10::/28|^ff00::/8'
}

SANITIZE_ARRAY() {
	mygrep -v -- '^#|^;|^[[:space:]]*#|^[[:space:]]*;|^[[:space:]]*$' | myawk -- '{print $1}' | mysort -u
}

SANITIZE_ARRAY_NO_SORT() {
	mygrep -v -- '^#|^;|^[[:space:]]*#|^[[:space:]]*;|^[[:space:]]*$' | myawk -- '{print $1}'
}

SANITIZE_COUNTRY_CODES() {
	# Normalize user-provided country codes
	printf '%s\n' "${_COUNTRY_CODES}" | tr '[:lower:]' '[:upper:]' | SANITIZE_ARRAY_NO_SORT | mygrep -- '^[[:upper:]]{2}$' | mysort -u
}

# ------------------------------------------------------------------------------
# List Generation Functions
# ------------------------------------------------------------------------------

LIST_GEN() {
	# Make sure there are no empty files in listdir
	find "${listdir}" -type f -size 0 -delete || WARN_ERR 'ERROR: Failed to delete temporary files!'

	# Filter and Generate IP Address List
	if [ "${_AGGREGATE}" -eq 1 ]; then
		### IPv6 Stuff
		if [ "${_IPV6}" -eq 1 ]; then
			if [ "${agg6}" -eq 1 ]; then
				find "${listdir}" -type f -exec gunzip -dcf -- {} + | PARSE_V6 | SUB_AGG_6 > "${v6list}" || TMP_FILE_ABORT
			else
				WARNING 'aggregate6 utility not found, unable to aggregate IPv6 addresses...'
				readonly IPV6_PROC=1 ; find "${listdir}" -type f -exec gunzip -dcf -- {} + | PARSE_V6 | tr '[:upper:]' '[:lower:]' | mysort -uV > "${v6list}" || TMP_FILE_ABORT
			fi
		fi

		### IPv4 Stuff
		if [ "${_IPV4}" -eq 1 ]; then
			# Prefer aggy as it's 100 to 1000 times faster than the alternatives
			if [ "${go_agg}" -eq 1 ]; then
				WARNING 'Using experimental "aggy" aggregator...'
				find "${listdir}" -type f -exec gunzip -dcf -- {} + | PARSE_V4 | SUB_AGG_GO > "${v4list}" || TMP_FILE_ABORT
			# Prefer the C based 'aggregate' util over the Python based 'aggregate6' util
			elif [ "${agg4}" -eq 1 ] && [ "${agg6}" -eq 1 ]; then
				find "${listdir}" -type f -exec gunzip -dcf -- {} + | PARSE_V4 | SUB_AGG_C > "${v4list}" || TMP_FILE_ABORT
			# aggregate C utility
			elif [ "${agg4}" -eq 1 ] && [ "${agg6}" -eq 0 ]; then
				find "${listdir}" -type f -exec gunzip -dcf -- {} + | PARSE_V4 | SUB_AGG_C > "${v4list}" || TMP_FILE_ABORT
			# Use aggregate6 IPv4 support if C based aggregate util not found
			elif [ "${agg4}" -eq 0 ] && [ "${agg6}" -eq 1 ]; then
				find "${listdir}" -type f -exec gunzip -dcf -- {} + | PARSE_V4 | SUB_AGG_PY > "${v4list}" || TMP_FILE_ABORT
			# If neither aggregate utility is found, use Perl function
			elif [ "${agg4}" -eq 0 ] && [ "${agg6}" -eq 0 ] && [ "${perl_exist}" -eq 1 ]; then
				WARNING 'Falling back to pure Perl IPv4 aggregator...'
				find "${listdir}" -type f -exec gunzip -dcf -- {} + | PARSE_V4 | SUB_AGG_PERL > "${v4list}" || TMP_FILE_ABORT
			# If aggy, aggregate{6} or Perl not installed, we can't do subnet aggregation
			else
				WARNING 'Unable to aggregate subnets! Perl, aggy, aggregate and/or aggregate6 not found!'
				NO_AGG
			fi
		fi
	else
		NO_AGG
	fi

	{ PRINT_LIST | PRIVATE_ADDRESS_FILTER | WHITELIST_FILTER ; } > "${finout}" || TMP_FILE_ABORT
}

LIST_INSTALL() {
	# Calculate byte offsets for cmp (strip date header)
	typeset old_offset="$(head -2 -- /etc/pf-badhost.txt | wc -c)"
	typeset new_offset="$(head -2 -- "${finout}" | wc -c)"

	# Reload pf-badhost table only if there are blocklist chages
	# 'cmp -s' on most platforms has a bug where it ignores byte offsets :(
	if cmp -- /etc/pf-badhost.txt "${finout}" "${old_offset}" "${new_offset}" >/dev/null 2>&1; then
		printf '\nNo blocklist changes...\n' 1>&2
		if [ "${_LOG}" -eq 1 ]; then
			{ printf '# Last Run (no changes): %s\n' "$(date)" ; cat -- < '/etc/pf-badhost.txt' ; } > "${oldconf}" || ERR 'Failed to update log file!'
			cp -- "${oldconf}" /var/log/pf-badhost/pf-badhost.log || ERR 'Failed to update log file!'
			chmod 640 /var/log/pf-badhost/pf-badhost.log >/dev/null 2>&1
		fi
	else
		# Backup old blocklist
		cp -- /etc/pf-badhost.txt "${oldconf}" || TMP_FILE_ABORT
		# Move newly generated blocklist into place
		cp -- "${finout}" /etc/pf-badhost.txt || ERR 'Failed to update /etc/pf-badhost.txt! Please ensure the file has correct permissions and that the partition has free space!'
		# Ensure proposed changes are valid before finally reloading pfbadhost table
		if "${getroot}" -- "${pfctl}" -nf /etc/pf.conf ; then
			"${getroot}" --  "${pfctl}" -t pfbadhost -T replace -f /etc/pf-badhost.txt || ABORT
			if [ "${_LOG}" -eq 1 ]; then
				LOGGER
			fi
		else
			ABORT
		fi
	fi
}

PRINT_LIST() {
	# Generate pf-badhost.txt from newly processed blocklist data
	printf '# Date Created: %s\n' "$(date)"
	PRINT_STATS | sed 's/^/# /g'

	# User defined rules and address negation
	if [ -s "${user_rules}" ]; then
		printf '\n# User Defined Rules:\n\n'
		cat -- < "${user_rules}"
	fi
	# Authlog Analysis
	if [ "${_HAIL_MARY}" -eq 1 ]; then
		printf '\n# Rules Generated from %s:\n\n' "$authlog_path1"
		cat -- < "${authlog}"
	fi
	# Tor Filtering
	if [ -s "${tor_whitelist}" ]; then
		printf '\n# Tor Whitelist:\n\n'
		cat -- < "${tor_whitelist}"
	elif [ -s  "${tor_blacklist}" ]; then
		printf '\n# Tor Blacklist:\n\n'
		cat -- < "${tor_blacklist}"
	fi
	# System rules (RFC3330/5156 negation)
	printf '\n# System Rules:\n\n'
	if [ "${_RFC3330}" -ne 1 ] && [ "${_RFC5156}" -ne 1 ]; then
		# Allow all private address ranges in blocklist (may break stuff)
		true
	elif [ "${_RFC3330}" -eq 1 ] && [ "${_RFC5156}" -ne 1 ]; then
		# Allow RFC5156 addresses in blocklist, filter out RFC3330 addresses 
		printf '%s\n' "${_rfc3330[@]}"
	elif [ "${_RFC3330}" -ne 1 ] && [ "${_RFC5156}" -eq 1 ]; then
		# Allow RFC3330 addresses in blocklist, filter out RFC5156 addresses 
		printf '%s\n' "${_rfc5156[@]}"	
	else
		# Make sure RFC 3330 & 5156 address ranges are not in blocklist
		printf '%s\n' "${_rfc3330[@]}"
		printf '%s\n' "${_rfc5156[@]}"
	fi
	# Main ruleset
	if [ "${_IPV4}" -eq 1 ]; then
		printf '\n# IPv4 List Generated Rules:\n\n'
		cat -- < "${v4list}"
	fi
	if [ "${_IPV6}" -eq 1 ]; then
		printf '\n# IPv6 List Generated Rules:\n\n'
		cat -- < "${v6list}"
	fi
}

TOR_FILTER() {
	# Grab correct list
	if [ "${_TOR_WHITELIST}" -eq 1 ] || [ "${_TOR_BLOCK_ALL}" -eq 1 ]; then
		URL_FETCH 'https://github.com/SecOps-Institute/Tor-IP-Addresses/raw/master/tor-nodes.lst' "${tor_rawlist}" || ERR 'Failed to fetch Tor IP list!'
	elif [ "${_TOR_BLOCK_EXIT}" -eq 1 ]; then
		URL_FETCH 'https://github.com/SecOps-Institute/Tor-IP-Addresses/raw/master/tor-exit-nodes.lst' "${tor_rawlist}" || ERR 'Failed to fetch Tor IP list!'
	else
		return 1
	fi

	# Parse Tor list right here to avoid further if/or logic later on
	if [ "${_TOR_WHITELIST}" -eq 1 ]; then
		# Create whitelist
		if [ "${_IPV4}" -eq 1 ]; then
			PARSE_V4 < "${tor_rawlist}" | mysort -uV | sed 's/^/!/g'
		fi
		if [ "${_IPV6}" -eq 1 ]; then
			PARSE_V6 < "${tor_rawlist}" | mysort -uV | sed 's/^/!/g'
		fi
	fi > "${tor_whitelist}"

	if [ "${_TOR_BLOCK_ALL}" -eq 1 ] || [ "${_TOR_BLOCK_EXIT}" -eq 1 ]; then
		# Create blacklist
		if [ "${_IPV4}" -eq 1 ]; then
			PARSE_V4 < "${tor_rawlist}" | mysort -uV
		fi
		if [ "${_IPV6}" -eq 1 ]; then
			PARSE_V6 < "${tor_rawlist}" | mysort -uV
		fi
	fi > "${tor_blacklist}"
}

WHITELIST_FILTER() {
	if [ "${_WHITELIST}" -eq 1 ]; then
		WHITELIST
	else
		# Pipe through cat to avoid wasting cpu cycles on grep if whitelisting is disabled
		cat
	fi
}

# ------------------------------------------------------------------------------
# List Statistics and Totals
# ------------------------------------------------------------------------------

V4_TOTAL() {
	# The awk bug I discovered back in June 2020 strikes again!
	if [ "${awk_patch}" -eq 1 ]; then
		myawk -v v4num="${v4_num}" -F '/' -- '/\/[[:digit:]][[:digit:]]?$/ {sum+= 2^(32 - $2)} END {printf "%0.0f", sum + v4num}' < "${v4list}"
	else
		mygrep -- '/[[:digit:]]{1,2}$' < "${v4list}" | myawk -F '/' -- '{print 2^(32 - $2)}' | myawk -v v4num="${v4_num}" -- '{sum+=$1} END {printf "%0.0f", sum + v4num}'
	fi
}

V6_TOTAL() {
	# The awk bug I discovered back in June 2020 strikes again!
	if [ "${awk_patch}" -eq 1 ]; then
		myawk -v v6num="${v6_num}" -F '/' -- '/\/[[:digit:]][[:digit:]]?[[:digit:]]?$/ {sum+= 2^(128 - $2)} END {printf "%0.0f", sum + v6num}' < "${v6list}"
	else
		mygrep -- "/[[:digit:]]{1,3}$" < "${v6list}" | myawk -F '/' -- '{print 2^(128 - $2)}' | myawk -v v6num="${v6_num}" -- '{sum+=$1} END {printf "%0.0f", sum + v6num}'
	fi
}

# ------------------------------------------------------------------------------
# Logging Functions
# ------------------------------------------------------------------------------

LOGGER() {
	# Gzip old log file
	gzip -9 -c < /var/log/pf-badhost/pf-badhost.log > "${gztemp}" || ERR 'Failed to rotate log file!'
	cp -- "${gztemp}" /var/log/pf-badhost/pf-badhost.log.0.gz || ERR 'Failed to create log file!'

	# Move new log into place
	cp -- "${finout}" /var/log/pf-badhost/pf-badhost.log || ERR 'Failed to create log file!'
	chmod 640 /var/log/pf-badhost/pf-badhost.log /var/log/pf-badhost/pf-badhost.log.0.gz >/dev/null 2>&1
}

PRINT_STATS() {
	# Print number of addresses in table (expand CIDR ranges)
	typeset authlog_num v4_num v4_total v6_num v6_total
	authlog_num="$(wc -l -- < "${authlog}" | tr -cd '[:digit:]')"

	if [ "${_HAIL_MARY}" -eq 1 ]; then
		printf '\nBruteforcers found in "%s":  %s\n' "${authlog_path1}" "${authlog_num}"
	else
		printf '\n'
	fi

	if [ "${_IPV4}" -eq 1 ]; then
		v4_num="$(mygrep -cv -- "/[[:digit:]]{1,2}$" < "${v4list}")"
		v4_total="$(V4_TOTAL)"
		printf 'IPv4 addresses in table:  %s\n' "${v4_total}"
	fi

	if [ "${_IPV6}" -eq 1 ]; then
		v6_num="$(mygrep -cv -- "/[[:digit:]]{1,3}$" < "${v6list}")"
		v6_total="$(V6_TOTAL)"
		printf 'IPv6 addresses in table:  %s\n\n' "${v6_total}"
	else
		printf '\n\n'
	fi
}

# ------------------------------------------------------------------------------
# Subnet Aggregation Functions
# ------------------------------------------------------------------------------

# If no aggregator enabled or found, normalize and sort the address list
NO_AGG() {
	# IPv4
	if [ "${_IPV4}" -eq 1 ]; then
		find "${listdir}" -type f -exec gunzip -dcf -- {} + | PARSE_V4 | mysort -uV > "${v4list}" || TMP_FILE_ABORT
	fi
	# IPv6
	if [ "${_IPV6}" -eq 1 ] && [ -z "${IPV6_PROC}" ]; then
		find "${listdir}" -type f -exec gunzip -dcf -- {} + | PARSE_V6 | tr '[:upper:]' '[:lower:]' | mysort -uV > "${v6list}" || TMP_FILE_ABORT
	fi
}

# Call "aggregate6" utility to aggregate IPv6 address list.
SUB_AGG_6() {
	nice aggregate6 -t -6 | sed 's/\/128$//g'
}

# Call "aggregate" utility to aggregate IPv4 address list.
# Run "pkg_add aggregate" on OpenBSD to install
# Very mature, stable code written in C
SUB_AGG_C() {
	myawk -- '!/\/3[0-2]$|\/[1-2][[:digit:]]$|\/[1-9]$/ {$0=$0"/32"}1' | nice aggregate -qt | sed 's/\/32$//g'
}

# Call experimental "aggy" aggregate utility.
# Preliminary testing has shown it to be 100 to 1000 times faster than the alternatives
# See install instructions for info on how to install aggy
SUB_AGG_GO() {
	myawk -- '!/\/3[0-2]$|\/[1-2][[:digit:]]$|\/[1-9]$/ {$0=$0"/32"}1' | aggy | sed 's/\/32$//g'
}

# Call "aggregate6" utility to aggregate IPv4 address list.
# Run "pkg_add aggregate6" on OpenBSD to install or "pip3 install aggregate6" on other platforms
SUB_AGG_PY() {
	nice aggregate6 -t -4 | sed 's/\/32$//g'
}

# IPv4 CIDR/Address Aggregator [pure Perl version of "aggregate" utility]
_SUBNET_MERGE_PERL=$(cat <<'__EOT'
#!/usr/bin/perl -lp0a
$_=join$\,sort map{1x(s/\d*./unpack B8,chr$&/ge>4?$&:32)&$_}@F;1while s/^(.*)
\1.*/$1/m||s/^(.*)0
\1.$/$1/m;s!^.*!(join'.',map{ord}split'',pack B32,$&).'/'.length$&!gme
__EOT
)

# Pure Perl version of ISC "aggregate" utitity [code stored in above variable "_SUBNET_MERGE_PERL"]
# WARNING: ~10x slower than C based utilty and ~1000x slower than aggy
SUB_AGG_PERL() {
	nice perl -e "${_SUBNET_MERGE_PERL}" | sed 's/\/32$//g'
}

# ------------------------------------------------------------------------------
# Temp File Functions
# ------------------------------------------------------------------------------

TMP_FILE() {
	mktemp -- "${listdir}/tmp.XXXXXXXX" || TMP_FILE_ABORT
}

TMP_FILE_GEOBLOCK() {
	mktemp -- "${geodir}/geo.XXXXXXXX" || TMP_FILE_ABORT
}

TMP_FILE_SCRATCH() {
	mktemp -- "${scratchdir}/scratch.XXXXXXXX" || TMP_FILE_ABORT
}

# ------------------------------------------------------------------------------
# Tests and Sanity Checks
# ------------------------------------------------------------------------------

AWK_TEST() {
	echo '5e58386636aa775c2106140445' | myawk -- 'END {print log(2)}' 2>&1 | mygrep -c 'log result out of range'
}

CHECK_DRIVE() {
	# Make sure /etc/pf-badhost.txt exists
	if [ -f /etc/pf-badhost.txt ] && [ -w /etc/pf-badhost.txt ]; then
		true
	else
		ERR '/etc/pf-badhost.txt either not found or has incorrect permissions!'
	fi

	# If logging is enabled, make sure permissions are correct
	if [ "${_LOG}" -eq 1 ]; then
		# Make sure log dir exists and has correct permissions
		if [ -d /var/log/pf-badhost ] && [ -r /var/log/pf-badhost ]; then
			true
		else
			ERR "Directory '/var/log/pf-badhost' either not found, or has incorrect permissions!"
		fi
		# Make sure log file is writeable
		if [ -f /var/log/pf-badhost/pf-badhost.log ] && [ -w /var/log/pf-badhost/pf-badhost.log ]; then
			true
		else
			ERR "Log file '/var/log/pf-badhost/pf-badhost.log' has incorrect permissions!"
		fi
		# Make sure gzip file is writeable
		if [ -f /var/log/pf-badhost/pf-badhost.log.0.gz ] && [ -w /var/log/pf-badhost/pf-badhost.log.0.gz ]; then
			true
		else
			ERR "Log file '/var/log/pf-badhost/pf-badhost.log.0.gz' has incorrect permissions!"
		fi
	fi
}

CHECK_CMD() {
	typeset _cmd="${1}"
	command -v -- "${_cmd}" || ERR "'${_cmd}' not found! Please ensure that '${_cmd}' is installed!"
}

CHECK_PRIVILEGE() {
	# Make sure we're running as "_pfbadhost" user
	if [ "$(whoami)" != '_pfbadhost' ]; then
		printf '\nScript must be run as user "_pfbadhost" - Exiting...\n' 1>&2
		exit 1
	fi
}

IS_ASN() {
	typeset -u _asn
	typeset _num _prefix
	_asn="${1}"
	_num="${_asn#AS}"
	# Strip first two characters from '_asn' var
	_prefix="${_asn%"${_asn#??}"}"

	if [ "${_prefix}" = 'AS' ]; then
		IS_INT "${_num}" || return 1
		if [ "${_num}" -ge 0 ] && [ "${_num}" -le 4294967295 ]; then
			return 0
		else
			return 1
		fi
	else
		return 1
	fi
}

IS_INT() {
	case "$1" in
	    ''|*[!0-9]*) return 1 ;;
	    *) return 0 ;;
	esac
}

PRE_EXEC_TESTS() {
	typeset _cmd

	# Confirm if awk has June 2020 patches
	if [ "$(AWK_TEST)" -eq 0 ]; then
		awk_patch=1
	else
		awk_patch=0
	fi
	# Confirm if aggregate is installed
	if command -v aggregate >/dev/null 2>&1; then
		agg4=1
	else
		agg4=0
	fi
	# Confirm if aggregate6 is installed
	if command -v aggregate6 >/dev/null 2>&1; then
		agg6=1
	else
		agg6=0
	fi
	# Confirm if experimental aggy utility is installed
	if command -v aggy >/dev/null 2>&1; then
		go_agg=1
	else
		go_agg=0
	fi
	# Confirm if Perl is installed
	if command -v perl >/dev/null 2>&1; then
		perl_exist=1
	else
		perl_exist=0
	fi

	# Make sure requisite utilities are installed
	for _cmd in 'cmp' 'find' 'gunzip' 'nc' "${netget}" ; do
		CHECK_CMD "${_cmd}"
	done > /dev/null

	if [ "${_NO_UID_CHECK}" -ne 1 ]; then
		CHECK_PRIVILEGE
	fi
	if [ "${_HAIL_MARY}" -eq 1 ]; then
		CHECK_CMD "${authlog_unzip}" > /dev/null
	fi
	if [ "${_PRINT_ONLY}" -ne 1 ]; then
		pfctl="$(CHECK_CMD pfctl)"
		CHECK_DRIVE
	fi

	# Check for network connectivity to GitHub, bail out if fail
	URL_FETCH https://github.com /dev/null || ERR 'No network connectivity!'
}

# Make sure user-provided values are sane
VAR_SANITY_CHECK() {
	typeset _cmd

	IS_INT "${_AGGREGATE}" || ERR 'User defined variable "$_AGGREGATE" contains a non-integer value - Unable to proceed!'
	IS_INT "${_BOGON_4}" || ERR 'User defined variable "$_BOGON_4" contains a non-integer value - Unable to proceed!'
	IS_INT "${_BOGON_6}" || ERR 'User defined variable "$_BOGON_6" contains a non-integer value - Unable to proceed!'
	IS_INT "${_CHECK_ONLY}" || ERR 'User defined variable "$_CHECK_ONLY" contains a non-integer value - Unable to proceed!'
	IS_INT "${_GEOBLOCK}" || ERR 'User defined variable "$_GEOBLOCK" contains a non-integer value - Unable to proceed!'
	IS_INT "${_HAIL_MARY}" || 'User defined variable "$_HAIL_MARY" contains a non-integer value - Unable to proceed!'
	IS_INT "${_IPV4}" || 'User defined variable "$_IPV4" contains a non-integer value - Unable to proceed!'
	IS_INT "${_IPV6}" || ERR 'User defined variable "$_IPV6" contains a non-integer value - Unable to proceed!'
	IS_INT "${_LOG}" || ERR 'User defined variable "$_LOG" contains a non-integer value - Unable to proceed!'
	IS_INT "${_LOGIN_LIMIT}" || ERR 'User defined variable "$_LOGIN_LIMIT" contains a non-integer value - Unable to proceed!'
	IS_INT "${_NO_UID_CHECK}" || ERR 'User defined variable "$_NO_UID_CHECK" contains a non-integer value - Unable to proceed!'
	IS_INT "${_PRINT_ONLY}" || ERR 'User defined variable "$_PRINT_ONLY" contains a non-integer value - Unable to proceed!'
	IS_INT "${_RETRY}" || ERR 'User defined variable "$_RETRY" contains a non-integer value - Unable to proceed!'
	IS_INT "${_STRICT}" || ERR 'User defined variable "$_STRICT" contains a non-integer value - Unable to proceed!'
	IS_INT "${_TOR_BLOCK_ALL}" || ERR 'User defined variable "$_TOR_BLOCK_ALL" contains a non-integer value - Unable to proceed!'
	IS_INT "${_TOR_BLOCK_EXIT}" || ERR 'User defined variable "$_TOR_BLOCK_EXIT" contains a non-integer value - Unable to proceed!'
	IS_INT "${_TOR_WHITELIST}" || ERR 'User defined variable "$_TOR_WHITELIST" contains a non-integer value - Unable to proceed!'
	IS_INT "${_VERBOSE}" || ERR 'User defined variable "$_VERBOSE" contains a non-integer value - Unable to proceed!'
	IS_INT "${_WHITELIST}" || ERR 'User defined variable "$_WHITELIST" contains a non-integer value - Unable to proceed!'
	
	# Make sure that at least one address family is enabled
	if [ "${_IPV4}" -ne 1 ] && [ "${_IPV6}" -ne 1 ]; then
		ERR 'No address family enabled! Please enable IPv4 and/or IPv6 in your pf-badhost config!'
	fi

	# Make sure $_LOGIN_LIMIT is greater than 0
	if [ "${_LOGIN_LIMIT}" -lt 1 ]; then
		_LOGIN_LIMIT=1
	fi

	# Make sure $RETRY is greater than 0
	if [ "${_RETRY}" -lt 1 ]; then
		_RETRY=1
	fi

	# Tor var sanity check
	if [ "${_TOR_WHITELIST}" -eq 1 ] && [ "${_TOR_BLOCK_ALL}" -eq 1 ]; then
		ERR 'Tor Whitelisting/Blacklisting options are mutually exclusive!'
	elif [ "${_TOR_WHITELIST}" -eq 1 ] && [ "${_TOR_BLOCK_EXIT}" -eq 1 ]; then
		ERR 'Tor Whitelisting/Blacklisting options are mutually exclusive!'
	elif [ "${_TOR_BLOCK_ALL}" -eq 1 ] && [ "${_TOR_BLOCK_EXIT}" -eq 1 ]; then
		ERR 'Tor Whitelisting/Blacklisting options are mutually exclusive!'
	fi
}

# ------------------------------------------------------------------------------
# URL Fetch Functions
# ------------------------------------------------------------------------------

# This function accepts 2 arguments, the first one being the URL to fetch,
# and the second argument being the intended output destination.
# If the second argument is '-' then we output to stdout
#
# Output to filesystem location - Example:
#	URL_FETCH https://example.com/file.txt /local/file/path
#
# Output to stdout - Example:
#	URL_FETCH https://example.com/file.txt -

URL_FETCH() {
	# Create local vars
	typeset _URL _OUTPUT_FILE || ERR 'Current shell does not support the non-POSIX "typeset" feature!'
	typeset -i _counter _STDOUT
	_counter=0

	# If constant 'RETRY' hasn't yet been set, create local var and set it to '3'
	test -n "${_RETRY}" || typeset -i _RETRY=3

	# Make sure URL and output destination were provided
	if [ -z "${2}" ] || [ -z "${1}" ]; then
		ERR 'No URL and/or output location provided to URL_FETCH function!' ; return 1
	elif [ "${2}" = '-' ]; then
		_STDOUT=1
		_URL="${1}"
		_OUTPUT_FILE='/dev/null'
	else
		_STDOUT=0
		_URL="${1}"
		_OUTPUT_FILE="${2}"
	fi

	while true ; do
		(( _counter++ )) || true # Increment counter for each download attempt
		if [ "${_counter}" -le "${_RETRY}" ]; then
			# Sleep 'n' seconds before reattempting download
			if [ "${_counter}" -gt 1 ]; then
				if [ "${_VERBOSE}" -ne 0 ]; then
					printf 'Sleeping for %d seconds before reattempting download...\n\n' "$((_counter * 10))" 1>&2
				fi
				sleep "$((_counter * 10))"
			fi
			# Upon successful download from a URL, break the loop and proceed to next URL
			if [ "${_STDOUT}" -eq 1 ]; then
				# Print to stdout
				if myfetch "${_URL}" ; then
					return
				else
					if [ "${_VERBOSE}" -ne 0 ]; then
						printf '\nFailed to Fetch List (Attempt #%d):  %s\n\n' "${_counter}" "${_URL}" 1>&2
					fi
				fi

			else
				# Output to specified filesystem location
				if myfetch "${_URL}" > "${_OUTPUT_FILE}" ; then
					return
				else
					if [ "${_VERBOSE}" -ne 0 ]; then
						printf '\nFailed to Fetch List (Attempt #%d):  %s\n\n' "${_counter}" "${_URL}" 1>&2
					fi
				fi
			fi
		else
			WARNING "Exceeded Maximum Number of Retries (${_RETRY}) For URL:  ${_URL}"
			if [ "${_STRICT}" -eq 0 ]; then
				# Clean-up any potential garbage from failed download
				if [ -f "${_OUTPUT_FILE}" ]; then
					rm -f -- "${_OUTPUT_FILE}"
				fi
				return 0
			else
				ERR 'Strict Mode Enabled' ; return 1
			fi
		fi
	done
}

ASN_FETCH() {
	typeset -u _asn
	{ echo '!!' ; for _asn in "${_asn_array[@]}"; do echo "-i origin ${_asn}"; done; echo 'q';} | nc whois.radb.net 43 | myawk -- '$1 == "route:" || $1 == "route6:" {print $2}'
}

PRINT_URL() {
	printf '%s\n' "${_BLOCKLISTS}" | SANITIZE_ARRAY

	if [ "${_BOGON_4}" -eq 1 ]; then
		echo 'https://www.team-cymru.org/Services/Bogons/fullbogons-ipv4.txt'
	fi

	if [ "${_BOGON_6}" -eq 1 ]; then
		echo 'https://www.team-cymru.org/Services/Bogons/fullbogons-ipv6.txt'
	fi
}


# ------------------------------------------------------------------------------
# Main Function
# ------------------------------------------------------------------------------

main() {
	# Set trap handler
	trap TRAP_ABORT ERR INT

	# These are declared late because zsh needs ksh array syntax enabled before it can ingest array data
	_registrar_url[0]='https://ftp.afrinic.net/pub/stats/afrinic/delegated-afrinic-latest'
	_registrar_url[1]='https://ftp.arin.net/pub/stats/arin/delegated-arin-extended-latest'
	_registrar_url[2]='https://ftp.lacnic.net/pub/stats/lacnic/delegated-lacnic-latest'
	_registrar_url[3]='https://ftp.apnic.net/stats/apnic/delegated-apnic-latest'
	_registrar_url[4]='https://ftp.ripe.net/ripe/stats/delegated-ripencc-latest'

	_rfc3330[0]='!0.0.0.0/8'
	_rfc3330[1]='!10.0.0.0/8'
	_rfc3330[2]='!14.0.0.0/8'
	_rfc3330[3]='!24.0.0.0/8'
	_rfc3330[4]='!39.0.0.0/8'
	_rfc3330[5]='!127.0.0.0/8'
	_rfc3330[6]='!128.0.0.0/16'
	_rfc3330[7]='!169.254.0.0/16'
	_rfc3330[8]='!172.16.0.0/12'
	_rfc3330[9]='!191.255.0.0/16'
	_rfc3330[10]='!192.0.0.0/24'
	_rfc3330[11]='!192.0.2.0/24'
	_rfc3330[12]='!192.88.99.0/24'
	_rfc3330[14]='!192.168.0.0/16'
	_rfc3330[14]='!198.18.0.0/15'
	_rfc3330[15]='!223.255.255.0/24'
	_rfc3330[16]='!224.0.0.0/3'

	_rfc5156[0]='!2001:10::/28'
	_rfc5156[1]='!2001::/32'
	_rfc5156[2]='!2001:db8::/32'
	_rfc5156[3]='!2002::/16'
	_rfc5156[4]='!3ffe::/16'
	_rfc5156[5]='!5f00::/8'
	_rfc5156[6]='!::FFFF:0:0/96'
	_rfc5156[7]='!fc00::/7'
	_rfc5156[8]='!fe80::/10'
	_rfc5156[9]='!ff00::/8'

	# Mark program info read-only
	readonly version release_date release_name
	# Mark pf-badhost constants as read-only
	readonly _rfc3330 _rfc5156 _registrar_url _SUBNET_MERGE_PERL
	# Mark user-defined lists as read-only
	readonly _COUNTRY_CODES _ASN_LIST _BLOCKLISTS _USER_RULES

	# Initialize counters
	typeset -i _array_index=0 _a_counter=0 _g_counter=0 _l_counter=0 _r_counter=0
	# Initialize case (in)sensitive vars
	typeset -u _asn _cc
	typeset -l _opt_arg
	# Initialize local vars
	typeset _i
	# Initialize global configuration vars
	 _CHECK_ONLY=0 ; _NO_UID_CHECK=0 ; _PRINT_ONLY=0 ; _VERBOSE=1

	# Command-line option handling
	while getopts 46ABDE:F:GH:J:K:O:R:T:VZ:a:b:g:hj:l:no:r:u:w:x _opts ; do
	case "${_opts}" in
	    4)  _IPV4=1 ; _IPV6=0 ;;  # Force IPv4-only mode
	    6)  _IPV4=0 ; _IPV6=1 ;;  # Force IPv6-only mode
	    A)  _AGGREGATE=1 ;;  # Enable subnet aggregation
	    B)  _IPV4=1 ; _IPV6=1 ;;  # Force both address families
	    D)  _NO_UID_CHECK=1 ;;  # Disable user checking
	    E)  authlog_unzip="${OPTARG}" ;;  # set tool to unzip authlog
	    F)  netget="${OPTARG}" ;;  # set curl/fetch/ftp/wget preference
	    G)  _GEOBLOCK=1 ;;  # Enable Geoblocking
	    H)  _HAIL_MARY=1 ; _LOGIN_LIMIT="${OPTARG}" ;;  # Enable SSH authlog analysis
	    J)  authlog_path1="${OPTARG}" ;;
	    K)  authlog_path2="${OPTARG}" ;;
	    O)  typeset -l -r _OS_TYPE="${OPTARG}" ;;
	    R)  _RETRY="${OPTARG}" ;; # Maximum number of URL fetch attempts
	    T)  # Tor Filtering
		_opt_arg="${OPTARG}"
		case "${_opt_arg}" in
		    allow) _TOR_WHITELIST=1 ;;
		    block) _TOR_BLOCK_ALL=1 ;;
		    block_exit) _TOR_BLOCK_EXIT=1 ;;
		    *) ERR "Invalid option for '-T' : '${OPTARG}'" ;;
		esac ;;
	    V)   _VERBOSE=0 ;;
	    Z)   getroot="${OPTARG}" ;;
	    a)  # Filter single ASN
		_asn="${OPTARG}"
		IS_ASN "${_asn}" || ERR "Invalid ASN: '${OPTARG}'"
		_asn_array[${_a_counter}]="${_asn}"
		(( _a_counter++ )) || true ;;
	    b)  # Bogon Filtering
		IS_INT "${OPTARG}" || ERR "Invalid option for '-b' : '${OPTARG}'"
		case "${OPTARG}" in
		    4) _BOGON_4=1 ;;
		    6) _BOGON_6=1 ;;
		    46|64) _BOGON_4=1 ; _BOGON_6=1 ;;
		    *) ERR "Invalid option for '-b' : '${OPTARG}'" ;;
		esac ;;
	    j)  # Filter bulk ASN from local list
		if [ -f "${OPTARG}" ] && [ -r "${OPTARG}" ]; then
		   for _i in $(SANITIZE_ARRAY < "${OPTARG}"); do
			_asn="${_i}"
			IS_ASN "${_asn}" || ERR "Invalid ASN: '${_i}'"
			_asn_array[${_a_counter}]="${_asn}"
			(( _a_counter++ )) || true
		   done
		else
			ERR "File '${OPTARG}' either not found or has incorrect permissions!"
		fi ;; 
	    g)  # Block ISO3166 country codes
		_cc="${OPTARG}"
		_country_code[${_g_counter}]="${_cc}"  # Add country to blocklist
		(( _g_counter++ )) || true             # (Implies '-G')
		_GEOBLOCK=1 ;;
	    h)  HELP_MESSAGE ; exit ;;
	    l)	# Add blocklist URL
		_user_url[${_l_counter}]="${OPTARG}"
		(( _l_counter++ )) || true ;;
	    n)  # Dry run
		_CHECK_ONLY=1 ;;
	    o)  # Formatting and runtime options
		_opt_arg="${OPTARG}"
		case "${_opt_arg}" in
		# Log, print & permissions options
		    log) _LOG=1 ;;
		    strict) _STRICT=1 ;;
		    uid-check) _NO_UID_CHECK=0 ;;
		    pipefail) set -o pipefail ;;
		    verbose) _VERBOSE=1 ;;
		    nolog) _LOG=0 ;;
		    no-strict) _STRICT=0 ;;
		    no-uid-check) _NO_UID_CHECK=1 ;;
		    no-verbose) _VERBOSE=0 ;;
		# Filtering Options
		    rfc3330) _RFC3330=1 ;;
		    rfc5156) _RFC5156=1 ;;
		    whitelist) _WHITELIST=1 ;;
		    no-rfc3330) _RFC3330=0 ;;
		    no-rfc5156) _RFC5156=0 ;;
		    no-whitelist) _WHITELIST=0 ;;
		    *) ERR "Invalid option for '-o' : '${OPTARG}'" ;;
		esac
		;;
	    r)  # Add custom rule
		_user_rule[${_r_counter}]="${OPTARG}" # Custom user rules
		(( _r_counter++ )) || true ;;
	    u)  # Add blocklist URL in bulk from local list
		if [ -f "${OPTARG}" ] && [ -r "${OPTARG}" ]; then
		   for _i in $(SANITIZE_ARRAY < "${OPTARG}"); do
			_user_url[${_l_counter}]="${_i}"
			(( _l_counter++ )) || true
		   done
		else
			ERR "File '${OPTARG}' either not found or has incorrect permissions!"
		fi ;;
	    w)  # Add custom user rules in bulk from local list
		if [ -f "${OPTARG}" ] && [ -r "${OPTARG}" ]; then
		   for _i in $(SANITIZE_ARRAY < "${OPTARG}"); do
			_user_rule[${_r_counter}]="${_i}"
			(( _r_counter++ )) || true
		   done
		else
			ERR "File '${OPTARG}' either not found or has incorrect permissions!"
		fi ;;
	    x)  _PRINT_ONLY=1 ; _LOG=0 ; _NO_UID_CHECK=1 ; confpath='/dev/null' ; getroot='false' ;;  # Print generated list to stdout
	    ?)  HELP_MESSAGE 1>&2 ; exit 2 ;;
    	esac
	done

	# Mark commandline flags as read-only
	readonly _CHECK_ONLY _NO_UID_CHECK _PRINT_ONLY _VERBOSE

	# Mark user-defined booleans as read-only
	readonly _AGENT _LOG _STRICT _IPV4 _IPV6 _AGGREGATE    \
		 _GEOBLOCK _BOGON_4 _BOGON_6 _HAIL_MARY        \
		 _TOR_WHITELIST _TOR_BLOCK_ALL _TOR_BLOCK_EXIT \
		 _RFC3330 _RFC5156 _WHITELIST

	# Set variables based on specified operating system
	# We use 'test -n' here to check for config overrides provided via commandline argument
	case "${_OS_TYPE}" in
	dragonflybsd)
	  test -n "${getroot}" || getroot="$(CHECK_CMD doas)"
	  test -n "${netget}" || netget='fetch'
	  test -n "${authlog_path1}" || authlog_path1='/var/log/auth.log'
	  test -n "${authlog_path2}" || authlog_path2='/var/log/auth.log.0.gz'
	  test -n "${authlog_unzip}" || authlog_unzip="$(CHECK_CMD zcat)"
	  ;;
	freebsd)
	  test -n "${getroot}" || getroot="$(CHECK_CMD doas)"
	  test -n "${netget}" || netget='fetch'
	  test -n "${authlog_path1}" || authlog_path1='/var/log/auth.log'
	  test -n "${authlog_path2}" || authlog_path2='/var/log/auth.log.0.bz2'
	  test -n "${authlog_unzip}" || authlog_unzip="$(CHECK_CMD bzcat)"
	  ;;
	macos)
	  test -n "${getroot}" || getroot="$(CHECK_CMD sudo)"
	  test -n "${netget}" || netget='curl'
	  test -n "${authlog_path1}" || authlog_path1='/dev/null'
	  test -n "${authlog_path2}" || authlog_path2='/dev/null'
	  test -n "${authlog_unzip}" || authlog_unzip="$(CHECK_CMD gzip)"
	  ;;
	netbsd)
	  # NetBSD does annoying things with their $PATH, so make sure we set what we need
	  PATH='/usr/pkg/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'
	  test -n "${getroot}" || getroot="$(CHECK_CMD doas)"
	  test -n "${netget}" || netget='curl'
	  test -n "${authlog_path1}" || authlog_path1='/var/log/authlog'
	  test -n "${authlog_path2}" || authlog_path2='/var/log/authlog.0.gz'
	  test -n "${authlog_unzip}" || authlog_unzip="$(CHECK_CMD zcat)"
	  ;;
	openbsd)
	  test -n "${getroot}" || getroot="$(CHECK_CMD doas)"
	  test -n "${netget}" || netget='ftp'
	  test -n "${authlog_path1}" || authlog_path1='/var/log/authlog'
	  test -n "${authlog_path2}" || authlog_path2='/var/log/authlog.0.gz'
	  test -n "${authlog_unzip}" || authlog_unzip="$(CHECK_CMD zcat)"
	  ;;
	custom)
	  test -n "${getroot}" || ERR "Custom OS type specified - please set doas/sudo preference with '-Z' option"
	  test -n "${netget}" || ERR "Custom OS type specified - please set curl/fetch/ftp/wget preference with '-F' option"
	  if [ "${_HAIL_MARY}" -eq 1 ]; then
		test -n "${authlog_path1}" || ERR "Custom OS type specified - please specifiy path to SSH authlog with '-J' option"
		test -n "${authlog_path2}" || ERR "Custom OS type specified - please specifiy path to secondary SSH authlog with '-K' option"
		test -n "${authlog_unzip}" || ERR "Custom OS type specified - please specifiy zcat/bzcat for SSH authlog analysis with '-E' option"
	  fi
	  ;;
	*)
	  printf '\n\nUnknown Operating System Specified. Available Options Are:\n * -OpenBSD\n * -FreeBSD\n * -NetBSD\n * -DragonflyBSD\n * -MacOS\n\nQuitting Without Making Changes...\n\n'
	  exit 1
	  ;;
	esac

	# Mark operating system specific variables as read-only
	readonly getroot netget authlog_path1 authlog_path2 authlog_unzip

	# Config test / dry run
	if [ "${_CHECK_ONLY}" -eq 1 ]; then
		if VAR_SANITY_CHECK && PRE_EXEC_TESTS ; then
			printf 'Config looks sane!\n' 1>&2 ; exit 0
		else
			ERR 'Invalid config!'
		fi
	fi

	# Ensure user-provided values are sane
	VAR_SANITY_CHECK

	# These are marked late because VAR_SANITY_CHECK() may modify them
	readonly _RETRY _LOGIN_LIMIT

	# Run pre-execution tests to ensure that conditions are sane
	PRE_EXEC_TESTS

	# Mark pre-exec tests results as read-only
	readonly awk_patch perl_exist agg4 agg6 go_agg

	### Add values from config area to arrays

	### User-defined rules
	# Determine array index position
	if [ "${#_user_rule[@]}" -ge 1 ]; then
		_array_index=$((${#_user_rule[@]} + 1))
	else
		_array_index=0
	fi
	# Add user rules specified in config to array
	for _i in $(printf '%s\n' "${_USER_RULES}" | SANITIZE_ARRAY); do
		_user_rule[${_array_index}]="${_i}"
		(( _array_index++ )) || true
	done

	### Blocklist URLs
	# Determine array index position
	if [ "${#_user_url[@]}" -ge 1 ]; then
		_array_index=$((${#_user_url[@]} + 1))
	else
		_array_index=0
	fi
	# Add blocklist URLs specified in config to array
	for _i in $(PRINT_URL); do
		_user_url[${_array_index}]="${_i}"
		(( _array_index++ )) || true
	done

	### ISO3166 country codes
	# Determine array index position
	if [ "${#_country_code[@]}" -ge 1 ]; then
		_array_index=$((${#_country_code[@]} + 1))
	else
		_array_index=0
	fi
	# Add country codes specified in config to array
	for _i in $(SANITIZE_COUNTRY_CODES); do
		_country_code[${_array_index}]="${_i}"
		(( _array_index++ )) || true
	done

	### ASN filtering
	# Determine array index position
	if [ "${#_asn_array[@]}" -ge 1 ]; then
		_array_index=$((${#_asn_array[@]} + 1))
	else
		_array_index=0
	fi
	# Add ASN's specified in config to array
	for _i in $(printf '%s\n' "${_ASN_LIST}" | SANITIZE_ARRAY); do
		_asn="${_i}"
		IS_ASN "${_asn}" || ERR "Invalid ASN: '${_i}'"
		_asn_array[${_array_index}]="${_asn}"
		(( _array_index++ )) || true
	done

	# Mark arrays as read-only
	readonly _country_code _user_rule _user_url

	# Temp file/dir vars
	listdir="$(mktemp -d || TMP_FILE_ABORT)"
	geodir="$(mktemp -d || TMP_FILE_ABORT)"
	workdir="$(mktemp -d || TMP_FILE_ABORT)"
	scratchdir="$(mktemp -d || TMP_FILE_ABORT)"
	v4list="$(TMP_FILE_SCRATCH)"
	v6list="$(TMP_FILE_SCRATCH)"
	user_rules="$(TMP_FILE_SCRATCH)"
	finout="$(TMP_FILE_SCRATCH)"
	oldconf="$(TMP_FILE_SCRATCH)"
	authlog="$(TMP_FILE_SCRATCH)"
	gztemp="$(TMP_FILE_SCRATCH)"
	tor_rawlist="$(TMP_FILE_SCRATCH)"
	tor_blacklist="$(TMP_FILE_SCRATCH)"
	tor_whitelist="$(TMP_FILE_SCRATCH)"

	# Mark temporary file locations as read-only
	readonly listdir geodir workdir scratchdir v4list v6list \
		 user_rules finout oldconf authlog gztemp \
		 tor_rawlist tor_blacklist tor_whitelist

	# Set working directory
	cd -- "${workdir}" || TMP_FILE_ABORT

	# Fetch blocklist urls
	for _i in "${_user_url[@]}"; do
		URL_FETCH "${_i}" "$(TMP_FILE)"
	done

	# Run Geoblock function if enabled
	if [ "${_GEOBLOCK}" -eq 1 ]; then
		# Fetch registrar datasets
		for _i in "${_registrar_url[@]}"; do
			URL_FETCH "${_i}" "$(TMP_FILE_GEOBLOCK)"
		done

		### Add ASN info of blocked countries to ASN array
		# Determine array index position
		if [ "${#_asn_array[@]}" -ge 1 ]; then
			_array_index=$((${#_asn_array[@]} + 1))
		else
			_array_index=0
		fi
		for _asn in $(GEO_ASN); do
			IS_ASN "${_asn}" || ERR "Invalid ASN: '${_asn}'"
			_asn_array[${_array_index}]="${_asn}"
			(( _array_index++ )) || true
		done
		### Parse non-ASN registered IP data
		GEOBLOCKER
	fi

	# Mark _asn_array as read-only
	readonly _asn_array

	# Perform Tor filtering if enabled
	if [ "${_TOR_BLOCK_ALL}" -eq 1 ] || [ "${_TOR_BLOCK_EXIT}" -eq 1 ] || [ "${_TOR_WHITELIST}" -eq 1 ]; then
		TOR_FILTER
	fi

	# Do ASN filtering if ASN found in array
	if [ "${#_asn_array[@]}" -gt 0 ]; then
		ASN_FETCH > "$(TMP_FILE)"
	fi

	# Fetch user-provided custom lists
	CUSTOM_LISTS

	# Gen user rules
	for _i in "${_user_rule[@]}"; do
		printf '%s\n' "${_i}"
	done > "${user_rules}"

	# Hail Mary Mitigation
	if [ "${_HAIL_MARY}" -eq 1 ]; then
		 HAIL_MARY_MITIGATE
	fi

	# Generate lists to load into PF
	LIST_GEN

	# If -x option is specified, we only print the list to stdout
	# without modifying the current pf-badhost table
	if [ "${_PRINT_ONLY}" -eq 1 ]; then
		cat -- "${finout}"
	else
		# Install Newly Generated Blocklist
		LIST_INSTALL
	fi

	# Print Blocklist Stats
	WARNING "$(PRINT_STATS)"
	# Clean up after ourselves
	CLEANUP
}

# ZSH needs to run in compatability mode to prevent it from puking
if command -v emulate >/dev/null 2>&1 ; then
	emulate -LR ksh
fi

# Make sure shell supports typeset
command -v typeset >/dev/null 2>&1 || ERR 'Are you running a modern shell? Current shell does not appear to support the non-POSIX "typeset" command...'

# Execute main function
main "$@"


