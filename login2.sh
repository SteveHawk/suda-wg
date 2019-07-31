#!/bin/bash
# --------------------------------------
# auto login for a.suda.edu.cn
# ---------------------------------------

# read username
if [ $# -ge 1 ]; then
    username=$1
else
    echo -n "please input username: "
    read username
fi

# read password
if [ $# -ge 2 ]; then
    password=$2
else
    echo -n "please input password: "
	read -s password
fi

# read if roaming
if [ $# -ge 3 ]; then
    roaming=$3
else
    echo -n -e "\nplease input if roaming (0/1): "
	read roaming
fi

password=`echo -n $password | base64`
login_url=http://a.suda.edu.cn/index.php/index/login

# login
html=$(curl $login_url -d "username="$username"&password="$password"&enablemacauth="$roaming)

# echo $html
