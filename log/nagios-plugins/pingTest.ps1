# To add an additional IP address to an existing network interface in Windows 11, you need to access the network adapter's properties and configure the advanced TCP/IP settings: ncpa.cpl
# Gemeni Summary with .NET: 
$ping = New-Object System.Net.Networkinformation.Ping
1..254 | ForEach-Object {
    $ping.Send("192.168.0.$_") | Select-Object Address, Status, RoundtripTime
}
# ipv6 can also be disabled from ncpa.cpl to prevent ISP autoconfig, which may result in regional block and ipv4/ipv6 mis-config.
