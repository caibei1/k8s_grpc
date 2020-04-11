#!/usr/bin/expect

spawn su root
expect "密码："
send "ww0819\r"
send "kubectl delete deployment test-deployment\r"
send "kubectl delete svc test-service \r"



expect eof
exi