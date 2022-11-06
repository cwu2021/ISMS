#!/usr/bin/env perl
# https://www.redhat.com/en/blog/using-daysofriskpl-red-hat-security-data-api
# https://access.redhat.com/security/data/metrics/daysofrisk.pl?extIdCarryOver=true&sc_cid=701f2000001OH6fAAG
#
# daysofrisk.pl
#
# Generate statistics on "days of risk" for vulnerabilities in Red Hat
# products.  This is based on the definition of "days of risk" as starting
# from when a vulnerability is first made public and ending when Red Hat
# release an update to fix that vulnerability.
#
# Copyright Red Hat 2002-2021 mjc@redhat.com
# https://access.redhat.com/security/data/
#
# Input files you'll need to download to run this script:
#
# https://access.redhat.com/security/data/metrics/cve_dates.txt
#         A mapping of CVE name to severity and date, this
#         is generated mostly by hand from our vulnerability work
#
# https://access.redhat.com/security/data/metrics/release_dates.txt
#         dates we first published a RHSA, generated
#         partially from RHN partially from archives and partially from hand
#
# https://access.redhat.com/security/data/metrics/rhsamapcpe.txt
#         A mapping of RHSA to CVE names, generated automatically
#         from our errata database.  Also maps RHSA to product CPE

use strict;
use Getopt::Long;
use Time::Local;

my @cli_opts;
foreach my $a(@ARGV) {
    push (@cli_opts, "$a");
}

my %options;
my $success = GetOptions(\%options,
                         'distrib=s',
                         'cpe=s',
                         'cpeexclude=s',
                         'cpelist=s',
                         'datestart=s',
                         'dateend=s',
                         'dates=s',
                         'days=s',
                         'severity=s',
                         'cvss=s',
                         'cvss3=s',
                         'xmlsummary=s',
                         'quiet', 'verbose',
                         'csv',
                         'help');

if (!$success || exists $options{'help'}) {
    print <<EOF;
usage: daysofrisk.pl [OPTIONS]
  --cpe <product/package to generate stats for>
            [examples: --cpe all
                       --cpe enterprise_linux
                       --cpe enterprise_linux:3
                       --cpe enterprise_linux:5::client/firefox
                       --cpe /httpd ]
  --cpeexclude
            [product/package to exclude from stats]
  --severity <all|C|I|M|L|CI|CIM|IL...>
            [filter severity, 'C'ritical 'I'mportant 'M'oderate 'L'ow]
  --cvss <range>
            [filter on CVSSv2 base score, example '6.8'|'0-5'|'8-10'|'high'|...]
  --cvss3 <range>
            [filter on CVSSv3 base score, example '6.8'|'0.1-5'|'high'|'critical'|...]
  --dates [<YYYYMMDD>]-[<YYYYMMDD>]
            [date range, default is 'all', example '20090101-'|'20080203-20080303']
  --datestart [<YYYYMMDD>]
            [start date, example '20090101']
  --dateend [<YYYYMMDD>]
            [end date, example '20100101']
  --xmlsummary <filename>
            [output the XML summary to this file, default summary.xml]
  --csv
            [append results as a comma-separated list]
  --quiet|verbose
            [set verbosity level]
  --help
            [show this help]
EOF
    exit(1);
}
my $xml_filename = $options{'xmlsummary'} || "summary.xml";
my $filter_distrib = $options{'distrib'};
my $filter_cpe = $options{'cpe'} || "enterprise_linux:5::server";
my $filter_cpelist = $options{'cpelist'};

# CVSSv2
my $filter_cvss = $options{'cvss'};
my $filter_cvssmin = 0;
my $filter_cvssmax = 10;
if ($filter_cvss) {
    $filter_cvss = "0-3.9" if ($filter_cvss =~ m/^l/i); # http://nvd.nist.gov/cvss.cfm 'low'
    $filter_cvss = "4-6.9" if ($filter_cvss =~ m/^m/i); # 'medium'
    $filter_cvss = "7-10" if ($filter_cvss =~ m/^h/i);  # 'high'
    $filter_cvss .= "-".$filter_cvss unless ($filter_cvss =~ m/-/);

    if ($filter_cvss =~ m/^([\d\.]*)-([\d\.]*)$/) {
        $filter_cvssmin = $1 if $1;
        $filter_cvssmax = $2 if $2;
    }
}

# CVSSv3
my $filter_cvss3 = $options{'cvss3'};
my $filter_cvss3min = 0;
my $filter_cvss3max = 10;
if ($filter_cvss3) {
    # https://www.first.org/cvss/specification-document#i5
    $filter_cvss3 = "0.1-3.9" if ($filter_cvss3 =~ m/^l/i); # 'low'
    $filter_cvss3 = "4-6.9" if ($filter_cvss3 =~ m/^m/i); # 'medium'
    $filter_cvss3 = "7-8.9" if ($filter_cvss3 =~ m/^h/i);  # 'high'
    $filter_cvss3 = "9-10"  if ($filter_cvss3 =~ m/^c/i);  # 'critical'
    $filter_cvss3 .= "-".$filter_cvss3 unless ($filter_cvss3 =~ m/-/);

    if ($filter_cvss3 =~ m/^([\d\.]*)-([\d\.]*)$/) {
        $filter_cvss3min = $1 if $1;
        $filter_cvss3max = $2 if $2;
    }
}

if ($filter_distrib) {
    $filter_cpe = "";  # Compatibility with older daysofrisk.pl
    $filter_cpe = "rhel_application_server".($1?":$1":"") if $filter_distrib =~ m/^appserver(\d*)/;
    $filter_cpe = "directory_server".($1?":$1":"") if $filter_distrib =~ m/^directory(\d*)/;
    $filter_cpe = "rhel_extras".($1?":$1":"") if $filter_distrib =~ m/^extras(\d*)/;
    $filter_cpe = "rhel_application_stack".($1?":$1":"") if $filter_distrib =~ m/^stack(\d*)/;
    $filter_cpe = "enterprise_linux".($1?":$1":"") if $filter_distrib =~ m/^rhel(\d*)/;
    $filter_cpe = "all" if $filter_distrib eq "all";
    print "** NOTE --distrib $filter_distrib is deprecated, use '--cpe $filter_cpe' instead\n\n";
    sleep(1);
}

my $new_filter_cpe;
my $filter_cpe_fixed;
foreach my $cpepart (split(/,/,$filter_cpe)) {
    $cpepart = "" if ($cpepart eq "all");
    $cpepart =~ s|^cpe://||;
    $cpepart =~ s|^cpe:/\S?:||;
    $cpepart = "redhat:".$cpepart unless ($cpepart =~ m/^redhat:/);

# Someone might specify part of a CPE name but add a package, for example
# redhat:enterprise_linux/firefox -- find all firefox in RHEL
# so we need to make up a cpe regexp

    my ($cpe_product,$cpe_package) = split(/\//,$cpepart);
    my $cpe_fixed = $cpepart;
    if ($cpe_package  ) {
        my ($cpe_os,$cpe_prod,$cpe_ver,$cpe_upd,$cpe_var) = split(/:/,$cpe_product);
        $cpe_product = join("[:]?",$cpe_os,($cpe_prod?$cpe_prod:"[^:]*"),($cpe_ver?$cpe_ver:"[^:]*"),($cpe_upd?$cpe_upd:"[^:]*"),($cpe_var?$cpe_var:"[^:]*"));
        $cpe_fixed = join("/",$cpe_product,$cpe_package);
    }
    $new_filter_cpe .= "," if ($new_filter_cpe ne "");
    $new_filter_cpe .= $cpepart;
    $filter_cpe_fixed .= "," if ($filter_cpe_fixed ne "");
    $filter_cpe_fixed .= $cpe_fixed;
}
$filter_cpe = $new_filter_cpe;

my $filter_severity = $options{'severity'} || "all";

my $filter_datestart = $options{'datestart'};
my $filter_dateend = $options{'dateend'};
my $filter_dates = $options{'dates'};

if ($filter_dates) {
    $filter_dates .= "-".$filter_dates unless ($filter_dates =~ m/-/); # expect a range
    if ($filter_dates =~ m/^([\d]*)-([\d]*)$/) {
        $filter_datestart = $1 if $1;
        $filter_dateend = $2 if $2;
    }
}

my $filter_days = $options{'days'};
my $verbose = $options{'verbose'} ? 1:0; #$options{'quiet'}? 0:1;

# A user can't be vulnerable to an issue for more days than
# the distribution was public in the first place, so this is a
# table of release dates
#
my %releasedate = ("redhat:enterprise_linux:2.1" => "20020517",
                   "redhat:enterprise_linux:3" => "20031022",
                   "redhat:rhel_extras:3" => "20031022",
                   "redhat:enterprise_linux:4" => "20050215",
                   "redhat:rhel_extras:4" => "20050215",
                   "redhat:enterprise_linux:5" => "20070314",
                   "redhat:rhel_extras:5" => "20070314",
                   "redhat:enterprise_linux:6" => "20101110",
                   "redhat:rhel_extras:6" => "20101110",
                   "redhat:enterprise_linux:7" => "20140610",
                   "redhat:rhel_extras:7" => "20140610",
                   "redhat:rhel_application_stack:1" => "20060918",
                   "redhat:rhel_application_stack:2" => "20070918",
                   "redhat:certificate_system:7.1" => "20050607",
                   "redhat:certificate_system:7.2" => "20061030",
                   "redhat:certificate_system:7.3" => "20070511",
                   "redhat:directory_server:7.1" => "20050607",
                   "redhat:rhel_application_server:1" => "20040802",
                   "redhat:rhel_application_server:2" => "20050916"
                   );

my %SOURCEMAP = load_sourcemap();
my %CVE2DATA = load_cve_metadata("cve_dates.txt");
my %RHSA2DATE = load_release_dates("release_dates.txt");
my %CVE2RHSA = load_rhsa_map("rhsamapcpe.txt");
my %RHSA2PRODUCT = load_rhsa_products("rhsamapcpe.txt");
my %CPELIST = load_cpelist($filter_cpelist);

open(SUMMARY,">$xml_filename");
print SUMMARY "<summary>\n";

my ($number, $maxdays, $total, $advisories) = 0;
my @values;
my %RHSAseverity;
my %RHSAcvss;
my %filteredSEV;
my %filteredRHSA;
my $filteredRHSAcount = 0;
my %SEVCOUNT;
my %seen;

if ($filter_days) {
    if ($filter_datestart) {
        $filter_dateend = add_days($filter_datestart, $filter_days);
    } elsif ($filter_dateend) {
        $filter_datestart = add_days($filter_dateend, -$filter_days);
    }
}

if (!$filter_dateend) {
    my ($x,$x,$x,$d,$m,$y) =localtime(time);
    $filter_dateend = sprintf("%04d%02d%02d",$y+1900,$m+1,$d);
}

my $out_datestart = $filter_datestart;
my $out_dateend = $filter_dateend;

foreach my $can (sort keys %CVE2RHSA) {
    my ($earliest, $days_difference, $affectedadvisories) = undef;
    my $days_count = 0;
    my $count2 = 0;
    my $cvedate = $CVE2DATA{"public=".$can};

    if (!$cvedate) {
        print "Warning: Missing earliest date for $can ($CVE2RHSA{$can})\n" if $verbose;
        next;
    }
    foreach my $advisory (split(/ /,$CVE2RHSA{$can})) {
        my $match = 0;
        foreach my $cpe (split(',',$RHSA2PRODUCT{$advisory})) {
            my $matchcpe = 0;
            my $skipadvisory = 0;
            if ($filter_cpe_fixed) {
                foreach my $filter_cpe (split(/,/,$filter_cpe_fixed)) {
                    if ($cpe =~ m/$filter_cpe/) {
                        $matchcpe = 1;
                        last;
                    }
                }
            }
            if ($options{'cpeexclude'}) {
                foreach my $filter_cpe (split(/,/,$options{'cpeexclude'})) {
                    if ($cpe =~ m/$filter_cpe/) {
                        $matchcpe = 0;
                        $skipadvisory = 1;
                        last;
                    }
                }
            }
            if ($skipadvisory == 0 && (($matchcpe == 1) ||($CPELIST{$cpe}))) {
                if (!$RHSA2DATE{$advisory}) {
                    print "Warning: Missing release date for $advisory\n" if ($cpe !~ m/:linux|:powertools|:secure_/ && $verbose);
                    last;
                }
                my $fromdate = $cvedate;
                $cpe =~ m|^(redhat:[^:]+:[^(:/)]+)|;
                my $reldate = $releasedate{$1};
                $fromdate = $reldate if ($reldate && ($reldate > $fromdate));
                my $days = diff_days($RHSA2DATE{$advisory},$fromdate);
                $match = $cpe;
                if (!$days_count || $days_difference > $days) {
                    $days_difference = $days;
                    $earliest = substr($RHSA2DATE{$advisory},0,8);
                    $cvedate = $fromdate;
                    $days_count++;
                }
            }
        }
        next unless $match;
        next unless ((!$filter_datestart || ($RHSA2DATE{$advisory} >= $filter_datestart)) &&
                     (!$filter_dateend || ($RHSA2DATE{$advisory} <= $filter_dateend)));

        $count2++;
        # Work out the worst severity rating for this RHSA

        if (!$seen{$advisory}) {
            $advisories++;
            $seen{$advisory}=1;
        }
        if ($affectedadvisories !~ m/$advisory/) {
            $affectedadvisories.=" " unless !$affectedadvisories;
            $affectedadvisories.=$advisory;
        }
        my ($cpe,$pkg) = split(/\//,$match);
        my $cve2impact = $CVE2DATA{"impact=".$can."-".$pkg} ||
            $CVE2DATA{"impact=".$can."-".$advisory} || $CVE2DATA{"impact=".$can};
        my $cve2cvss = $CVE2DATA{"cvss2=".$can."-".$pkg} ||
            $CVE2DATA{"cvss2=".$can."-".$advisory} || $CVE2DATA{"cvss2=".$can};
        $RHSAcvss{$advisory} = $cve2cvss if ($cve2cvss > $RHSAcvss{$advisory});
        if (!$RHSAseverity{$advisory}) {
            $RHSAseverity{$advisory} = $cve2impact;
        } else {
            my $s1 = index("LMIC",$RHSAseverity{$advisory});
            my $s2 = index("LMIC",$cve2impact);
            $RHSAseverity{$advisory} = $cve2impact if ($s2>$s1);
        }
    }
    next unless $earliest;

    if (!$CVE2DATA{"impact=".$can} && $verbose) {
        print "Warning: No severity for $can\n";
    }

    if ($count2) {

	my $flawtype;
        $CVE2RHSA{$can} =~ s/([\s\r\n])$//;

        # This foreach below is needed for the case where an issue has
        # a different severity for one distribution than another, for
        # example if something is caught by FORTIFY_SOURCE.  We need
        # to work out what the impact of the CVE is, but only looking
        # at those advisories for which we care about

        my $cveseverity = -1;
        my $cvecvss = 0;
        my $cvecvss3 = 0;
        foreach my $tempadv (split(/ /,$affectedadvisories)) {
            my $cve2impact = $CVE2DATA{"impact=".$can."-".$filter_distrib} ||
                $CVE2DATA{"impact=".$can."-".$tempadv} || $CVE2DATA{"impact=".$can};

            # CVSSv2
            my $cve2cvss = $CVE2DATA{"cvss2=".$can."-".$filter_distrib} ||
                $CVE2DATA{"cvss2=".$can."-".$tempadv} || $CVE2DATA{"cvss2=".$can};
            $cvecvss = $cve2cvss if ($cve2cvss > $cvecvss);

            # CVSSv3
            my $cve2cvss3 = $CVE2DATA{"cvss3=".$can."-".$filter_distrib} ||
                $CVE2DATA{"cvss3=".$can."-".$tempadv} || $CVE2DATA{"cvss3=".$can};
            $cvecvss3 = $cve2cvss3 if ($cve2cvss3 > $cvecvss3);

            my $s1 = index("LMIC",$cveseverity);
            my $s2 = index("LMIC",$cve2impact);
            $cveseverity = $cve2impact if ($s2>$s1);
        }
        if ($filter_severity eq "all" ||
            ($cveseverity && $filter_severity =~ m/[$cveseverity]/)) {

            if ((!$filter_cvss && !$filter_cvss3)
                || ($filter_cvss && ($cvecvss >= $filter_cvssmin) && ($cvecvss <= $filter_cvssmax))
                || ($filter_cvss3 && ($cvecvss3 >= $filter_cvss3min) && ($cvecvss3 <= $filter_cvss3max))) {

            # Severity is within our filter

            if ((!$filter_datestart || ($earliest >= $filter_datestart)) &&
                (!$filter_dateend || ($earliest <= $filter_dateend)) || 1) {

                $out_datestart = $earliest if (!$out_datestart || $out_datestart > $earliest);
                $out_dateend = $earliest if (!$out_dateend || $out_dateend < $earliest);

                $number++;
                $days_difference = 0 if ($days_difference <0) ;
                push(@values,$days_difference);
                $total += $days_difference;
                $maxdays = $days_difference if ($maxdays < $days_difference);

                $SEVCOUNT{$cveseverity}++;

                print SUMMARY "<item>\n";
                print SUMMARY "  <cve>$can</cve>\n";
                print SUMMARY "  <severity>$cveseverity</severity>\n";
                my $src = lc($CVE2DATA{"source=".$can});
                if ($src && $SOURCEMAP{$src}) {
                    print SUMMARY "  <source>$SOURCEMAP{$src}</source>\n";
                } elsif ($src) {
                    print SUMMARY "  <source>[$src]</source>\n";
                }
                print SUMMARY "  <reportedon>$CVE2DATA{'reported='.$can}</reportedon>\n";

                print SUMMARY "  <cvss>$cvecvss</cvss>\n" if ($cvecvss);
                print SUMMARY "  <cvss3>$cvecvss3</cvss3>\n" if ($cvecvss3);

                foreach my $tempadv (split(/ /,$affectedadvisories)) {
                    print SUMMARY "  <fixedby>$tempadv</fixedby>\n";

                    next if $filteredRHSA{$tempadv};
                    $filteredRHSA{$tempadv}=1;
                    $filteredRHSAcount++;
                }
                print SUMMARY "  <fixedon>$earliest</fixedon>\n";
                print SUMMARY "  <publicon>$cvedate</publicon>\n";
                print SUMMARY "  <daysdiff>$days_difference</daysdiff>\n";
                print SUMMARY "</item>\n\n";
            }
            }
        }
    }
}
my $prod = $CPELIST{'description'} || cpe_to_text($filter_cpe);
my $sev = severity_to_text($filter_severity);
print SUMMARY "<filter><distrib>$prod</distrib>";
foreach my $splitcpe (split(/,/,$filter_cpe)) {
    $splitcpe = "cpe:/o:".$splitcpe unless ($splitcpe =~ m/^from/);
    print SUMMARY "<cpe>$splitcpe</cpe>";
}
print SUMMARY "<cvssmin>$filter_cvssmin</cvssmin><cvssmax>$filter_cvssmax</cvssmax>";
print SUMMARY "<cvss3min>$filter_cvss3min</cvss3min><cvss3max>$filter_cvss3max</cvss3max>";
print SUMMARY "<severity>$sev</severity><start>$out_datestart</start><end>$filter_dateend</end></filter>\n";

print "Matched $advisories advisories before filtering\n" if $verbose;
print "After filtering, all days: ".join(" ",sort({$a<=>$b}@values))."\n\n" if $verbose;

my @stat;
my @csv;

print "** Product: $prod\n";
print "** CPE: $filter_cpe\n";
print "** Severity: $sev\n";
print "** CVSS base range: $filter_cvssmin-$filter_cvssmax\n" if ($filter_cvss);
print "** CVSSv3 base range: $filter_cvss3min-$filter_cvss3max\n" if ($filter_cvss3);
$filter_datestart = $releasedate{$filter_distrib} unless ($filter_datestart);
$filter_datestart = $out_datestart unless ($filter_datestart);
my $summary_days = diff_days($filter_dateend,$filter_datestart)+1;
print "** Dates: $filter_datestart - $filter_dateend ($summary_days days)\n\n";

printf "** $filteredRHSAcount advisories (";
push (@csv, "$filteredRHSAcount");
foreach my $tempadv (keys %filteredRHSA) {
    $filteredSEV{$RHSAseverity{$tempadv}}++;
}
foreach my $sev (sort keys %filteredSEV) {
    print $sev?$sev:"unknown";
    print "=".$filteredSEV{$sev}." ";
}
print ")\n";
print "** $number vulnerabilities (";
push (@csv, "$number");
foreach my $sev (sort keys %SEVCOUNT) {
    print $sev?$sev:"unknown";
    print"=".$SEVCOUNT{$sev}." ";
}
print ")\n";

if ($summary_days != 0) {
    my $workload = ($SEVCOUNT{"C"}+$SEVCOUNT{"I"}+$SEVCOUNT{"M"}/5+$SEVCOUNT{"L"}/20)/$summary_days;
    my $advworkload = ($filteredSEV{"C"}+$filteredSEV{"I"}+$filteredSEV{"M"}/5+$filteredSEV{"L"}/20)/$summary_days;

    printf "** Advisory Workload index is %.2f\n", $advworkload;
    push (@csv, sprintf ("%.2f", $advworkload));
    printf "** Vulnerability Workload index is %.2f\n", $workload;
    push (@csv, sprintf ("%.2f", $workload));
}

print SUMMARY "<totals>\n";

my $median = median(@values);
if ($number != 0){
    my $average_days = int($total/$number+0.5);
    print "** Average is $average_days days\n";
    print SUMMARY "<num>$number</num><av>$average_days</av><median>$median</median>";
    push (@csv, "$average_days");
}

print "** Median is $median days\n";
push (@csv, "$median");

for my $date (@values) {
    for (my $i=90; $i >= $date; $i--) {
        $stat[$i]++;
    }
}
if ($number != 0) {
    my $zero_day = int($stat[0]/$number*100);
    print "** $zero_day% were 0day\n";
    push (@csv, "$zero_day%");

    my $one_day = int($stat[1]/$number*100);
    print "** $one_day% were within 1 day\n";
    print SUMMARY "<oneday>".int($one_day+0.5)."</oneday>\n";
    push (@csv, "$one_day%");

    my $seven_days = int($stat[7]/$number*100);
    print "** $seven_days% were within 7 days\n";
    push (@csv, "$seven_days%");

    my $fourteen_days = int($stat[14]/$number*100);
    print "** $fourteen_days% were within 14 days\n";
    push (@csv, "$fourteen_days%");

    my $month_days = int($stat[31]/$number*100);
    print "** $month_days% were within 31 days\n";
    push (@csv, "$month_days%");

    my $ninety_days = int($stat[90]/$number*100);
    print "** $ninety_days% were within 90 days\n";
    push (@csv, "$ninety_days%");
}
print SUMMARY "</totals></summary>\n";

if (exists $options{'csv'}) {
    print "\n---\n\n";
    print "criteria,advisories,vulnerabilities,awi,vwi,average,median,0day,1 day,7 days,14 days,31 days,90 days\n";
    print join(" ", @cli_opts).",".join(",", @csv)."\n";
}

exit;

############################################################
#
# Quick hacks to load the various files we want to parse.
# In some cases we load the same file twice and parse it
# different ways, this is historical since sometimes the
# data came from different files and got merged in 2004
#

sub load_release_dates {
    my ($filename) = (@_);
    my %DATE;
    my $x = 0;
    open(RD,"<$filename") || die "$filename missing. $!";
    while(<RD>) {
	chop;
	my ($rhsa,$date)=split(/ /);
        next if ($DATE{$rhsa} && ($DATE{$rhsa} < $date));
	$DATE{$rhsa} = $date;
	$x++;
    }
    close(RD);
    print "Loaded ".($x+1)." Red Hat release dates from $filename\n" if $verbose;

    return %DATE;
}

sub load_rhsa_map {
    my ($filename) = (@_);
    open(RD,"<$filename") || die "$filename missing. $!";
    my %MAP;
    my $x = 0;
    while(<RD>) {
        my ($rhsa,$cvenames,$cpenames)=split(' ');
        $cvenames =~ s/CAN-/CVE-/g;
        foreach my $cve (split(',',$cvenames)) {
            $MAP{$cve} .= $rhsa." ";
        }
        $x++;
    }
    close(RD);
    print "Loaded ".($x+1)." RHSA with CVE mappings from $filename\n" if $verbose;
    return %MAP;
}

sub load_rhsa_products {
    my ($filename) = (@_);
    open(RD,"<$filename") || die "$filename missing. $!";
    my %MAP;
    my $x = 0;
    while(<RD>) {
        chop;
        my ($rhsa,$cvenames,$cpenames)=split(' ');
        $cpenames =~ s|cpe:/\S?:||g; # CPE v2 style names
        $cpenames =~ s|cpe://||g; # old CPE style names
        $MAP{$rhsa} = $cpenames;
        $x++;
    }
    close(RD);
    print "Loaded ".($x+1)." RHSA to product mappings from $filename\n" if $verbose;
    return %MAP;
}

sub load_cpelist {
    my ($filename) = (@_);
    return unless $filename;
    open(RD,"<$filename") || die "$filename missing. $!";
    my %MAP;
    my $x = 0;
    $MAP{'description'} = <RD>;
    while(<RD>) {
        chop;
        s|cpe:/\S?:||g; # CPE v2 style names
        s|cpe://||g; # old CPE style names
        $MAP{$_} = 1;
        $x++;
    }
    close(RD);
    $filter_cpe = "from file $filename";
    $filter_cpe_fixed = "";
    print "Loaded ".($x+1)." CPE names to filter from $filename\n" if $verbose;
    return %MAP;
}

sub load_cve_metadata {
    my ($filename) = (@_);
    open(CVE,"<$filename") || die "$filename missing. $!";
    my %CVE;
    my $x = 0;
    while(<CVE>) {
        s/CAN/CVE/;
	next unless (my ($cve,$data) = m/^(CVE-\d{4}-\d+\S*)\s*(.*)/);
        foreach my $segment (split(/,/,$data)) {
            my $thiscve = $cve;
            my ($name,$value) = split(/=/,$segment);
            # Allow format overide like "impact(RHSA-2009:1584)=important"
            if ($name =~ m/(^[^\(]+)\(([^\)]+)/) {
                $name = $1;
                $thiscve.="-".$2;
            }
            $value =~ tr/a-z/A-Z/;
            $value = substr($value, 0, 1) if ($name =~ m/impact/i);
            $value = substr($value, 0, 8) if ($name =~ m/public/i);
            $value = $1 if ($name =~ m/cvss\d/i && $value =~ m/^([^\/]+)/i);
            $CVE{$name."=".$thiscve}=$value;
        }
        $x++;
    }
    close(CVE);
    print "Loaded ".($x+1)." CVE metadata from $filename\n" if $verbose;
    return %CVE;
}

sub load_sourcemap {
    my %p;

    # Categorise source= so we can do things like http://awe.com/mark/blog/200603211056.html

    # From an upstream
    $p{'mozilla'}=$p{'kernelsec'}=$p{'asf'}=$p{'bind'}='relationship';
    $p{'wireshark'}=$p{'freeradius'}=$p{'upstream'}=$p{'isc'}='relationship';
    $p{'squid'}=$p{'real'}=$p{'openssl'}=$p{'gnome'}=$p{'oracle'}='relationship';
    $p{'gaim'}=$p{'adobe'}=$p{'pidgin'}='relationship';
    $p{'postgresql'}=$p{'apple'}=$p{'google'}='relationship';
    $p{'openoffice'}=$p{'openoffice.org'}=$p{'mit'}=$p{'xpdf'}='relationship';
    $p{'netdev'}=$p{'kernel'}=$p{'xchat'}=$p{'php'}=$p{'squirrelmail'}='relationship';
    $p{'samba'}=$p{'macromedia'}=$p{'gnupg'}=$p{'fetchmail'}=$p{'sunsolve'}='relationship';
    $p{'cansecwest'}=$p{'mageia'}=$p{'sun'}=$p{'xen'}=$p{'kvm'}='relationship';
    $p{'freedesktop.org'}=$p{'hp'}='relationship';

    # From some public internet mailing list or by us watching some vulnerability
    $p{'bugtraq'}=$p{'lkml'}=$p{'bk'}=$p{'lwn'}='mailinglist';
    $p{'osssecurity'}=$p{'osssec'}=$p{'internet'}=$p{'fulldisclosure'}=$p{'oss-security'}='mailinglist';
    $p{'mailinglist'}=$p{'sunalert'}=$p{'xfs'}=$p{'xfs-masters'}=$p{'kvm-list'}='mailinglist';
    $p{'apacheannounce'}=$p{'vuln-dev'}=$p{'kernelbugzilla'}='mailinglist';
    $p{'vulnwatch'}=$p{'press'}=$p{'twitter'}=$p{'securityfocus'}='mailinglist';
    $p{'ml'}=$p{'internet'}=$p{'git'}='mailinglist';

    # From a researcher, customer, or other individual
    $p{'secalert'}=$p{'bugzilla'}=$p{'it'}=$p{'bz'}=$p{'gss'}=$p{'rt'}=$p{'individual'}='individual';
    $p{'researcher'}=$p{'reporter'}=$p{'customer'}='individual';

    # From a vendor we share information with
    $p{'debian'}=$p{'gentoo'}=$p{'suse'}=$p{'ubuntu'}='othervendor';
    $p{'openbsd'}=$p{'novell'}=$p{'oraclelinux'}='othervendor';

    # From a research firm (usually a broker for researcher)
    $p{'secunia'}=$p{'isec'}=$p{'corelabs'}=$p{'idefense'}='researchfirm';
    $p{'frsirt'}=$p{'symantec'}='researchfirm';

    # CERT (or country equivalent)
    $p{'niscc'}=$p{'cert'}=$p{'jpcert'}=$p{'ocert'}=$p{'cpni'}='cert';

    # http://oss-security.openwall.org/wiki/mailing-lists/distros
    $p{'vendorsec'}=$p{'linuxdistros'}=$p{'distros'}='distrosprivate';

    # Mailing list of newly assigned public CVE names
    $p{'cve'}='cvenotification';

    # Found by Red Hat
    $p{'redhat'}=$p{'jboss'}=$p{'fedora'}='redhat';

    return %p;
}

# Other useful routines to save requiring more modules for trivial things

sub median {
    my(@values) = sort({$a <=>$b} @_);
    my($mid) = scalar(@values) >> 1;
    return ($values[$mid]) if $mid & 1;
    return ($values[$mid-.5] + $values[$mid+.5]) / 2;
}

# Dates will be YYYYMMDD or YYYYMMDD:hhmm although we don't take
# account of the hours for the metrics as we don't have the exact
# public time for many of the issues (load_cve_metadata strips the hour)

sub diff_days {
    my ($date1, $date2) = (@_);
    return unless $date1 and $date2;
    my $hour1 = substr($date1,9,2) || 0;
    my $hour2 = substr($date2,9,2) || $hour1;
    my $time1 = timegm(0,0,$hour1,substr($date1,6,2),substr($date1,4,2)-1,
		       substr($date1,0,4));
    my $time2 = timegm(0,0,$hour2,substr($date2,6,2),substr($date2,4,2)-1,
		       substr($date2,0,4));
    return int(($time1 - $time2) / 86400);
}

# Add days... YYYYMMDD + days = YYYYMMDD

sub add_days {
    my ($date1, $days) = @_;
    my $time1 = timegm(0,0,0,substr($date1,6,2), substr($date1,4,2)-1,
                       substr($date1,0,4));
    $time1 += $days * 86400;
    my ($x,$x,$x,$d,$m,$y) = gmtime($time1);
    return sprintf("%04d%02d%02d",$y+1900,$m+1,$d);
}

# Convert the CPE to something more human readable (even if not 100%
# correct full-text product name

sub cpe_to_text {
    my $prod;
    foreach my $cpepart (split(/,/,@_[0])) {
        my ($cpe_product,$cpe_package) = split(/\//,$cpepart);
        my ($cpe_os,$cpe_prod,$cpe_ver,$cpe_upd,$cpe_var) = split(/:/,$cpe_product);
        $cpe_os =~ s/redhat/Red Hat/;
        $cpe_prod =~ s/rhel_//;
        $cpe_prod =~ s/eus/Enterprise Linux Extended Update Support/;
        $cpe_prod =~ s/_/ /g;
        $cpe_prod =~ s/\b(\w)/\U$1/g;
        $cpe_ver = "(all versions)" unless $cpe_ver;
        $cpe_prod = "(all products)" unless $cpe_prod;
        if ($cpe_package) {
            $cpe_package = "(package ".$cpe_package.")";
        } else {
            $cpe_package = "(all packages)";
        }
        $prod .= ", " unless ($prod eq "");
        $prod .= join(' ',$cpe_os,$cpe_prod,$cpe_ver,$cpe_upd,$cpe_var,$cpe_package);
    }
    $prod =~ s/\s+/\ /g;
    return $prod;
}

# Severity short to human readable

sub severity_to_text {
    my ($sev) = @_;
    $sev =~ s/all/CIML/;
    $sev =~ s/C/Critical /;
    $sev =~ s/I/Important /;
    $sev =~ s/M/Moderate /;
    $sev =~ s/L/Low /;
    return $sev;
}
