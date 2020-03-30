#!/usr/bin/expect

spawn su root
expect "密码："
send "ww0819\r"
send "rm -rf /home/wsj/k8s/k8s_grpc/yaml/* \r"
send "kubectl delete deployment nginx-deployment \r"
send "kubectl delete service nginx-service \r"


expect eof
exit