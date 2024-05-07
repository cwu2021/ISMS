# rewrite from c# to perl by copilot
use strict;
use warnings;
use IO::Socket::INET;
use XML::Simple;

# Create a MOS heartbeat message
my $heartbeat = {
    time => scalar(localtime),
};

# Create a MOS message
my $mos = {
    messageID => 333,
    mosID     => "MOSDEVICEID",
    ncsID     => "NCSID",
    heartbeat => $heartbeat,
};

# Serialize MOS object to XML
my $xml = XMLout($mos, RootName => 'mos', NoAttr => 1);

# Create a TCP connection with the MOS device
my $mosHost = '10.1.0.94';
my $mosPort = 10641;
my $mosClient = IO::Socket::INET->new(
    PeerAddr => $mosHost,
    PeerPort => $mosPort,
    Proto    => 'tcp',
) or die "Error creating MOS connection: $!";

# Send the MOS object XML to the MOS device
print $mosClient $xml;
close $mosClient;
