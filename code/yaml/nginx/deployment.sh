#!/usr/bin/expect

spawn su root
expect "密码："
send "ww0819\r"
send "kubectl create -f nginx-deployment.yaml\r"
send "kubectl create -f nginx-service.yaml\r"


expect eof
exit