=pod
 sudo apt install easy-rsa
 cp -a /usr/share/easy-rsa && cd easy-rsa
 cp vars.example vars && vi vars # EXPIRE ->3650
./easy-rsa help
./easy-rsa init-pki
./easy-rsa build-ca nopass
./easy-rsa gen-dh
./easy-rsa build-server full mysrv nopass
 ls pki/ca.crt pki/issued/mysrv.crt pki/private/mysrv.key
