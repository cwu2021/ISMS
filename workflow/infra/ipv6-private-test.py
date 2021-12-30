#!/usr/bin/python
# http://csie.nqu.edu.tw/smallko/sdn/ipv6_test.htm
# [Topology] H1 ---- switch ----H2
"""
fc00::/7 , 128bit vs 32bit each. Ended at fdff:ffff:ffff:ffff:ffff:ffff:ffff:ffff 
"""
# https://en.m.wikipedia.org/wiki/IPv6_address 
# http://www.gestioip.net/cgi-bin/subnet_calculator.cgi

"""
Script created by VND - Visual Network Description (SDN version)
"""

from mininet.net import Mininet
from mininet.node import Controller, RemoteController, OVSKernelSwitch, OVSLegacyKernelSwitch, UserSwitch
from mininet.cli import CLI
from mininet.log import setLogLevel
from mininet.link import Link, TCLink

def topology():
    "Create a network."
    net = Mininet( controller=RemoteController, link=TCLink, switch=OVSKernelSwitch )
    print "*** Creating nodes"
    h1 = net.addHost( 'h1', mac='00:00:00:00:00:01', ip='10.0.0.1/24' )
    h2 = net.addHost( 'h2', mac='00:00:00:00:00:02', ip='10.0.0.2/24' )
    s4 = net.addSwitch( 's4', listenPort=6673, mac='00:00:00:00:00:04' )
    c7 = net.addController( 'c7', controller=RemoteController, ip='127.0.0.1', port=6633 )

    print "*** Creating links"
    net.addLink(h1, s4)
    net.addLink(s4, h2)

    print "*** Starting network"
    net.build()
    c7.start()
    s4.start( [c7] )
    s4.cmd("sysctl net.ipv6.conf.all.disable_ipv6=1")
    h1.cmd("ifconfig h1-eth0 inet6 add fc00::1/64")
    h2.cmd("ifconfig h2-eth0 inet6 add fc00::2/64")
    h1.cmdPrint("ping -c 3 10.0.0.2")
    h1.cmdPrint("ping6 -c 3 fc00::2 -I h1-eth0")
    h1.cmdPrint("route -6 -n")
    h1.cmdPrint("ip -6 neighbor show")
 
    print "*** Running CLI"
    CLI( net )

    print "*** Stopping network"
    net.stop()
   
if __name__ == '__main__':
    setLogLevel( 'info' )
    topology()
