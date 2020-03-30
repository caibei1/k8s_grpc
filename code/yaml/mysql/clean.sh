#!/usr/bin/expect

spawn su root
expect "密码："
send "ww0819\r"
send "rm -rf /home/wsj/k8s/k8s_grpc/yaml/* \r"
send "kubectl delete deployment mysql-deployment \r"
send "kubectl delete service mysql-service \r"
send "kubectl delete pv mysql-pv \r"
send "kubectl delete configmap mysql-configmap \r"
send "kubectl delete secret mysql-secret\r"

expect eof
exit