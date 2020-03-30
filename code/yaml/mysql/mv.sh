#!/usr/bin/expect

spawn su root
expect "密码："
send "ww0819\r"
send "cp -r /home/wsj/go/src/github.com/caibei1/k8s_grpc/code/yaml/* /home/wsj/k8s/k8s_grpc/yaml \r"


expect eof
exit