#!/bin/bash

if [ -z "$USER" ]
then
    echo '[-] Please give a username to use in the API authentication'
    exit -1
fi

if [ -z "$PASSWORD" ]
then
    echo '[-] Please give a password for the username to use in the API authentication'
    exit -1
fi

cat > /etc/bitcoind.conf << EOF
rpcuser=${USER}
rpcpassword=${PASSWORD}
server=1
rpcallowip=::/0
EOF

echo '[+] Starting bitcoind'

bitcoind -debug-net -upgradewallet -printtoconsole -datadir=/data -config=/etc/bitcoind.conf
