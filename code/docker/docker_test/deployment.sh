#!/usr/bin/expect

spawn su root
expect "密码："
send "ww0819\r"
send "kubectl delete deployment test-deployment\r"
send "kubectl delete svc test-service \r"
send "kubectl create -f test-deployment.yaml\r"
send "kubectl create -f test-service.yaml\r"


expect eof
exit