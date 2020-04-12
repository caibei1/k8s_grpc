#!/usr/bin/expect

spawn su root
expect "密码："
send "ww0819\r"
send "kubectl delete deployment mysql-test-deployment\r"
send "kubectl delete svc mysql-test-service \r"
send "kubectl create -f mysql-test-deployment.yaml\r"
send "kubectl create -f mysql-test-service.yaml\r"


expect eof
exit