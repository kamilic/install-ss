#!/bin/sh
if [ ! -n "$1" ]
then
        echo "parameter 1 is not defined."
        exit 1;
fi

if [ ! -n "$2" ]
then
        echo "parameter 2 is not defined."
        exit 1;
fi

jsonText='{
    "server":"'$1'",
    "server_port":8388,
    "local_address":"127.0.0.1",
    "local_port":1080,
    "password":"'$2'",
    "timeout":500,
    "method":"aes-256-cfb"
}';

echo "Writing config files...."

if [ -d /home/ss ]
then
    echo "dir /home/ss exists."
    cd /home/ss
else
    echo "dir /home/ss doesn't exist."
    cd /home
    echo "create dir /home/ss"
    mkdir /ss
fi

echo "$jsonText" | cat > /home/ss/ss-config.json

echo "Writing config files.... done."

echo "installing shadowsocks.... (1/5)"
apt-get update
echo "installing shadowsocks... (2/5)"
apt-get install -y python-pip
echo "installing shadowsocks... (3/5)"
pip install --upgrade pip
echo "installing shadowsocks... (4/5)"
pip install distribute
echo "installing shadowsocks... (4/5)"
pip install shadowsocks
echo "check your ssconfigs"
vim /home/ss/ss-config.json +;

echo "installing shadowsocks... done"

echo "============================================"
echo "using following instructions to running ssserver"
echo "ssserver -c /home/ss/ss-config.json -d start"
echo "============================================"
echo "enjoy!"
