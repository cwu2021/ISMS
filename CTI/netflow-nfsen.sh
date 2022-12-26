#!/bin/ksh
# https://bsdly.blogspot.com/2014/02/yes-you-too-can-be-evil-network.html
doas pkg_add nfsen
cat >> /etc/nfsen.conf << EOF
%sources = (
    'upstream1'    => { 'port' => '9995', 'col' => '#0000ff', 'type' => 'netflow' },
    'peer1'        => { 'port' => '9996', 'IP' => '172.16.17.18' },
    'peer2'        => { 'port' => '9996', 'IP' => '172.16.17.19' },
);
EOF
