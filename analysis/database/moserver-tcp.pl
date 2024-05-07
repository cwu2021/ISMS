# code a simple tcp server in perl by microsoft copilot.
# Ports 10540, 10541 and 10542 used in older MOS protocol versions  
# https://github.com/AirshiftMedia/OpenMOS/tree/master/bin

use IO::Socket::INET;

# Enable auto-flush on the socket
$| = 1;

# Create a listening socket
my $socket = new IO::Socket::INET(
    LocalHost => '0.0.0.0',
    LocalPort => '10541',
    Proto     => 'tcp',
    Listen    => 5,
    Reuse     => 1
);

die "Cannot create socket: $!\n" unless $socket;

print "Server waiting for client connection on port 10541\n";

while (1) {
    # Wait for a new client connection
    my $client_socket = $socket->accept();

    # Get information about the newly connected client
    my $client_address = $client_socket->peerhost();
    my $client_port    = $client_socket->peerport();
    print "Connection from $client_address:$client_port\n";

    # Read up to 1024 characters from the connected client
    my $data = "";
    $client_socket->recv($data, 1024);
    print "Received data: $data\n";

    # Write response data to the connected client
    $data = "ok";
    $client_socket->send($data);

    # Notify the client that the response has been sent
    shutdown($client_socket, 1);
}

$socket->close();    
