#!/usr/bin/perl
# auto rebooting device via telnet. (Aug 11, 2013)
    use Net::Telnet ();
    $t = new Net::Telnet (Timeout => 5,
                          Prompt => '/\[root\#\] $/');
    $t->open("device.ip");
    $t->waitfor('/User: $/');
    $t->print("root");
    $t->waitfor('/Password: $/');
    $t->print("root");
    $t->waitfor('/\[root\#\] $/');
    $t->print("reboot");
#    @lines = $t->cmd("help\n");
#    print @lines;
($response) = $t->waitfor('/\[root\#\] $/');
#($response) = $t->waitfor('/$/');
print $response;
