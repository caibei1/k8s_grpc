#!/usr/bin/expect

spawn su root
expect "密码："
send "ww0819\r"
send "./mv.sh\r"
send "cd /home/wsj/k8s/k8s_grpc/yaml\r"
send "kubectl apply -f mysql/mysql-volume.yaml \r"
send "kubectl create -v mysql/mysql-configmap.yaml \r"
send "kubectl create -v mysql/mysql-secret.yaml \r"
send "kubectl apply -f mysql/mysql-deployment.yaml \r"
send "kubectl apply -f mysql/mysql-service.yaml \r"

expect eof
exit