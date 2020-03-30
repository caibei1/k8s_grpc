#!/usr/bin/expect

spawn su root
expect "密码："
send "ww0819\r"
send "./mv.sh\r"
send "cd /home/wsj/k8s/k8s_grpc/yaml\r"
send "kubectl create -f nginx/nginx-deployment.yaml\r"
send "kubectl create -f nginx/nginx-service.yaml\r"


expect eof
exit